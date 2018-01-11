package com.zhidi.system.entity;

import java.util.Date;

public class EmailRecord {
    private Integer emailRecordId;

    private Integer userId;

    private String toAddr;

    private String subject;

    private Date sendTime;

    private Integer status;

    private String content;
    
    private User user;

    
    
    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getEmailRecordId() {
        return emailRecordId;
    }

    public void setEmailRecordId(Integer emailRecordId) {
        this.emailRecordId = emailRecordId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getToAddr() {
        return toAddr;
    }

    public void setToAddr(String toAddr) {
        this.toAddr = toAddr == null ? null : toAddr.trim();
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject == null ? null : subject.trim();
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}