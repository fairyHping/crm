

package com.zhidi.system.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhidi.base.exception.AuthenticationException;
import com.zhidi.common.result.JsonResult;
import com.zhidi.system.entity.Function;
import com.zhidi.system.entity.Role;
import com.zhidi.system.entity.User;
import com.zhidi.system.service.IFunctionService;
import com.zhidi.system.service.IRoleService;
import com.zhidi.system.service.IUserService;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年10月27日
* 类描述：
*/
@Controller
@RequestMapping("/system")
public class LoginController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IRoleService roleService;
	
	@Autowired
	private IFunctionService funcService;
	
	@RequestMapping("/login")
	@ResponseBody
	public JsonResult login(String username,String password,HttpSession session){
		//根据用户名和密码查询对应的用户信息
		User user=userService.findByUser(username,password);
		//根据用户id和角色状态查询角色信息
		List<Role> roles=roleService.findRoleByUserId(user.getUserId(),1);
		if(roles==null ||roles.isEmpty()){
			throw new AuthenticationException("当前用户没有分配角色");
		}
		
		//根据角色信息和权限状态查询对应的权限信息
		List<Function> functions=funcService.findByRoles(roles,1);
		if(functions==null || roles.isEmpty()){
			
			throw new AuthenticationException("当前角色没有分配权限");
		}
		//将信息保存到session中
		session.setAttribute("user", user);
		session.setAttribute("roles", roles);
		session.setAttribute("functions", functions);
		return JsonResult.buildSuccessResult("登录成功！");
	}
	

}


