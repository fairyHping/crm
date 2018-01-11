package com.zhidi.system.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhidi.common.result.JsonResult;
import com.zhidi.common.result.PageBean;
import com.zhidi.system.entity.Role;
import com.zhidi.system.service.IRoleService;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年4月29日
* 类描述：
*/
@Controller
@RequestMapping("/system/roles")
public class RoleController {
	@Autowired
	private IRoleService roleService;
	/**
	 * 转向到listRoles.jsp页面
	 */
	@RequestMapping("/list")
	public String toListUsers() {
		return "system/role/listRoles";
	}
	
	/**
	 * 查询所有角色信息
	 * @return
	 */
	@PostMapping("/listAll")
	@ResponseBody
	public JsonResult listAll(){
		
		//调用roleService获取角色信息
		List<Role> roles = roleService.findAll();
		
		return JsonResult.buildSuccessResult("查询成功", roles);
	}
	
	/**
	 * 根据用户id和角色状态获取角色信息
	 * @param userIds -用户id
	 * @return
	 */
	@PostMapping("/findByUserId")
	@ResponseBody
	public JsonResult findByUserId(Integer userIds){
		List<Role> roles = roleService.findRoleByUserId(userIds, 1);
		return JsonResult.buildSuccessResult("查询成功", roles);
	}
	/**
	 * 分页查询角色信息
	 * @param page
	 * @return
	 */
	@PostMapping("/listRoles")
	@ResponseBody
	public JsonResult listRoles(PageBean<Role> page){
		
		page = roleService.findByPage(page);
		return JsonResult.buildSuccessResult("查询成功", page);
	}
	
	/**
	 * 转向到addRole.jsp页面
	 * @return
	 */
	@GetMapping("/addRole")
	public String toAddRole(){
		
		return "system/role/addRole";
	}
	
	/**
	 * 处理添加角色信息
	 * @param role -角色对象
	 * @return
	 */
	@PostMapping("/addRole")
	@ResponseBody
	public JsonResult addRole(Role role){
		if(role==null){
			return JsonResult.buildFailureResult(-200, "添加角色信息失败");
		}
		role.setStatus(1);
		role.setCreateTime(new Date());
		Integer rows=roleService.save(role);
		if(rows>0){
			return JsonResult.buildSuccessResult("添加角色信息成功！");
		}else{
			return JsonResult.buildFailureResult(-200, "添加角色信息失败");
		}
	}
	
	/**
	 * 处理删除角色信息的方法，可批量删除
	 * @param roleIds -角色id
	 * @return
	 */
	@PostMapping("/deleteRole")
	@ResponseBody
	public JsonResult deleteRole(String roleIds){
		Integer rows = roleService.deleteRole(roleIds);
		if (rows > 0) {
			return JsonResult.buildSuccessResult("删除成功！");
		} else {
			return JsonResult.buildFailureResult(-120, "删除失败！");
		}
		
	}
	
	/**
	 * 转向到修改角色信息的页面
	 * @param roleId -角色id
	 * @param model -Model对象
	 * @return
	 */
	@GetMapping("/updateRole")
	public String toUpdateRole(Integer roleId,Model model){
		Role role=roleService.findById(roleId);
		model.addAttribute("role", role);
		return "system/role/updateRole";
	}
	
	/**
	 * 处理修改角色信息的方法
	 * @param role -角色对象
	 * @return
	 */
	@PostMapping("/updateRole")
	@ResponseBody
	public JsonResult updateRole(Role role){
		Role r=roleService.findById(role.getRoleId());
		role.setCreateTime(r.getCreateTime());
		role.setUpdateTime(new Date());
		Integer rows=roleService.update(role);
		if (rows > 0) {
			return JsonResult.buildSuccessResult("修改角色信息成功！");
		} else {
			return JsonResult.buildFailureResult(-120, "修改角色信息失败！");
		}
	}
	
	/**
	 *转向到分配权限的页面
	 * @param roleIds -角色id
	 * @param model -Model对象
	 * @return
	 */
	@GetMapping("/assign")
	public String toAssignPage(String roleIds, Model model) {
		model.addAttribute("roleIds", roleIds);
		return "system/role/assignFunction";
	}

	/**
	 * 处理分配权限的方法
	 * @param roleIds -角色id
	 * @param funcIds -权限id
	 * @return
	 */
	@PostMapping("/assign")
	@ResponseBody
	public JsonResult assign(String roleIds, String funcIds) {

		// 用户id和角色id可能是多个id使用,而且可能没有角色
		// 将单个用户id和它的角色id封装为UserRole
		roleService.assignFunctions(roleIds, funcIds);

		return JsonResult.buildSuccessResult("已成功为角色分配权限!");
	}
	
	@GetMapping("/roleInfo")
	public String roleInfo(Integer roleId,Model model){
		Role role =roleService.findById(roleId);
		model.addAttribute("role", role);
		return "system/role/roleInfo";
	}
}


