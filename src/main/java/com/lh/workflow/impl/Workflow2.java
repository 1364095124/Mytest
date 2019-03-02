package com.lh.workflow.impl;

import com.lh.workflow.BaseWorkflow;

public class Workflow2 extends BaseWorkflow {
    @Override
    public String getId() {
        return "secendflow";
    }

    @Override
    public String getName() {
        return "第二个项目";
    }
}
