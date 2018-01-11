package com.zhidi.system.service.impl;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.common.result.PageBean;
import com.zhidi.system.dao.ICustomerDao;
import com.zhidi.system.entity.Customer;
import com.zhidi.system.service.ICustomerService;
@Service
public class CustomerServiceImpl extends BaseServiceImpl<Customer> implements ICustomerService {
	
	@Autowired
	private    ICustomerDao  customerdao;

	@Override
	public PageBean<Customer> findByPageOne(PageBean<Customer> page) {
		//1、查询到总记录数 
				Integer totalRows = customerdao.countOne(page.getCondition());
				
				//2、将总记录设置给page对象
				page.setTotal(totalRows);
				
				//3、查询分页的数据
				List<Customer> list = customerdao.findByPageOne(page.getOffset(),page.getRows(),page.getCondition());
				
				//4、将查询到分页数据设置page对象
				page.setResult(list);
				
				return page;
	}

	@Override
	public PageBean<Customer> findByPageTwo(PageBean<Customer> page) {
		//1、查询到总记录数 
		Integer totalRows = customerdao.countTwo(page.getCondition());
		
		//2、将总记录设置给page对象
		page.setTotal(totalRows);
		
		//3、查询分页的数据
		List<Customer> list = customerdao.findByPageTwo(page.getOffset(),page.getRows(),page.getCondition());
		
		//4、将查询到分页数据设置page对象
		page.setResult(list);
		
		return page;
	}
	/**
	 * 根据客户Id删除对应的客户，可批量删除
	 * @param userIds-用户id的集合 
	 * @return
	 */
	@Override
	public Integer deleteCustomer(String customerIds) {
		String[] cIds = customerIds.split(",");
		List<Integer> list = new ArrayList<>();
		if (cIds != null && cIds.length > 0) {
			for (String customerId : cIds) {
				list.add(Integer.valueOf(customerId));
			}
		}
		return customerdao.deleteCustomer(list);
	}

	@Override
	public Integer deleteCustomerCare(String customerIds) {
		String[] cIds = customerIds.split(",");
		List<Integer> list = new ArrayList<>();
		if (cIds != null && cIds.length > 0) {
			for (String customerId : cIds) {
				list.add(Integer.valueOf(customerId));
			}
		}
		return customerdao.deleteCustomerCare(list);
	}
	
}
