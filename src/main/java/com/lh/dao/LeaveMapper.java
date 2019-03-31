package com.lh.dao;

import com.lh.model.LeaveForm;
import com.lh.model.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LeaveMapper {

    public LeaveForm queryLeaveById(String leave_id);

    public LeaveForm queryLeaveByPid(String processInstanceId);

    public List<LeaveForm> queryLeave(LeaveForm leaveForm);

    public Integer updateLeave(LeaveForm leaveForm);

    public Integer addLeave(LeaveForm leaveForm);

    public Integer deleteLeave(String leave_id);

    public List<LeaveForm> selectLeaveList(Page page);

    public Integer selectLeavePage(Page page);

    public List<LeaveForm> selectTrashLeave(Page page);

    public Integer selectTrashPage(Page page);
}
