package com.lh.workflow.impl;

import com.lh.model.WorkflowEventData;
import com.lh.model.WorkflowEventResult;
import com.lh.workflow.BaseWorkflow;

public class Workflow1 extends BaseWorkflow {
    @Override
    public String getId() {
        return "firstflow";
    }

    @Override
    public String getName() {
        return "第一个流程";
    }

    @Override
    public WorkflowEventResult onBeforeStart(WorkflowEventData data) {
        WorkflowEventResult result=new WorkflowEventResult();
        result.setAlertMessage("你好");


        return result;
    }


}
