package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.common.ProcessDiagramGenerator;
import com.lh.dao.LeaveMapper;
import com.lh.dao.OrgMapper;
import com.lh.model.*;
import com.lh.service.IMyTaskService;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Service("myTaskService")
public class MyTaskServiceImpl implements IMyTaskService {

    private static Log logger = LogFactory.getLog(MyTaskServiceImpl.class);
    // 引入activiti自带的Service接口
    @Resource
    private TaskService taskService;

    @Resource
    private RepositoryService repositoryService;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private FormService formService;


    @Resource
    private HistoryService historyService;

    @Autowired
    private LeaveMapper leaveMapper;

    @Autowired
    private OrgMapper orgMapper;

    /**
     *  分页查询代办
     * @param page
     * @param limit
     * @return
     */
    @Override
    public String daibanTask(Page page,Integer limit) {
        PersonJob personJob=orgMapper.queryJobInfoByAccount(page.getAccount());
        String groupId=personJob.getDepartmentName()+"_"+personJob.getJobName();
        page.setRows(limit);
        long total=taskService.createTaskQuery()
                .taskCandidateGroup(groupId)
                .count(); // 获取总记录数
        List<Task> taskList=taskService.createTaskQuery()
                // 根据用户id查询
                .taskCandidateGroup(groupId)
                // 根据任务名称查询

                // 返回带分页的结果集合
                .listPage(page.getStart(), page.getRows());
        List<MyTask> MyTaskList=new ArrayList<MyTask>();
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(Task t:taskList){
            MyTask myTask=new MyTask();
            myTask.setId(t.getId());
            myTask.setName(t.getName());
            myTask.setCreateTime(sf.format(t.getCreateTime()));
            String leaveId=(String) taskService.getVariable(t.getId(), "leaveId");
            LeaveForm leaveForm=leaveMapper.queryLeaveById(leaveId);
            myTask.setLeaveForm(leaveForm);
            myTask.setApplyName(leaveForm.getAccount());
            MyTaskList.add(myTask);
        }
        return JSON.toJSONString(new ResultMap<List<MyTask>>("",MyTaskList,
                0,Integer.parseInt(String.valueOf(total))));
    }

    @Override
    public void getActivitiProccessImage(String pProcessInstanceId, HttpServletResponse response) throws Exception{
        logger.info("[开始]-获取流程图图像");
        // 设置页面不缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        try {
            //  获取历史流程实例
            HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery()
                    .processInstanceId(pProcessInstanceId).singleResult();

            if (historicProcessInstance == null) {
                throw new Exception("获取流程实例ID[" + pProcessInstanceId + "]对应的历史流程实例失败！");
            } else {
                // 获取流程定义
                ProcessDefinitionEntity processDefinition = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService)
                        .getDeployedProcessDefinition(historicProcessInstance.getProcessDefinitionId());

                // 获取流程历史中已执行节点，并按照节点在流程中执行先后顺序排序
                List<HistoricActivityInstance> historicActivityInstanceList = historyService.createHistoricActivityInstanceQuery()
                        .processInstanceId(pProcessInstanceId).orderByHistoricActivityInstanceId().asc().list();

                // 已执行的节点ID集合
                List<String> executedActivityIdList = new ArrayList<String>();
                int index = 1;
                logger.info("获取已经执行的节点ID");
                for (HistoricActivityInstance activityInstance : historicActivityInstanceList) {
                    executedActivityIdList.add(activityInstance.getActivityId());
                    logger.info("第[" + index + "]个已执行节点=" + activityInstance.getActivityId() + " : " +activityInstance.getActivityName());
                    index++;
                }

                // 获取流程图图像字符流
                InputStream imageStream = ProcessDiagramGenerator.generateDiagram(processDefinition, "png", executedActivityIdList);

                response.setContentType("image/png");
                OutputStream os = response.getOutputStream();
                int bytesRead = 0;
                byte[] buffer = new byte[8192];
                while ((bytesRead = imageStream.read(buffer, 0, 8192)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
                os.close();
                imageStream.close();
            }
            logger.info("[完成]-获取流程图图像");
        } catch (Exception e) {
            logger.error("【异常】-获取流程图失败！" + e.getMessage());
            throw new Exception("获取流程图失败！" + e.getMessage());
        }
    }

    /**
     * 审核
     * @param taskId 任务id
     * @param comment 评论
     * @param state 审批状态
     * @return
     */
    @Override
    public String audit_bz(String taskId, String comment,Integer state) {
        JSONObject rs=new JSONObject();
        //首先根据ID查询任务
        Task task=taskService.createTaskQuery() // 创建任务查询
                .taskId(taskId) // 根据任务id查询
                .singleResult();
        Map<String,Object> variables=new HashMap<String,Object>();
        User user=(User) SecurityUtils.getSubject().getPrincipal();
        PersonJob personJob=orgMapper.queryJobInfoByAccount(user.getAccount());
        String groupId=personJob.getDepartmentName()+"_"+personJob.getJobName();
        if("财务部_部门主管".equals(groupId)||"总经理_总经理".equals(groupId)){
            if(state==1){
                String leaveId=(String) taskService.getVariable(taskId, "leaveId");
                LeaveForm leaveForm=leaveMapper.queryLeaveById(leaveId);
                leaveForm.setState("审核通过");
                if(leaveMapper.updateLeave(leaveForm)<=0){
                    rs.put("success",false);
                    rs.put("msg","更新leaveforms数据库失败！");
                }
            }else{
                String leaveId=(String) taskService.getVariable(taskId, "leaveId");
                LeaveForm leaveForm=leaveMapper.queryLeaveById(leaveId);
                leaveForm.setState("审核未通过");
                if(leaveMapper.updateLeave(leaveForm)<=0){
                    rs.put("success",false);
                    rs.put("msg","更新leaveforms数据库失败！");
                }

            }
        }
        if(state==1){
            variables.put("msg", "同意");
        }else{
            String leaveId=(String) taskService.getVariable(taskId, "leaveId");
            LeaveForm leaveForm=leaveMapper.queryLeaveById(leaveId);
            leaveForm.setState("审核未通过");
            variables.put("msg", "不同意");
            if(leaveMapper.updateLeave(leaveForm)<=0){
                rs.put("success",false);
                rs.put("msg","更新leaveforms数据库失败！");

            }
        }
        // 获取流程实例id
        String processInstanceId=task.getProcessInstanceId();
        // 设置用户id
        Authentication.setAuthenticatedUserId(personJob.getName()+"["+personJob.getJobName()+"]");
        // 添加批注信息
        taskService.addComment(taskId, processInstanceId, comment);
        // 完成任务
        taskService.complete(taskId, variables);
        rs.put("success",true);
        rs.put("msg","");
        return JSON.toJSONString(rs);
    }

    /**
     * 根据processInstanceId查询历史批注
     * @param processInstanceId
     * @return
     */
    @Override
    public String listHistoryCommentByPid(String processInstanceId) {
        if(processInstanceId==null){
            return null;
        }


        List<Comment> commentList = taskService
                .getProcessInstanceComments(processInstanceId);
        // 改变顺序，按原顺序的反向顺序返回list
        Collections.reverse(commentList); //集合元素反转
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<MyComment> list=new ArrayList<>();

        for(Comment c:commentList){
            MyComment myComment=new MyComment();
            myComment.setComment(c.getFullMessage());
            myComment.setcTime(sf.format(c.getTime()));
            myComment.setName(c.getUserId());
            list.add(myComment);
        }
        return JSON.toJSONString(list);
    }

    /**
     * 根据taskId查询批注信息
     * @param taskId
     * @return
     */
    @Override
    public String listHistoryCommentByTid(String taskId) {
        if(taskId==null){
            taskId="";
        }
        HistoricTaskInstance hti=historyService.createHistoricTaskInstanceQuery()
                .taskId(taskId)
                .singleResult();
        List<Comment> commentList=null;
        if(hti!=null){
            commentList=taskService.getProcessInstanceComments(hti.getProcessInstanceId());
            // 集合元素反转
            Collections.reverse(commentList);
            //做数据筛选，减轻前端的压力
            List<MyComment> list=new ArrayList<>();
            SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            MyComment myComment=new MyComment();
            for(Comment c:commentList){
                myComment.setComment(c.getFullMessage());
                myComment.setcTime(sf.format(c.getTime()));
                myComment.setName(c.getUserId());
                list.add(myComment);
            }
            return JSON.toJSONString(list);

        }else{
            return null;
        }

    }


}
