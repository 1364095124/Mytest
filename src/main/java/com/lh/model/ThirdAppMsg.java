package com.lh.model;


/**
 * 第三方应用消息集成配置类
 */
public class ThirdAppMsg {
    private String id;  //主键
    private String thirdAppNumber;  //第三方应用的注册码
    private int type;  //获取消息类型  0表示“第三方推送”，1表示“获取第三方”
    private String requireTime;  //获取第三方消息的间隔
    private String msg_url;  //消息链接路径
    private int isDisabled;  //是否禁用
    private int isDeleted;  //是否删除

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getThirdAppNumber() {
        return thirdAppNumber;
    }

    public void setThirdAppNumber(String thirdAppNumber) {
        this.thirdAppNumber = thirdAppNumber;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getRequireTime() {
        return requireTime;
    }

    public void setRequireTime(String requireTime) {
        this.requireTime = requireTime;
    }

    public String getMsg_url() {
        return msg_url;
    }

    public void setMsg_url(String msg_url) {
        this.msg_url = msg_url;
    }

    public int getIsDisabled() {
        return isDisabled;
    }

    public void setIsDisabled(int isDisabled) {
        this.isDisabled = isDisabled;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }
}
