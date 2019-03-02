package com.lh.model;

public class MailParameters {

    private String senderAddress;//发送者地址
    private String recipientAddress;//接收者地址
    private String senderAccount;//qq邮箱
    private String senderPassword;//ghlggflzzsayijcc密钥
    private String mailSubject;//主题
    private String mailContent;//内容
    private String fileAbsolutePosition;//附件的绝对路径

    public String getSenderAddress() {
        return senderAddress;
    }

    public void setSenderAddress(String senderAddress) {
        this.senderAddress = senderAddress;
    }

    public String getRecipientAddress() {
        return recipientAddress;
    }

    public void setRecipientAddress(String recipientAddress) {
        this.recipientAddress = recipientAddress;
    }

    public String getSenderAccount() {
        return senderAccount;
    }

    public void setSenderAccount(String senderAccount) {
        this.senderAccount = senderAccount;
    }

    public String getSenderPassword() {
        return senderPassword;
    }

    public void setSenderPassword(String senderPassword) {
        this.senderPassword = senderPassword;
    }

    public String getMailSubject() {
        return mailSubject;
    }

    public void setMailSubject(String mailSubject) {
        this.mailSubject = mailSubject;
    }

    public String getMailContent() {
        return mailContent;
    }

    public void setMailContent(String mailContent) {
        this.mailContent = mailContent;
    }

    public String getFileAbsolutePosition() {
        return fileAbsolutePosition;
    }

    public void setFileAbsolutePosition(String fileAbsolutePosition) {
        this.fileAbsolutePosition = fileAbsolutePosition;
    }
}

