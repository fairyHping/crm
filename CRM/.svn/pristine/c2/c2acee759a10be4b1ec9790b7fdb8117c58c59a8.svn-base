package com.zhidi.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zhidi.base.BaseDao;

import com.zhidi.system.entity.Customer;
import com.zhidi.system.entity.Product;
import com.zhidi.system.entity.User;

public interface ICustomerDao extends BaseDao<Customer> {
   
    
	/**
	 * 根据客户Id删除对应的客户，可批量删除
	 * @param userIds-客户id的集合 
	 * @return
	 */
	Integer deleteCustomer(@Param("customerIds")List<Integer> customerIds);
	/**
	 * 根据对应的id查询对应的客户
	 * @param customerId
	 * @return
	 */
	Customer findByName(@Param("name") String name);
	/**
	 * 客户关怀的批量删除
	 * @param list
	 * @return
	 */
	Integer deleteCustomerCare( @Param("customerIds")List<Integer> list);
	/**
	 * 客户关怀的分页查询
	 * @param condition
	 * @return
	 */
	Integer countOne(@Param("con")Map<String, Object> condition);
	List<Customer> findByPageOne(@Param("offset")Integer offset,@Param("pageSize")Integer pageSize,@Param("con") Map<String, Object> condition);
	/**
	 * 客户池分页查询
	 * @param condition
	 * @return
	 */
	Integer countTwo(@Param("con")Map<String, Object> condition);
	List<Customer> findByPageTwo(@Param("offset")Integer offset,@Param("pageSize")Integer pageSize,@Param("con") Map<String, Object> condition);
}