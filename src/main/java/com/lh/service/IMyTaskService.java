package com.lh.service;

import com.lh.model.MyTask;
import com.lh.model.Page;
import com.lh.model.ResultMap;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface IMyTaskService {

    String daibanTask(Page page,Integer limit);

    void getActivitiProccessImage(String pProcessInstanceId, HttpServletResponse response) throws Exception;

    String audit_bz(String taskId,String comment,Integer state);

    String listHistoryCommentByPid(String processInstanceId);

    String listHistoryCommentByTid(String taskId);

    String queryNewCount();

    ResultMap<List<MyTask>> yibanTask();


}
