package com.zhidi.system.service;

import com.zhidi.base.BaseService;
import com.zhidi.system.entity.Employee;

/**
*2017年11月13日
*@author 作者: Zhang
*描述：
*/
public interface IEmployeeService extends BaseService<Employee> {

	/**
	 * 批量删除
	 * @param 
	 * @return
	 */
	int deleteEmployee(String employeeIds);
}

