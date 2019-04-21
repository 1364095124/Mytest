package com.lh.model;


public class MyTask {

    private String id; // 任务id
    private String name; // 任务名称
    private String createTime;  // 创建日期
    private String  endTime; // 结束日期
    private String applyName;//申请人
    private LeaveForm leaveForm; //

    public LeaveForm getLeaveForm() {
        return leaveForm;
    }

    public void setLeaveForm(LeaveForm leaveForm) {
        this.leaveForm = leaveForm;
    }

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getApplyName() {
        return applyName;
    }

    public void setApplyName(String applyName) {
        this.applyName = applyName;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
