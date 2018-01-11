package com.zhidi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.system.dao.IBusinessDao;
import com.zhidi.system.entity.Business;
import com.zhidi.system.entity.Product;
import com.zhidi.system.service.IBusinessService;

@Service
public class BusinessServiceImpl extends BaseServiceImpl<Business> implements IBusinessService {
	
	@Autowired
	private    IBusinessDao  busniessdao;
	/**
	 * 根据商机Id删除对应的商机，可批量删除
	 * @param contactsIds-id的集合 
	 * @return
	 */
	@Override
	public Integer deleteBusiness(String businessIds) {
			String[] bIds = businessIds.split(",");
			List<Integer> list = new ArrayList<>();
			if (bIds != null && bIds.length > 0) {
				for (String businessId : bIds) {
					list.add(Integer.valueOf(businessId));
				}
			}
			return busniessdao.deleteBusiness(list);
		}
	/**
	 * 查询商机单个信息
	 */
	@Override
	public List<String> findOrigin() {
		
		return busniessdao.findOrigin();
	}
	
	

	
}