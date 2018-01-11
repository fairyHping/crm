package com.zhidi.system.service;

import java.util.List;

import com.zhidi.base.BaseService;
import com.zhidi.system.entity.Role;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年4月30日
* 类描述：
*/
public interface IRoleService extends BaseService<Role> {

	/**
	 * 根据用户id和角色状态获取对应的角色信息
	 * @param userId -用户id
	 * @param status -角色状态 ：1表示正常，0表示禁用，2表示删除
	 * @return -返回值为List<Role>
	 */
	List<Role> findRoleByUserId(Integer userId, Integer status);

	/**
	 * 根据角色id删除角色信息，可批量删除
	 * @param roleIds
	 * @return
	 */
	Integer deleteRole(String roleIds);

	/**
	 * 根据角色id和权限id为角色分配权限
	 * @param roleIds
	 * @param funcIds
	 */
	void assignFunctions(String roleIds, String funcIds);


}


