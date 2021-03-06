package com.zhidi.system.service;

import java.util.List;

import com.zhidi.base.BaseService;
import com.zhidi.common.result.EasyuiTreeNode;
import com.zhidi.system.entity.Function;
import com.zhidi.system.entity.Role;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年4月29日
* 类描述：
*/
public interface IFunctionService extends BaseService<Function>{

	/**
	 * 根据角色信息和权限状态查询对应的权限信息
	 * @param roles -角色信息
	 * @param status -权限状态
	 * @return -返回值为List<Function>
	 */
	List<Function> findByRoles(List<Role> roles, Integer status);

	/**
	 * 根据权限id和角色信息查询权限菜单的节点
	 * @param id -权限id
	 * @param roles -角色信息
	 * @return -List<EasyuiTreeNode>
	 */
	List<EasyuiTreeNode> findMenuNodes(Integer id, List<Role> roles);

	/**
	 * @return
	 */
	List<Function> listParentFunction();

	/**
	 * 根据角色id查询对应的权限信息
	 * @param roleId
	 * @param status 
	 * @return
	 */
	List<Function> findByRoleId(Integer roleId, Integer status);

	/**
	 * 根据权限id删除对应的权限信息，可批量删除
	 * @param funcIds -权限id
	 * @return
	 */
	Integer deleteFunction(String funcIds);

}


