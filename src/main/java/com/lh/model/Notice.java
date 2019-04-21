package com.lh.model;

/**
 * 公告类
 */
public class Notice {
    private String id; //主键
    private String title; //标题
    private String content; //内容
    private String createAccount; //创建者账号
    private String createName; //创建者姓名
    private String tiggerTime; //过期时间
    private Integer isDeleted; //是否删除

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateAccount() {
        return createAccount;
    }

    public void setCreateAccount(String createAccount) {
        this.createAccount = createAccount;
    }

    public String getCreateName() {
        return createName;
    }

    public void setCreateName(String createName) {
        this.createName = createName;
    }


    public String getTiggerTime() {
        return tiggerTime;
    }

    public void setTiggerTime(String tiggerTime) {
        this.tiggerTime = tiggerTime;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }
}
