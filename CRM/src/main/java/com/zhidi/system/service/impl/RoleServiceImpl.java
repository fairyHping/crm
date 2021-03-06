package com.zhidi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.system.dao.IRoleDao;
import com.zhidi.system.dao.IRoleFunctionDao;
import com.zhidi.system.entity.Role;
import com.zhidi.system.entity.RoleFunction;
import com.zhidi.system.service.IRoleService;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年4月30日
* 类描述：
*/
@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements IRoleService {
	
	@Autowired
	private IRoleDao roleDao;
	
	@Autowired
	private IRoleFunctionDao roleFuncDao;

	/**
	 * 根据用户id和角色状态查询角色信息
	 * @param userId -用户id
	 * @param status -角色状态  ：1表示正常，0表示禁用，2表示删除
	 * @return 返回值为List<Role>
	 */
	@Override
	public List<Role> findRoleByUserId(Integer userId, Integer status) {
		
		return roleDao.findRoleByUserId(userId,status);
	}

	/**
	 * 根据角色id删除角色信息，可批量删除
	 * @param roleIds
	 * @return
	 */
	@Override
	public Integer deleteRole(String roleIds) {
		String[] rIds = roleIds.split(",");
		List<Integer> list = new ArrayList<>();
		if (rIds != null && rIds.length > 0) {
			for (String roleId : rIds) {
				list.add(Integer.valueOf(roleId));
			}
		}
		return roleDao.deleteRole(list);
	}


	/**
	 * 根据角色id和权限id为角色分配权限
	 * @param roleIds 
	 * @param funcIds
	 */
	@Override
	public void assignFunctions(String roleIds, String funcIds) {
		// 将角色id和它对应的权限id封装为UserRole
				List<RoleFunction> list = new ArrayList<>();
				String[] rIds = roleIds.split(",");
				String[] fIds = null;
				if (funcIds != null && !funcIds.isEmpty()) {
					fIds = funcIds.split(",");
				}
				for (String roleId : rIds) {
					if (fIds != null && fIds.length > 0) {
						for (String funcId : fIds) {
							RoleFunction rf=new RoleFunction();
							rf.setRoleId(Integer.valueOf(roleId));
							rf.setFuncId(Integer.valueOf(funcId));
							list.add(rf);
						}
					} else {
						RoleFunction rf=new RoleFunction();
						rf.setRoleId(Integer.valueOf(roleId));
						list.add(rf);
					}
				}
				// 先删除把原来中间表tb_role_function中角色的权限
				roleFuncDao.deleteBatch(list);
				// 然后判断是否传入权限id，如果传入调用Dao层批量插入，否则不插入
				if(fIds!=null&&fIds.length>0){
					roleFuncDao.saveBatch(list);
					
				}
		
	}

	

}


