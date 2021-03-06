package com.zhidi.system.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhidi.base.BaseDao;
import com.zhidi.system.entity.Contacts;
import com.zhidi.system.entity.Customer;

public interface IContactsDao extends BaseDao<Contacts> {

	/*
	 * 根据联系人Id删除对应的客户，可批量删除
	 * @param userIds-客户id的集合 
	 * @return
	 */
	Integer deleteContacts(@Param("contactsIds")List<Integer> list);

	/**
	 * 根据对应的id查询对应的客户
	 * @param Id
	 * @return
	 */
	Contacts findByName(@Param("name") String name);

	
}