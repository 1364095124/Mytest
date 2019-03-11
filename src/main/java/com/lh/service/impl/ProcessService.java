package com.lh.service.impl;

import com.lh.service.IProcessService;
import org.activiti.engine.*;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.InputStream;

@Service("processService")
public class ProcessService  implements IProcessService {

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
    @Override
    public void deploy() {

        repositoryService
                .createDeployment()
                .name("leave测试")
                .addClasspathResource("process/leave.bpmn")
                .addClasspathResource("process/leave.png")
                .deploy();
        ProcessInstance pi=runtimeService
                .startProcessInstanceByKey("leaveTest");
        System.out.println("pid:" + pi.getId());
    }
}
