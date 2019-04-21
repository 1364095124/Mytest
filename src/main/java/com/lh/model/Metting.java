package com.lh.model;

/**
 * 会议类
 */
public class Metting {
    private String id; //主键
    private String title; //标题
    private String note; //备注
    private String address; //开会地点
    private String tiggerTime; //开会时间
    private String createAccount; //创建者账号
    private String createName; //创建者姓名
    private Integer isDeleted;     //是否删除

    public String getCreateName() {
        return createName;
    }

    public void setCreateName(String createName) {
        this.createName = createName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTiggerTime() {
        return tiggerTime;
    }

    public void setTiggerTime(String tiggerTime) {
        this.tiggerTime = tiggerTime;
    }

    public String getCreateAccount() {
        return createAccount;
    }

    public void setCreateAccount(String createAccount) {
        this.createAccount = createAccount;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }
}
