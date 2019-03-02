package com.lh.workflow;


import com.lh.model.WorkflowEventData;
import com.lh.model.WorkflowEventResult;

public abstract class BaseWorkflow {

    public abstract String getId();

    public abstract String getName();

    //结束后
    public void onFinishWorkitem(WorkflowEventData data) {

    }

    //发起前
    public WorkflowEventResult onBeforeStart(WorkflowEventData data) {
        return null;
    }

    //结束前
    public WorkflowEventResult onBeforeFinishWorkitem(WorkflowEventData data) {
        return null;
    }
}
