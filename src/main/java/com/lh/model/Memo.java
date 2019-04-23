package com.lh.model;

/**
 * 备忘录类
 */
public class Memo {
    private String id; //主键
    private String account; //账户
    private String title; //标题
    private String content;  //内容
    private String tigger_Time; //触发时间
    private Integer isRead; //是否已读
    private Integer isDeleted;//是否删除

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTigger_Time() {
        return tigger_Time;
    }

    public void setTigger_Time(String tigger_Time) {
        this.tigger_Time = tigger_Time;
    }

    public Integer getIsRead() {
        return isRead;
    }

    public void setIsRead(Integer isRead) {
        this.isRead = isRead;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }
}
