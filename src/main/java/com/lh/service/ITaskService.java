package com.lh.service;

import com.lh.model.LeaveForm;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ITaskService {

    String addLeave(LeaveForm leaveForm);

    String queryLeave(LeaveForm leaveForm);

    String startApply(LeaveForm leaveForm);

    String addDeploy(MultipartFile file);
}
