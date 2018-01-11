package com.zhidi.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhidi.base.BaseDao;
import com.zhidi.system.entity.User;

public interface IUserDao extends BaseDao<User> {

	/**
	 * 根据用户名查询对应的用户
	 * @param username -用户名
	 * @return 返回值为User
	 */
	User findByUsername(@Param("userName")String username);

	/**
	 * 根据用户Id删除对应的用户，可批量删除
	 * @param userIds-用户id的集合 
	 * @return
	 */
	Integer deleteUser(@Param("userIds")List<Integer> userIds);

	/**
	 * //根据当前用户的id修改密码
	 * @param newPassword -新密码
	 * @param userId -当前用户的id
	 * @return
	 */
	Integer modifyPassword(@Param("newPassword")String newPassword,@Param("userId") Integer userId);

	/**
	 * 查询没有对应员工的用户
	 * @return
	 */
	List<User> findEmpUser();

}