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
import com.zhidi.system.entity.Business;
import com.zhidi.system.entity.Contacts;
import com.zhidi.system.entity.Customer;
import com.zhidi.system.service.IBusinessService;

/**
 * 商机分页查询
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/system/business")
public class BusinessController {

	@Autowired
	private IBusinessService businessService;
	
	@GetMapping("/list")
	public String  toList(){
		
		return "system/listBusiness";
	}

	/**
	 * 处理数据表格的分页请求
	 * 
	 * @param page
	 *            -将分页的页面、一页的记录数、查询条件、以及查询结果封装到该对象中
	 * @return
	 */
	@PostMapping("/list")
	@ResponseBody
	public JsonResult list(PageBean<Business> page) {
		page = businessService.findByPage(page);
		return JsonResult.buildSuccessResult("查询成功", page);
	}
	/**
	 * 转向到新增商机
	 * @return
	 */
	@GetMapping("/add")
	public String toAdd(){
		return  "system/business/addBusiness";
	}
	/**
	 * 新建商机
	 * @param contacts
	 * @return
	 */
	@PostMapping("/add")
	public  JsonResult  save(Business business){
		Integer rows=businessService.save(business);
		if(rows>0){
			return JsonResult.buildSuccessResult("添加成功");
		}else{
			return JsonResult.buildSuccessResult("添加失败");
		}
		
	} 
	/**  
     * 批量删除商机 
     * @param id  
     * @param request  
     * @param response  
     */  
	@PostMapping("/delBusiness")
	@ResponseBody
	public JsonResult deleteBusiness(String businessIds) {
	Integer rows = businessService.deleteBusiness(businessIds);
			
		if (rows > 0) {
			return JsonResult.buildSuccessResult("删除成功！");
		} else {
			return JsonResult.buildFailureResult(-120, "删除失败！");
		}
	}
	/**
	 转向到修改的jsp* 
	 * @return
	 */
	@GetMapping("/edit")
	public  String toEdit(Integer id ,Model model){
		 Business business=businessService.findById(id);
		 model.addAttribute("business",business);
		return "system/business/editBusiness";
	}
	/**
	 * 编辑商机信息
	 * @param customer
	 * @return
	 */
	@PostMapping("/edit")
	@ResponseBody
	public JsonResult update(Business business) {
		if(business==null){
			return JsonResult.buildFailureResult(-200, "修改用户信息失败");
		}
		Integer rows=businessService.update(business);
	if (rows > 0) {
			return JsonResult.buildSuccessResult("修改成功！");
		} else {
			return JsonResult.buildFailureResult(-120, "修改失败！");		
 
}	}
	/**
	 * 查看商机详情
	 * @param customerId
	 * @param model
	 * @return 
	 */
      @GetMapping("/find")
      public String findAll(Integer id,Model modle){
    	 Business business=businessService.findById(id);
 		   modle.addAttribute("business",business);
    	  return "system/business/businessInfo";  
      }
}