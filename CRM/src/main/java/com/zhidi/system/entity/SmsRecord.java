package com.zhidi.system.entity;

import java.util.Date;

public class SmsRecord {
    private Integer smsRecordId;

    private Integer userId;

    private String telephone;

    private Date sendTime;

    private String content;
    
    private User user;

    public Integer getSmsRecordId() {
        return smsRecordId;
    }

    public void setSmsRecordId(Integer smsRecordId) {
        this.smsRecordId = smsRecordId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
    
    
}