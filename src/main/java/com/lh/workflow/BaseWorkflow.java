package com.lh.workflow;



import com.lh.model.WorkflowEventResult;

public abstract class BaseWorkflow {

    public abstract String getId();

    public abstract String getName();

    //结束后
    public void onFinishWorkitem(String data) {

    }

    //发起前
    public WorkflowEventResult onBeforeStart(String data) {
        return null;
    }

    //结束前
    public WorkflowEventResult onBeforeFinishWorkitem(String data) {
        return null;
    }
}
