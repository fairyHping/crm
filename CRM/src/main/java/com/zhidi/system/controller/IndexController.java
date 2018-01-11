
package com.zhidi.system.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhidi.common.result.EasyuiTreeNode;
import com.zhidi.common.result.JsonResult;
import com.zhidi.system.entity.Role;
import com.zhidi.system.service.IFunctionService;

/**
 * @author 作者:ZHP createTime 创建时间:2017年4月23日 类描述：
 */
@Controller
public class IndexController {
	
	@Autowired
	private IFunctionService funcService;

	@RequestMapping("/index")
	public String toIndexPage() {
		return "index";
	}
	
	@RequestMapping("/system/menu")
	@ResponseBody
	public JsonResult funcMenu(Integer id,HttpSession session){
		//从session中获取角色信息
		@SuppressWarnings("unchecked")
		List<Role> roles=(List<Role>) session.getAttribute("roles");
		
		//调用service层获取权限菜单信息
		List<EasyuiTreeNode> nodes=funcService.findMenuNodes(id,roles);
		return JsonResult.buildSuccessResult("操作成功", nodes);
		
	}
	
}
