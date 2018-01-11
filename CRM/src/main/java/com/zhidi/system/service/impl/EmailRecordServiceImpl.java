package com.zhidi.system.service.impl;

import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.system.dao.IEmailRecordDao;
import com.zhidi.system.entity.EmailRecord;
import com.zhidi.system.service.IEmailRecordService;

@Service
public class EmailRecordServiceImpl extends BaseServiceImpl<EmailRecord> implements IEmailRecordService {
	private IEmailRecordDao emailRecordDao;

	

}
