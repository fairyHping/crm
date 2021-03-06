package com.zhidi.system.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhidi.common.result.JsonResult;
import com.zhidi.common.result.PageBean;
import com.zhidi.system.entity.User;
import com.zhidi.system.service.IUserService;
import com.zhidi.util.AuthUtil;
import com.zhidi.util.RandomUtil;

/**
 * @author 作者:ZHP createTime 创建时间:2017年4月23日 类描述：
 */
@Controller
@RequestMapping("/system/users")
public class UserController {

	@Autowired
	private IUserService userService;

	@RequestMapping("/list")
	public String toListUsers() {

		// return "forward:system/role/listAll";
		return "system/user/listUsers";
	}

	/**
	 * 分页查询用户信息
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/listUsers")
	@ResponseBody
	public JsonResult listUsers(PageBean<User> page) {
		page = userService.findByPage(page);
		return JsonResult.buildSuccessResult("查询成功", page);
	}

	/**
	 * 转向到system/assgin_role.jsp
	 * 
	 * @return
	 */
	@GetMapping("/assign")
	public String toAssignPage(String userIds, Model model) {
		model.addAttribute("userIds", userIds);
		return "system/user/assignRole";
	}

	@PostMapping("/assign")
	@ResponseBody
	public JsonResult assign(String userIds, String roleIds) {

		// 用户id和角色id可能是多个id使用,而且可能没有角色
		// 将单个用户id和它的角色id封装为UserRole
		userService.assignRoles(userIds, roleIds);

		return JsonResult.buildSuccessResult("已成功为用户分配角色!");
	}

	@PostMapping("/deleteUser")
	@ResponseBody
	public JsonResult deleteUser(String userIds) {
		Integer rows = userService.deleteUser(userIds);
		if (rows > 0) {
			return JsonResult.buildSuccessResult("删除成功！");
		} else {
			return JsonResult.buildFailureResult(-120, "删除失败！");
		}
	}

	@GetMapping("/updateUser")
	public String updateUser(Integer userId, Model model, HttpSession session) {
		User user = null;
		if (userId != null) {
			user = userService.findById(userId);
		} else {
			user = (User) session.getAttribute("user");
		}

		model.addAttribute("user", user);

		return "system/user/updateUser";
	}

	@PostMapping("/updateUser")
	@ResponseBody
	public JsonResult update(User user) {
		if (user == null) {
			return JsonResult.buildFailureResult(-200, "修改用户信息失败");
		}
		User u = userService.findById(user.getUserId());
		user.setPassword(u.getPassword());
		user.setSalt(u.getSalt());
		user.setCreateTime(u.getCreateTime());
		user.setUpdateTime(new Date());
		Integer rows = userService.update(user);
		if (rows > 0) {
			return JsonResult.buildSuccessResult("修改成功！");
		} else {
			return JsonResult.buildFailureResult(-120, "修改失败！");
		}
	}

	@GetMapping("/addUser")
	public String addUser() {
		return "system/user/addUser";
	}

	@PostMapping("/addUser")
	@ResponseBody
	public JsonResult doAddUser(User user) {
		if (user == null) {
			return JsonResult.buildFailureResult(-200, "添加用户信息失败");
		}
		// 将得到的密码进行加密
		String password = user.getPassword();
		// 随机生成一个盐值
		String salt = RandomUtil.generateUUID();
		password = AuthUtil.encryptPassword(salt, password);
		user.setPassword(password);
		user.setSalt(salt);
		user.setCreateTime(new Date());
		Integer rows = userService.save(user);
		if (rows > 0) {
			return JsonResult.buildSuccessResult("添加用户信息成功");
		} else {
			return JsonResult.buildFailureResult(-120, "添加用户信息失败");
		}

	}

	@PostMapping("/listAll")
	@ResponseBody
	public JsonResult listAll() {
		List<User> users = userService.findAll();
		return JsonResult.buildSuccessResult("查询成功", users);

	}

	@GetMapping("/userInfo")
	public String userInfo(Integer userId, Model model, HttpSession session) {
		User user = null;
		if (userId != null) {
			user = userService.findById(userId);
		} else {
			user = (User) session.getAttribute("user");
		}
		model.addAttribute("user", user);
		return "system/user/userInfo";
	}

	@GetMapping("/modify")
	public String showInfo() {
		return "system/user/modifyPassword";
	}

	@PostMapping("/modify")
	@ResponseBody
	public JsonResult modify(String oldPassword, String newPassword, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Integer rows = userService.modifyPassword(oldPassword, newPassword, user);
		if (rows > 0) {
			return JsonResult.buildSuccessResult("密码修改成功，下次登录请使用新密码！");
		} else {
			return JsonResult.buildFailureResult(-120, "密码修改失败！");
		}
	}
	
	
}
