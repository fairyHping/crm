package com.zhidi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.system.dao.IContactsDao;
import com.zhidi.system.entity.Contacts;
import com.zhidi.system.service.IContactsService;


@Service
public class ContactsServiceImpl extends BaseServiceImpl<Contacts> implements IContactsService {
	
	@Autowired
	private    IContactsDao  contactsdao;

	/**
	 * 根据联系人Id删除对应的联系人，可批量删除
	 * @param contactsIds-id的集合 
	 * @return
	 */
	@Override
	public Integer deleteContacts(String contactsIds) {
		if(contactsIds==null){
			return 0;
			
		}
		String[] cIds = contactsIds.split(",");
		List<Integer> list = new ArrayList<>();
		if (cIds != null && cIds.length > 0) {
			for (String contactsId : cIds) {
				list.add(Integer.valueOf(contactsId));
			}
		}
		return contactsdao.deleteContacts(list);
	}

	
}
