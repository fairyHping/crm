package com.zhidi.system.service;
import com.zhidi.base.BaseService;
import com.zhidi.system.entity.Contacts;

public interface IContactsService  extends BaseService<Contacts>{
	
	/**
	 * 根据联系人Id批量删除
	 * @param customerIds
	 * @return
	 */
	Integer deleteContacts(String contactsIds);

}
