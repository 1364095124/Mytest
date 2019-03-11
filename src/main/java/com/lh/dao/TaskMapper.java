package com.lh.dao;

import com.lh.model.LeaveForm;

import java.util.List;

public interface TaskMapper {

    public List<LeaveForm> queryLeave(LeaveForm leaveForm);

    public Integer updateLeave(LeaveForm leaveForm);

    public Integer addLeave(LeaveForm leaveForm);

    public Integer deleteLeave(String leave_id);
}
