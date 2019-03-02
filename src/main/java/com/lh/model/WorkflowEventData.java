package com.lh.model;

public class WorkflowEventData {
    private BusinessData businessData;
    private String currentUserAccount;

    public BusinessData getBusinessData() {
        return businessData;
    }

    public void setBusinessData(BusinessData businessData) {
        this.businessData = businessData;
    }

    public String getCurrentUserAccount() {
        return currentUserAccount;
    }

    public void setCurrentUserAccount(String currentUserAccount) {
        this.currentUserAccount = currentUserAccount;
    }
}
