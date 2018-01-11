package com.zhidi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.system.dao.IEmployeeDao;
import com.zhidi.system.dao.IPositionDao;
import com.zhidi.system.entity.Employee;
import com.zhidi.system.service.IEmployeeService;

/**
*2017年11月13日
*@author 作者: Zhang
*描述：
*/
@Service
public class EmployeeServiceImpl extends BaseServiceImpl<Employee> implements IEmployeeService {

	@Autowired
	protected IEmployeeDao employeeDao;
	
	@Override
	public int deleteEmployee(String employeeIds) {
			String[] eIds = employeeIds.split(",");
			List<Integer> list = new ArrayList<>();
			if (eIds != null && eIds.length > 0) {
				for (String employeeId :eIds) {
					list.add(Integer.valueOf(employeeId));
				}
			}
			return employeeDao.deleteEmployee(list);
		
	}

}

