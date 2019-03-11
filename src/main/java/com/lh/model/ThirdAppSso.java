package com.lh.model;


/**
 * 第三方应用单点登陆配置类
 */
public class ThirdAppSso {
    private String id; //主键
    private String thirdAppNumber;  //第三方应用编码
    private String thirdAppName;  //第三方应用名称
    private String sso_url; //单点登陆地址
    private Integer isDisabled;  //是否禁用
    private Integer isDeleted;  //是否删除

    public String getThirdAppName() {
        return thirdAppName;
    }

    public void setThirdAppName(String thirdAppName) {
        this.thirdAppName = thirdAppName;
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

    public String getSso_url() {
        return sso_url;
    }

    public void setSso_url(String sso_url) {
        this.sso_url = sso_url;
    }

    public Integer getIsDisabled() {
        return isDisabled;
    }

    public void setIsDisabled(Integer isDisabled) {
        this.isDisabled = isDisabled;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }
}
