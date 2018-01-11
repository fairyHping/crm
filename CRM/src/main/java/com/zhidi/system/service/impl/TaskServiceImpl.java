package com.zhidi.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.system.dao.ITaskDao;
import com.zhidi.system.entity.Task;
import com.zhidi.system.service.ITaskService;

/**
*2017年11月6日
*@author 作者: Zhang
*描述：
*/
@Service
public class TaskServiceImpl extends BaseServiceImpl<Task> implements ITaskService {

	@Autowired
	protected ITaskDao taskDao;

	@Override
	public int deleteTask(String taskIds,String userName,Date date) {
		String[] tIds = taskIds.split(",");
		List<Integer> list = new ArrayList<>();
		if (tIds != null && tIds.length > 0) {
			for (String taskId :tIds) {
				list.add(Integer.valueOf(taskId));
			}
		}
		return taskDao.deleteTask(list,userName,date);
	}
	
	
}

