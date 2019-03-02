package com.lh.model;

public class ThirdAppSso {
    private String id;
    private String thirdAppNumber;
    private String thirdAppName;
    private String sso_url;
    private Integer isDisabled;
    private Integer isDeleted;

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
