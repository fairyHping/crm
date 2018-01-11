package com.zhidi.system.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhidi.base.BaseDao;
import com.zhidi.system.entity.Task;

public interface ITaskDao extends BaseDao<Task> {
    
	int deleteTask(@Param("taskIds") List<Integer> taskIds,@Param("userName")String userName,@Param("deleteTime") Date date);
}