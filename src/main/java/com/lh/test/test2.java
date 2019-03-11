package com.lh.test;

import org.activiti.engine.*;
import org.activiti.engine.runtime.ProcessInstance;
import org.junit.Test;

import javax.annotation.Resource;
import java.io.InputStream;

public class test2 {
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

    @Test
    public void Deploay(){
        InputStream inputBpmn=this.getClass().getResourceAsStream("/process/leave.bpmn");
        InputStream inputPng=this.getClass().getResourceAsStream("/process/leave.png");
        repositoryService
                .createDeployment()
                .addInputStream("userTask.bpmn",inputBpmn)
                .addInputStream("userTask.png",inputPng)
                .deploy();
        ProcessInstance pi=runtimeService
                .startProcessInstanceByKey("leave");
        System.out.println("pid:" + pi.getId());
    }
}
