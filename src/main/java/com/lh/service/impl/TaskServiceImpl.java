package com.lh.service.impl;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.dao.TaskMapper;
import com.lh.model.LeaveForm;
import com.lh.model.User;
import com.lh.service.ITaskService;
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
import java.util.Map;
import java.util.zip.ZipInputStream;

@Service("taskService")
public class TaskServiceImpl implements ITaskService {


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
    private TaskMapper taskMapper;

    @Override
    public String addLeave(LeaveForm leaveForm) {
        return null;
    }

    @Override
    public String queryLeave(LeaveForm leaveForm) {
        return null;
    }

    @Override
    public String startApply(LeaveForm leaveForm) {
        JSONObject result=new JSONObject();
        User user=(User) SecurityUtils.getSubject().getPrincipal();
        leaveForm.setAccount(user.getAccount());
        SimpleDateFormat fm=new SimpleDateFormat("yyyy-MM-dd");
        leaveForm.setInit_time(fm.format(new Date()));
        if(taskMapper.addLeave(leaveForm)>0){
            LeaveForm leaveForm1=taskMapper.queryLeave(leaveForm).get(0);
            Map<String,Object> variables=new HashMap<String,Object>();
            variables.put("leaveId", leaveForm1.getLeave_id());
            // 启动流程
            ProcessInstance pi= runtimeService.startProcessInstanceByKey("leaveTest",variables);
            // 根据流程实例Id查询任务
            Task task=taskService.createTaskQuery().processInstanceId(pi.getProcessInstanceId()).singleResult();
            // 完成 学生填写请假单任务
            taskService.complete(task.getId());
            leaveForm.setProcessInstanceId(pi.getProcessInstanceId());
            if(taskMapper.updateLeave(leaveForm)>0){
                result.put("state","200");
                result.put("message","发起成功");
            }else{
                result.put("state","500");
                result.put("message","更新数据库失败");
            }

        }else{
            result.put("state","500");
            result.put("message","新增申请表异常");
        }
        return JSON.toJSONString(result);
    }

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
}
