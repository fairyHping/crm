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
import com.zhidi.system.entity.Task;
import com.zhidi.system.entity.User;
import com.zhidi.system.service.ITaskService;
import com.zhidi.system.service.IUserService;

/**
*2017年11月4日
*@author 作者: Zhang
*描述：
*/
@Controller
@RequestMapping("/system/task")
public class TaskContorller {
	
	@Autowired
	protected ITaskService taskService;
	
	@Autowired
	protected IUserService userService;

	/**
	 * 点击树状列表中的任务，在子窗口打开人物界面，到达任务界面
	 * @return
	 */
	@GetMapping("/list")
	public  String listTask(){	
		return "system/task/listTask";
	}
	
	/**
	 * 查询所有数据，拿到数据展示到前端页面的分页中
	 * @param page
	 * @return
	 */
	@PostMapping("/listTask")
	@ResponseBody
	public  JsonResult listTaskAll(PageBean<Task> page){
		page=taskService.findByPage(page);
		return JsonResult.buildSuccessResult("操作成功", page);
	}
	
	/**
	 * 控制器跳转到添加任务的jsp，通知查出负责人展示到前端页面下拉框中
	 * @param model
	 * @return
	 */
	@GetMapping("/addTask")
	public String addTask(Model model){
		List<User> list=userService.findAll();
		model.addAttribute("Users", list);
		return "system/task/addTask";
	}
	
	/**
	 * 执行添加
	 * @param task
	 * @return
	 */
	@PostMapping("/doAddTask")
	@ResponseBody
	public JsonResult doAddTask(Task task){
		task.setCreateTime(new Date());
		task.setUpdateTime(new Date());
		int rows=taskService.save(task);
		if (rows > 0) {
			return JsonResult.buildSuccessResult("添加成功！");
		} else {
			return JsonResult.buildFailureResult(rows, "添加失败！");
		}
	}
	
	/**
	 * 删除功能
	 * @param taskIds
	 * @return
	 */
	@PostMapping("/deleteTask")
	@ResponseBody
	public JsonResult deleteTask(String taskIds,HttpSession session) {
		User user=(User) session.getAttribute("user");
		String userName=user.getUserName();
		Date date=new Date();
		Integer rows = taskService.deleteTask(taskIds,userName,date);
		if (rows > 0) {
			return JsonResult.buildSuccessResult("删除成功！");
		} else {
			return JsonResult.buildFailureResult(rows, "删除失败！");
		}
	}
	
	/**
	 * 修改任务控制器跳转
	 * @param model
	 * @param taskId
	 * @param session
	 * @return
	 */
	@GetMapping("/updateTask")
	public String updateTask(Model model,Integer taskId,HttpSession session){
		List<User> list=userService.findAll();
		Task task=taskService.findById(taskId);
		session.setAttribute("createTime", task.getCreateTime());
		model.addAttribute("users", list);
		model.addAttribute("task", task);
		return "system/task/updateTask";
	}
	
	/**
	 * 执行任务修改
	 * @param task
	 * @param session
	 * @return
	 */
	@PostMapping("/doUpdateTask")
	@ResponseBody
	public JsonResult doUpdateTask(Task task,HttpSession session){
		task.setCreateTime((Date)session.getAttribute("createTime"));
		task.setUpdateTime(new Date());
		Integer rows = taskService.update(task);
		if (rows > 0) {
			return JsonResult.buildSuccessResult("修改成功！");
		} else {
			return JsonResult.buildFailureResult(rows, "修改失败！");
		}
	}
	
	@GetMapping("/taskInfo")
	public String taskInfo(Model model,Integer taskId,HttpSession session){
		List<User> list=userService.findAll();
		Task task=taskService.findById(taskId);
		model.addAttribute("users", list);
		model.addAttribute("task", task);
		return "system/task/taskInfo";
	}
}

