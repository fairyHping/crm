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
import com.zhidi.system.entity.Department;
import com.zhidi.system.entity.Employee;
import com.zhidi.system.entity.Position;
import com.zhidi.system.entity.Product;
import com.zhidi.system.entity.User;
import com.zhidi.system.service.IDepartemtService;
import com.zhidi.system.service.IEmployeeService;
import com.zhidi.system.service.IPositionService;
import com.zhidi.system.service.IUserService;

/**
*2017年11月10日
*@author 作者: Zhang
*描述：
*/
@Controller
@RequestMapping("/system/hr")
public class HrController {
	
	@Autowired
	protected IDepartemtService departmentService;
	
	@Autowired
	protected IPositionService positionService;
	
	@Autowired
	protected IEmployeeService employeeService;
	
	@Autowired
	protected IUserService userService;
	
	/**
	 * 部门页面控制器
	 * @return
	 */
	@GetMapping("/department")
	public String listDepartment(Model model){
		List<Department> list=departmentService.findAll();
		model.addAttribute("depts", list);
		return "system/hr/listDepartment";
	}

	@PostMapping("/listDepartment")
	@ResponseBody
	public JsonResult doListDepartment(PageBean<Department> page){
		page=departmentService.findByPage(page);
		return JsonResult.buildSuccessResult("操作成功", page);		
	}
	
	/**
	 * 添加部门控制器
	 * @param model
	 * @return
	 */
	@GetMapping("/addDepartment")
	public String addDepartment(Model model){
		List<Department> list=departmentService.findAll();
		model.addAttribute("department", list);
		return "system/hr/addDepartment";
	}
	
	/**
	 * 执行部门添加控制器
	 * @param departmnet
	 * @return
	 */
	@PostMapping("/doAddDepartment")
	@ResponseBody
	public JsonResult doAddDepartment(Department departmnet){
		int rows=departmentService.save(departmnet);
		if(rows>0){
			return JsonResult.buildSuccessResult("添加成功");
		}else{
			return JsonResult.buildFailureResult(rows,"添加失败");
		}	
	}
	
	/**
	 * 修改部门
	 * @param model
	 * @param id
	 * @return
	 */
	@GetMapping("/updateDepartment")
	public String updateDepartment(Model model,Integer departmentId){
		Department dept=departmentService.findById(departmentId);
		model.addAttribute("department", dept);
		List<Department> list=departmentService.findAll();
		model.addAttribute("depts", list);
		return "system/hr/updateDepartment";
	}
	
	/**
	 * 执行修改部门
	 * @param department
	 * @return
	 */
	@PostMapping("/doUpdateDepartment")
	@ResponseBody
	public JsonResult doUpdateDepartment(Department department){
		int rows=departmentService.update(department);
		if(rows>0){
			return JsonResult.buildSuccessResult("修改成功");
		}else{
			return JsonResult.buildFailureResult(rows,"修改失败");
		}	
	}
	
	/**
	 * 批量刪除
	 * @param departmentIds
	 * @return
	 */
	@PostMapping("/deleteDepartment")
	@ResponseBody
	public JsonResult deleteDepartment(String departmentIds){
		int rows=departmentService.deleteDepartment(departmentIds);
		if(rows>0){
			return JsonResult.buildSuccessResult("删除成功");
		}else{
			return JsonResult.buildFailureResult(rows,"删除失败");
		}	
	}
	
	//------------------------------------------------
	/**
	 * 崗位页面控制器
	 * @return
	 */
	@GetMapping("/position")
	public String Position(Model model){
		List<Position> list=positionService.findAll();
		model.addAttribute("positions", list);
		return "system/hr/listPosition";
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @return
	 */
	@PostMapping("/listPosition")
	@ResponseBody
	public JsonResult listPosition(PageBean<Position> page){
		page=positionService.findByPage(page);
		return JsonResult.buildSuccessResult("操作成功", page);
	}
	
	/**
	 * 添加岗位控制器
	 * @param model
	 * @return
	 */
	@GetMapping("addPosition")
	public String addPosition(Model model){
		List<Position> list=positionService.findAll();
		model.addAttribute("positions", list);
		List<Department> depts=departmentService.findAll();
		model.addAttribute("depts", depts);
		return "system/hr/addPosition";
	}
	
	/**
	 * 执行岗位添加控制器
	 * @param departmnet
	 * @return
	 */
	@PostMapping("/doAddPosition")
	@ResponseBody
	public JsonResult doAddPositiont(Position pos){
		int rows=positionService.save(pos);
		if(rows>0){
			return JsonResult.buildSuccessResult("添加成功");
		}else{
			return JsonResult.buildFailureResult(rows,"添加失败");
		}	
	}
	
	/**
	 * 批量刪除
	 * @param departmentIds
	 * @return
	 */
	@PostMapping("/deletePosition")
	@ResponseBody
	public JsonResult deletePosition(String positionIds){
		int rows=positionService.deletePosition(positionIds);
		if(rows>0){
			return JsonResult.buildSuccessResult("删除成功");
		}else{
			return JsonResult.buildFailureResult(rows,"删除失败");
		}	
	}
	
	/**
	 * 修改岗位控制器
	 * @param model
	 * @return
	 */
	@GetMapping("updatePosition")
	public String updatePosition(Model model,Integer positionId){
		Position pos=positionService.findById(positionId);
		model.addAttribute("pos", pos);
		List<Position> list=positionService.findAll();
		model.addAttribute("positions", list);
		List<Department> depts=departmentService.findAll();
		model.addAttribute("depts", depts);
		return "system/hr/updatePosition";
	}
	
	/**
	 * 执行修改岗位
	 * @param department
	 * @return
	 */
	@PostMapping("/doUpdatePosition")
	@ResponseBody
	public JsonResult doUpdatePosition(Position pos){
		int rows=positionService.update(pos);
		if(rows>0){
			return JsonResult.buildSuccessResult("修改成功");
		}else{
			return JsonResult.buildFailureResult(rows,"修改失败");
		}	
	}
	//-------------------------------------------------
	/**
	 * 员工
	 * @param model
	 * @return
	 */
	@GetMapping("/employee")
	public String employee(Model model){
		List<Employee> list=employeeService.findAll();
		model.addAttribute("employees", list);
		List<Position> pos=positionService.findAll();
		model.addAttribute("positions", pos);
		return "system/hr/listEmployee";
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @return
	 */
	@PostMapping("/listEmployee")
	@ResponseBody
	public JsonResult listEmployee(PageBean<Employee> page){
		page=employeeService.findByPage(page);
		return JsonResult.buildSuccessResult("操作成功", page);
	}
	
	/**
	 * 添加员工控制器
	 * @param model
	 * @return
	 */
	@GetMapping("/addEmployee")
	public String addEmployee(Model model){
		List<Employee> list=employeeService.findAll();
		model.addAttribute("employees", list);
		List<Position> postions=positionService.findAll();
		model.addAttribute("postions", postions);
		List<User> users=userService.findEmpUser();
		model.addAttribute("users", users);
		return "system/hr/addEmployee";
	}
	
	@PostMapping("/doAddEmployee")
	@ResponseBody
	public JsonResult doAddEmployee(Employee emp,HttpSession session){
		emp.setStatus(1);
		emp.setCreateTime(new Date());
		emp.setUpdateTime(new Date());
		User user=(User) session.getAttribute("user");
		emp.setCreatorUserId(user.getUserId());	
		emp.setUpdateUserId(user.getUserId());
		int rows=employeeService.save(emp);
		if(rows>0){
			return JsonResult.buildSuccessResult("添加成功");
		}else{
			return JsonResult.buildFailureResult(rows,"添加失败");
		}	
	}
	
	/**
	 * 修改员工控制器
	 * @param model
	 * @return
	 */
	@GetMapping("/updateEmployee")
	public String updateEmployee(Model model,Integer empId){
		Employee emp=employeeService.findById(empId);
		model.addAttribute("emp", emp);
		List<Employee> list=employeeService.findAll();
		model.addAttribute("employees", list);
		List<Position> postions=positionService.findAll();
		model.addAttribute("postions", postions);
		List<User> users=userService.findEmpUser();
		model.addAttribute("users", users);
		return "system/hr/updateEmployee";
	}
	

	/**
	 * 批量刪除
	 * @param employeeIds
	 * @return
	 */
	@PostMapping("/deleteEmployee")
	@ResponseBody
	public JsonResult deleteEmployee(String employeeIds){
		int rows=employeeService.deleteEmployee(employeeIds);
		if(rows>0){
			return JsonResult.buildSuccessResult("删除成功");
		}else{
			return JsonResult.buildFailureResult(rows,"删除失败");
		}	
	}
}
