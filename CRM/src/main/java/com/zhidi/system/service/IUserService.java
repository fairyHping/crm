

package com.zhidi.system.service;

import java.util.List;

import com.zhidi.base.BaseService;
import com.zhidi.system.entity.User;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年4月27日
* 类描述：
*/
public interface IUserService extends BaseService<User>{


	/**
	 * 根据用户名和密码获取对应的用户信息
	 * @param username -用户名
	 * @param password -密码
	 * @return -返回值为User对象
	 */
	User findByUser(String username, String password);
	
	/**
	 * 根据用户的id和角色id为用户分配角色
	 * @param userIds
	 * @param roleIds
	 */
	void assignRoles(String userIds, String roleIds);

	/**
	 * 根据userId批量删除用户
	 * @param userIds 
	 * @return 
	 */
	Integer deleteUser(String userIds);

	/**
	 * 根据当前用户信息修改密码
	 * @param oldPassword -旧密码
	 * @param newPassword -新密码
	 * @param user -当前用户信息
	 * @return
	 */
	Integer modifyPassword(String oldPassword, String newPassword, User user);
	
	/**
	 * 查询没有对应员工的用户
	 * @return
	 */
	List<User> findEmpUser();
	
}


