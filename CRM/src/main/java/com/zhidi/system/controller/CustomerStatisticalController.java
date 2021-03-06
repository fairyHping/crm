package com.zhidi.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhidi.common.result.JsonResult;
import com.zhidi.common.result.PageBean;
import com.zhidi.system.entity.Customer;
import com.zhidi.system.service.ICustomerService;

/**
 * 客户统计分页查询
 * @author 石烁
 *
 */
@Controller
@RequestMapping("/system/customer")
public class CustomerStatisticalController {

	@Autowired
	private ICustomerService customerService;

	/**
	 * 转向到system/list_user.jsp
	 * 
	 * @return
	 */
	@GetMapping("/statistical")
	public String tolist() {
		return "system/listCustomer";
	}

	/**
	 * 处理数据表格的分页请求
	 * 
	 * @param page
	 *            -将分页的页面、一页的记录数、查询条件、以及查询结果封装到该对象中
	 * @return
	 */
	@PostMapping("/statistical")
	@ResponseBody
	public JsonResult list(PageBean<Customer> page) {
		page = customerService.findByPage(page);
		return JsonResult.buildSuccessResult("查询成功", page);
	}
}
