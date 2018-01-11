package com.zhidi.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.system.dao.IBusinessCustomerDao;
import com.zhidi.system.entity.BusinessCustomer;
import com.zhidi.system.service.IBusinessCustomerService;
@Service
public class BusinessCustomerServiceImpl extends BaseServiceImpl<BusinessCustomer> implements IBusinessCustomerService {
	@Autowired
	private IBusinessCustomerDao businesscustomerDao;
}
