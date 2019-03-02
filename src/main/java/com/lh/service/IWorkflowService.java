package com.lh.service;

import com.lh.model.Workflow;

import java.util.List;

public interface IWorkflowService {
    public int insert(Workflow workflow);

    public List<Workflow> select(Workflow workflow);
}
