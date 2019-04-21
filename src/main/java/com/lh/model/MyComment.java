package com.lh.model;

/**
 * 自定义批注类
 */
public class MyComment {
    private String cTime; //批注时间
    private String name; //批注人信息;
    private String comment; //批注内容

    public String getcTime() {
        return cTime;
    }

    public void setcTime(String cTime) {
        this.cTime = cTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
