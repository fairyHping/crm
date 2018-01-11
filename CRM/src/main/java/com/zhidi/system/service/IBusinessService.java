package com.zhidi.system.service;

import java.util.List;

import com.zhidi.base.BaseService;
import com.zhidi.system.entity.Business;

public interface IBusinessService extends BaseService<Business> {
	/**
	 * 根据商机Id批量删除
	 * @param customerIds
	 * @return
	 */
	Integer deleteBusiness(String businessIds);
	/**
	 * 查询商机单个信息
	 * @param customerIds
	 * @return
	 */
	List<String>  findOrigin();
}
