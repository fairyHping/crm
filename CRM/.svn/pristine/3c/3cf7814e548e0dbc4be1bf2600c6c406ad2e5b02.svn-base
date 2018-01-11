package com.zhidi.system.service.impl;

import java.io.UnsupportedEncodingException;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.ImageHtmlEmail;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.zhidi.base.exception.BaseException;
import com.zhidi.system.service.IEmailService;
@Service
public class EmailServiceImpl implements IEmailService{
	@Value("${email.server.host}")
	private String serverHost;//smtp服务器地址
	
	@Value("${email.server.port}") 
	private String serverPort;//设置端口号
	
	@Value ("${email.server.username}")
	private String serverUsername;//设置邮件账号
	
	@Value("${email.server.password}")
	private String serverPassword;//设置账号密码
	
	@Value("${email.server.ssl}")
	private boolean ssl;//设置本次邮件发送的SSL通道
	
	
	@Override
	public boolean sendHtmlEmail(String[] to, String from, String subject,
			String content) {
		ImageHtmlEmail email=new ImageHtmlEmail();
		email.setHostName(serverHost);
		email.setSslSmtpPort(serverPort);//qq 163
		email.setAuthentication(serverUsername, serverPassword);//505886138@qq.com
		email.setSSLOnConnect(ssl);
		email.setSubject(subject);
		try {
			email.addTo(to);
			email.setFrom(from);
			email.setHtmlMsg(new String(content.getBytes("UTF-8"),"ISO8859-1"));
			email.send();
			return true;
		} catch (EmailException e) {		
			e.printStackTrace();
			
			throw new BaseException("邮件发送失败",e);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
	
			throw new BaseException("邮件发送失败",e);
		}
	
		
		
	}

	@Override
	public boolean sendTextEmail(String[] to, String from, String subject,
			String content) {
		ImageHtmlEmail email = new ImageHtmlEmail();
		email.setHostName(serverHost);
		email.setSslSmtpPort(serverPort);
		email.setAuthentication(serverUsername, serverPassword);
		email.setSSLOnConnect(true);
		email.setSubject(subject);
		
		try {
			email.addTo(to);
			email.setFrom(from);
			email.setMsg(content);
			email.send();
			return true;
		} catch (EmailException e) {		
			e.printStackTrace();
			throw new BaseException("邮件发送失败",e);
			
		} 
	}

}
