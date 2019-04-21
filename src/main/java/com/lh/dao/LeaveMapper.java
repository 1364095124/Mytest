package com.lh.dao;

import com.lh.model.LeaveForm;
import com.lh.model.Page;
import com.lh.model.TaskList;


import java.util.List;

public interface LeaveMapper {

     LeaveForm queryLeaveById(String leave_id);

     LeaveForm queryLeaveByPid(String processInstanceId);

     List<LeaveForm> queryLeave(LeaveForm leaveForm);

     Integer updateLeave(LeaveForm leaveForm);

     Integer addLeave(LeaveForm leaveForm);

     Integer deleteLeave(String leave_id);

     List<LeaveForm> selectLeaveList(Page page);

     Integer selectLeavePage(Page page);

     List<LeaveForm> selectTrashLeave(Page page);

     Integer selectTrashPage(Page page);

     List<TaskList> getAllTaskList();

     Integer queryTaskCount();



}
