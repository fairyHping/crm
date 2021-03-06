package com.zhidi.system.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhidi.common.result.JsonResult;
import com.zhidi.system.entity.EmailRecord;
import com.zhidi.system.entity.User;
import com.zhidi.system.service.IEmailRecordService;
import com.zhidi.system.service.IEmailService;

@RequestMapping("/system/sale")
@Controller
public class EmailRecordController {
	@Autowired
	private IEmailService emailService;
	
	@Autowired
	private IEmailRecordService emailRecordService;
	
	/**
	 * 返回到发送邮件的页面
	 * @return
	 */
	@GetMapping("/email")
	public String list(){
		return "system/marketing/sendEmailRecord";
	}
	
	/**
	 * 处理发送邮件的请求
	 * @param emailRecord
	 * @param to
	 * @param emailId
	 * @param subject
	 * @param content
	 * @param session
	 * @return
	 */
	@PostMapping("/sendEmail")
	@ResponseBody
	public JsonResult sendEmail(EmailRecord emailRecord,String to, String emailId, String subject, String content,HttpSession session){
		//获取发送人
		User user=(User)session.getAttribute("user");
		emailRecord.setUserId(user.getUserId());
		
		emailRecord.setStatus(1);
		emailRecord.setToAddr(to);
		emailRecord.setSendTime(new Date());
		emailRecord.setSubject(subject);
		emailRecord.setContent(content);
		//调用方法发送邮件
		String[] toAddr=to.split(",");
		Boolean b=emailService.sendTextEmail(toAddr,"test@zhidisoft.com", subject, content);
		if (b) {
			emailRecordService.save(emailRecord);
			return JsonResult.buildSuccessResult("发送成功");
		}
		return JsonResult.buildSuccessResult("发送失败");
	}
}
