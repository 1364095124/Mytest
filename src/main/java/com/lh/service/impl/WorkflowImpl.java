package com.lh.service.impl;

import com.lh.dao.WorkflowMapper;
import com.lh.model.Workflow;
import com.lh.service.IWorkflowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("workflowService")
public class WorkflowImpl implements IWorkflowService {

    @Autowired
    private WorkflowMapper workflowMapper;

    @Override
    public int insert(Workflow workflow) {
        return workflowMapper.insert(workflow);
    }

    @Override
    public List<Workflow> select(Workflow workflow) {
        return workflowMapper.select(workflow);
    }
}
