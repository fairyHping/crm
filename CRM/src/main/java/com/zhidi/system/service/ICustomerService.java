package com.zhidi.system.service;
import com.zhidi.base.BaseService;
import com.zhidi.common.result.PageBean;
import com.zhidi.system.entity.Customer;

public interface ICustomerService extends BaseService<Customer>{
	/**
	 * 客户关怀
	 * 根据分页页码以及查询条件等信息进行分页处理
	 * @param page
	 * @return
	 */
	PageBean<Customer> findByPageOne(PageBean<Customer> page);
	/**
	 *客户池分页查询
	 * 根据分页页码以及查询条件等信息进行分页处理
	 * @param page
	 * @return
	 */
	PageBean<Customer> findByPageTwo(PageBean<Customer> page);
	/**
	 * 根据客户Id批量删除
	 * @param customerIds
	 * @return
	 */
	Integer deleteCustomer(String customerIds);
	/**
	 * 客户关怀删除
	 * @param customerIds
	 * @return
	 */
	Integer deleteCustomerCare(String customerIds);
}
