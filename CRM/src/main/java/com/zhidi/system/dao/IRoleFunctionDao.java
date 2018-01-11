package com.zhidi.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhidi.base.BaseDao;
import com.zhidi.system.entity.RoleFunction;

public interface IRoleFunctionDao extends BaseDao<RoleFunction> {
    int deleteByPrimaryKey(@Param("roleId") Integer roleId, @Param("funcId") Integer funcId);

    int insert(RoleFunction record);

    List<RoleFunction> selectAll();

	/**
	 * 批量删除角色的权限
	 * @param list
	 */
	void deleteBatch(@Param("list")List<RoleFunction> list);

	/**
	 * 批量添加角色权限
	 * @param list
	 */
	void saveBatch(@Param("list")List<RoleFunction> list);
    
  
}