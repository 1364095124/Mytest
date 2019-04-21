package com.lh.service;

import com.lh.model.Page;

import javax.servlet.http.HttpServletResponse;

public interface IMyTaskService {

    String daibanTask(Page page,Integer limit);

    void getActivitiProccessImage(String pProcessInstanceId, HttpServletResponse response) throws Exception;

    String audit_bz(String taskId,String comment,Integer state);

    String listHistoryCommentByPid(String processInstanceId);

    String listHistoryCommentByTid(String taskId);
}
