package com.zhidi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.common.result.EasyuiTreeNode;
import com.zhidi.system.dao.IFunctionDao;
import com.zhidi.system.entity.Function;
import com.zhidi.system.entity.Role;
import com.zhidi.system.service.IFunctionService;

/**
 * @author 作者:ZHP createTime 创建时间:2017年4月30日 类描述：
 */
@Service
public class FunctionServiceImpl extends BaseServiceImpl<Function> implements IFunctionService {
	@Autowired
	private IFunctionDao funcDao;

	/**
	 * 根据角色信息和权限状态查询对应的权限信息
	 * 
	 * @param roles
	 *            -角色信息
	 * @param status
	 *            -权限状态
	 * @return -返回值为List<Function>
	 */
	@Override
	public List<Function> findByRoles(List<Role> roles, Integer status) {
		if (roles == null || roles.isEmpty()) {
			return null;
		}
		List<Integer> roleIds = new ArrayList<>();
		for (Role role : roles) {
			roleIds.add(role.getRoleId());
		}

		List<Function> functions = funcDao.findByRoleIds(roleIds,status);

		return functions;
	}

	/**
	 * 根据父权限id和角色信息查询对应的权限
	 * @param id -父权限id
	 * @param roles -角色信息
	 * @return 返回值为符合easyui的tree的格式的对象
	 */
	@Override
	public List<EasyuiTreeNode> findMenuNodes(Integer id, List<Role> roles) {
		if (roles == null || roles.isEmpty()) {
			return null;
		}
		List<Integer> roleIds = new ArrayList<>();
		for (Role role : roles) {
			roleIds.add(role.getRoleId());
		}
		
		List<Function> functions = funcDao.findByIdAndRoleIds(id,roleIds,1);
		
		List<EasyuiTreeNode> nodes=new ArrayList<>();
		//如果查询到的权限集合不为空，则将权限信息转换成树状菜单需要的格式
		if(functions!=null && !functions.isEmpty()){
			for(Function func:functions){
				EasyuiTreeNode node=new EasyuiTreeNode();
				node.setId(func.getFuncId());
				node.setText(func.getFuncName());
				//若权限的URL为null，则说明当前权限还有子权限，故应将树状节点的state设置为“closed”，否则设为“open”
				//若当前权限的URL不为null，则将其URL放入到节点的attributes集合中
				if(func.getFuncUrl()==null||func.getFuncUrl().isEmpty()){
					node.setState("closed");
				}else{
					node.getAttributes().put("url", func.getFuncUrl());
				}
				nodes.add(node);
			}
		}
		return nodes;
	}

	/**
	 * 查询所有拥有子权限的权限
	 */
	@Override
	public List<Function> listParentFunction() {
		
		return funcDao.listParentFunction();
	}

	/**
	 * 根据角色id查询对应的权限信息
	 * @param roleIds -角色id
	 * @return
	 */
	@Override
	public List<Function> findByRoleId(Integer roleId,Integer status) {
		
		return funcDao.findByRoleId(roleId,status);
	}
	
	/**
	 * 根据权限id删除对应的权限信息
	 * @param funcIds -权限id
	 * @return
	 */
	@Override
	public Integer deleteFunction(String funcIds) {
		String[] fIds = funcIds.split(",");
		List<Integer> list = new ArrayList<>();
		if (fIds != null && fIds.length > 0) {
			for (String funcId : fIds) {
				list.add(Integer.valueOf(funcId));
			}
		}
		return funcDao.deleteFunction(list);
	}

}
