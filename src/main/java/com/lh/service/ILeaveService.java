package com.lh.service;

import com.lh.model.LeaveForm;
import com.lh.model.Page;
import com.lh.model.ResultMap;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ILeaveService {


    void deploy(String name,String bpmn,String png,String key);

    ResultMap<List<LeaveForm>> queryLeave(Page page, Integer limit);

    ResultMap<List<LeaveForm>> queryTrashLeave(Page page,Integer limit);

    String queryLeaveById(String leave_id);

    String autoStartApply(LeaveForm leaveForm);

    String addDeploy(MultipartFile file);

    String save(LeaveForm leaveForm);

    String startApply(String leave_id,String account);

    


}
