package com.zhidi.system.service;



public interface IEmailService {
	
	boolean sendHtmlEmail(String[] to,String from,String subject,String content);
	boolean sendTextEmail(String[] to,String from,String subject,String content);
	
}
