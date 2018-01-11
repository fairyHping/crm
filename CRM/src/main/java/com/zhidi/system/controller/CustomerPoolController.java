package com.zhidi.system.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhidi.common.result.JsonResult;
import com.zhidi.common.result.PageBean;
import com.zhidi.system.entity.Customer;
import com.zhidi.system.service.ICustomerService;

/**
 * 客户池分页查询
 * @author 石烁
 *
 */
@Controller
@RequestMapping("/system/customer")
public class CustomerPoolController{
	@Autowired
	private ICustomerService customerService;

	/**
	 * 转向到system/list_user.jsp
	 * 
	 * @return
	 */
	@GetMapping("/pool")
	public String tolist() {
		return "system/listCustomerPool";
	}

	/**
	 * 处理数据表格的分页请求
	 * 
	 * @param page
	 *            -将分页的页面、一页的记录数、查询条件、以及查询结果封装到该对象中
	 * @return
	 */
	@PostMapping("/pool")
	@ResponseBody
	public JsonResult list(PageBean<Customer> page) {
		page = customerService.findByPageTwo(page);
		return JsonResult.buildSuccessResult("查询成功", page);
	}
	/**  
     * 批量删除客户池  
     * @param id  
     * @param request  
     * @param response  
     */  
	@PostMapping("/delCustomerPool")
	@ResponseBody
	public JsonResult deleteCustomer(String customerIds) {
		Integer rows = customerService.deleteCustomer(customerIds);
		if (rows > 0) {
			return JsonResult.buildSuccessResult("删除成功！");
		} else {
			return JsonResult.buildFailureResult(-120, "删除失败！");
		}
	}
	
	 /**
     * 客户池的新建页面
     * @return
     */
	@GetMapping("/addPool")
	public String  toAdd(){
		return  "system/pool/addCustomerPool";
	}
	/**
	 * 客户池新建的方法
	 * @param customer
	 */
	@PostMapping("/addPool")
	@ResponseBody
	public  JsonResult  save(Customer customer){
		Integer rows=customerService.save(customer);
		if(rows>0){
			return JsonResult.buildSuccessResult("添加成功");
		}else{
			return JsonResult.buildSuccessResult("添加失败");
		}
	}
	/**
	 转向到修改的jsp* 
	 * @return
	 */
	@GetMapping("/editPool")
	public  String toEdit(Integer customerId ,Model model){
		 Customer customer=customerService.findById(customerId);
		 model.addAttribute("customer",customer);
		return "system/pool/editCustomerPool";
	}
	/**
	 * 编辑客户池信息
	 * @param customer
	 * @return
	 */
	@PostMapping("/editPool")
	@ResponseBody
	public JsonResult update(Customer customer) {
		if(customer==null){
			return JsonResult.buildFailureResult(-200, "修改用户信息失败");
		}
		Integer rows=customerService.update(customer);
	if (rows > 0) {
			return JsonResult.buildSuccessResult("修改成功！");
		} else {
			return JsonResult.buildFailureResult(-120, "修改失败！");		
  
 }	}
	/**
	 * 查看客户池详情
	 * @param customerId
	 * @param model
	 * @return 
	 */
      @GetMapping("/findPool")
      public String findAll(Integer customerId,Model modle){
    	  Customer customer=customerService.findById(customerId);
 		   modle.addAttribute("customer",customer);
    	  return "/system/pool/customerPoolInfo";  
      }
}