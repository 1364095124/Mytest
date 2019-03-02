package com.lh.dao;

import com.lh.model.Workflow;

import java.util.List;

public interface WorkflowMapper {

    /*
    @Param Workflow 工作流相关信息
    新增工作流信息
     */
    public int insert(Workflow workflow);

    /*
    @Param Workflow 工作流相关信息
    查找特定的工作流
     */
    public List<Workflow> select(Workflow workflow);
}
