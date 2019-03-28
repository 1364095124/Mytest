package com.lh.service.impl;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.dao.LeaveMapper;
import com.lh.model.LeaveForm;
import com.lh.model.Page;
import com.lh.model.ResultMap;
import com.lh.model.User;
import com.lh.service.ILeaveService;
import org.activiti.engine.*;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

@Service("leaveService")
public class LeaveServiceImpl implements ILeaveService {


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


    /**
     * 手动部署流程
     * @param name
     * @param bpmn
     * @param png
     * @param key
     */
    @Override
    public void deploy(String name,String bpmn,String png,String key) {

        repositoryService
                .createDeployment()
                .name(name)
                .addClasspathResource(bpmn)
                .addClasspathResource(png)
                .deploy();
        ProcessInstance pi=runtimeService
                .startProcessInstanceByKey(key);
        System.out.println("pid:" + pi.getId());
    }




    @Override
    public String queryLeaveById(String leave_id) {
        return null;
    }

    /**
     * 分页查询业务
     * @param page
     * @param limit
     * @return
     */
    @Override
    public ResultMap<List<LeaveForm>> queryLeave(Page page, Integer limit) {

        page.setRows(limit);
        List<LeaveForm> contentList=leaveMapper.selectLeaveList(page);
        int totals=leaveMapper.selectLeavePage(page);
        return new ResultMap<List<LeaveForm>>("",contentList,0,totals);
    }

    /**
     * 分页查询存为草稿的申请
     * @param page
     * @param limit
     * @return
     */
    @Override
    public ResultMap<List<LeaveForm>> queryTrashLeave(Page page, Integer limit) {
        page.setRows(limit);
        List<LeaveForm> contentList=leaveMapper.selectTrashLeave(page);
        int totals=leaveMapper.selectTrashPage(page);
        return new ResultMap<List<LeaveForm>>("",contentList,0,totals);
    }


    /**
     * 新增申请单并自动发起
     * @param leaveForm
     * @return
     */
    @Override
    public String autoStartApply(LeaveForm leaveForm) {
        JSONObject result=new JSONObject();
        User user=(User) SecurityUtils.getSubject().getPrincipal();
        leaveForm.setAccount(user.getAccount());
        SimpleDateFormat fm=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        leaveForm.setApplyTime(fm.format(new Date()));
        leaveForm.setState("编辑中");
        if(leaveMapper.addLeave(leaveForm)>0){
            LeaveForm leaveForm1=leaveMapper.queryLeave(leaveForm).get(0);
            Map<String,Object> variables=new HashMap<String,Object>();
            variables.put("leaveId", leaveForm1.getLeave_id());
            variables.put("account",leaveForm1.getAccount());
            // 启动流程
            ProcessInstance pi= runtimeService.startProcessInstanceByKey("leaveTest",variables);
            // 根据流程实例Id查询任务
            Task task=taskService.createTaskQuery().processInstanceId(pi.getProcessInstanceId()).singleResult();
            // 完成 学生填写请假单任务
            taskService.complete(task.getId());
            leaveForm1.setProcessInstanceId(pi.getProcessInstanceId());
            leaveForm1.setState("审核中");
            if(leaveMapper.updateLeave(leaveForm1)>0){
                result.put("success",true);
                result.put("msg","发起成功");
            }else{
                result.put("success",false);
                result.put("message","更新数据库失败");
            }

        }else{
            result.put("success",false);
            result.put("msg","新增申请表异常");
        }
        return JSON.toJSONString(result);
    }

    /**
     * 上传并部署新流程
     * @param file
     * @return
     */
    @Override
    public String addDeploy(MultipartFile file) {
        JSONObject result=new JSONObject();
        try {
            repositoryService.createDeployment() //创建部署
                    .name(file.getOriginalFilename())	//需要部署流程名称
                    .addZipInputStream(new ZipInputStream(file.getInputStream()))//添加ZIP输入流
                    .deploy();//开始部署
            result.put("success", true);
            result.put("msg","成功");
        } catch (IOException e) {
            result.put("success", false);
            result.put("msg","失败");
            e.printStackTrace();
        }

        return JSON.toJSONString(result);
    }

    /**
     * 提交申请单
     * @param leave_id
     * @return
     */
    @Override
    public String startApply(String leave_id,String account){
        JSONObject result=new JSONObject();
        Map<String,Object> variables=new HashMap<String,Object>();
        variables.put("leaveId", leave_id);
        variables.put("account",account);
        // 启动流程
        ProcessInstance pi= runtimeService.startProcessInstanceByKey("LeaveExpense",variables);
        // 根据流程实例Id查询任务
        Task task=taskService.createTaskQuery().processInstanceId(pi.getProcessInstanceId()).singleResult();
        // 完成 学生填写请假单任务
        taskService.complete(task.getId());
        LeaveForm leaveForm=new LeaveForm();
        leaveForm.setLeave_id(leave_id);
        leaveForm.setState("审核中");
        leaveForm.setProcessInstanceId(pi.getProcessInstanceId());
        leaveMapper.updateLeave(leaveForm);
        return JSON.toJSONString(result);
    }

    /**
     * 保存申请单
     * @param leaveForm
     * @return
     */
    @Override
    public String save(LeaveForm leaveForm) {
        JSONObject result=new JSONObject();
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        leaveForm.setApplyTime(sf.format(new Date()));
        if(leaveMapper.addLeave(leaveForm)>0){
            result.put("success",true);
            result.put("msg","");
        }
        else{
            result.put("success",false);
            result.put("msg","新增申请单失败！");
        }
        return JSON.toJSONString(result);
    }
}
