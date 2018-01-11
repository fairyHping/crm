package com.zhidi.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zhidi.base.BaseDao;
import com.zhidi.system.entity.Employee;

public interface IEmployeeDao extends BaseDao<Employee> {
    
	int deleteEmployee(@Param("employeeIds")List<Integer> employeeIds);
}