package com.lh.model;


/**
 * 第三方应用代办集成配置类
 */
public class ThirdAppPending {
    private String id;  //主键
    private String thirdAppNumber;  //第三方应用编码
    private int type;  //获取代办类型  0表示第三方推送  1表示从第三方代办抓取
    private int requireTime;  //获取代办的时间间隔
    private String pending_url; //代办链接地址
    private int isDisabled;  //是否禁用
    private int isDeleted;  //是否删除

    public int getRequireTime() {
        return requireTime;
    }

    public void setRequireTime(int requireTime) {
        this.requireTime = requireTime;
    }

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



    public String getPending_url() {
        return pending_url;
    }

    public void setPending_url(String pending_url) {
        this.pending_url = pending_url;
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
