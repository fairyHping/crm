package com.zhidi.system.dao;

import com.zhidi.base.BaseDao;
import com.zhidi.system.entity.UserRole;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface IUserRoleDao extends BaseDao<UserRole> {
    int deleteByPrimaryKey(@Param("userId") Integer userId, @Param("roleId") Integer roleId);

    int insert(@Param("ur")UserRole ur);

    List<UserRole> selectAll();

    /**
	 * 批量删除用户角色信息
	 * @param list
	 */
	void deleteBatch(@Param("list")List<UserRole> list);

	/**
	 * 批量保存用户角色信息
	 * @param list
	 */
	void saveBatch(@Param("list")List<UserRole> list);
    
    
}