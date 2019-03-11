package com.lh.model;


/**
 * 表单类
 */
public class LeaveForm {

    private String leave_id; //id主键
    private String department_Name; //部门名称
    private String account;  //申请人账号
    private String start_place; //出差开始地点
    private String end_place;  //出差结束地点
    private String start_time; //出差开始时间
    private String end_time; //出差结束时间
    private String init_time;  //表单发起时间
    private String type;  //报销类型
    private float sum;  //报销总金额
    private String note;  //报销项目详细
    private String state;  //是否审核
    private String processInstanceId; // 流程实例Id
    private Integer isDeleted;  //是否删除

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public float getSum() {
        return sum;
    }

    public void setSum(float sum) {
        this.sum = sum;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public String getInit_time() {
        return init_time;
    }

    public void setInit_time(String init_time) {
        this.init_time = init_time;
    }



    public String getLeave_id() {
        return leave_id;
    }

    public void setLeave_id(String leave_id) {
        this.leave_id = leave_id;
    }


    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }



    public String getDepartment_Name() {
        return department_Name;
    }

    public void setDepartment_Name(String department_Name) {
        this.department_Name = department_Name;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getStart_place() {
        return start_place;
    }

    public void setStart_place(String start_place) {
        this.start_place = start_place;
    }

    public String getEnd_place() {
        return end_place;
    }

    public void setEnd_place(String end_place) {
        this.end_place = end_place;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }





    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }


}
