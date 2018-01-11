package com.zhidi.system.controller;
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
import com.zhidi.system.entity.Contacts;
import com.zhidi.system.entity.Customer;
import com.zhidi.system.service.IContactsService;
import com.zhidi.system.service.ICustomerService;


/**
 * 联系人全部分页查询
 */
@Controller
@RequestMapping("/system/customer")
public class ContactsController {
	
	@Autowired
	private IContactsService contactsService;
	
	@Autowired
	private ICustomerService cusService;
	

	/**
	 * 转向到system/list_user.jsp
	 * 
	 * @return
	 */
	@GetMapping("/contacts")
	public String tolist() {
		return "system/listContacts";
	}
	/**
	 * 处理数据表格的分页请求
	 * 
	 * @param page
	 *            -将分页的页面、一页的记录数、查询条件、以及查询结果封装到该对象中
	 * @return
	 */
	@PostMapping("/contacts")
	@ResponseBody
	public JsonResult list(PageBean<Contacts> page) {
		page = contactsService.findByPage(page);
		return JsonResult.buildSuccessResult("查询成功", page);
	}
	/**
	 * 转向到新建联系人jsp
	 * @return
	 */
	@GetMapping("/add")
	public String toAdd(){
		
		return  "system/contacts/addContacts";
	}
	/**
	 * 新建联系人
	 * @param contacts
	 * @return
	 */
	@PostMapping("/add")
	@ResponseBody
	public  JsonResult  save(Contacts contacts){
		Integer rows=contactsService.save(contacts);
		if(rows>0){
			return JsonResult.buildSuccessResult("添加成功");
		}else{
			return JsonResult.buildSuccessResult("添加失败");
		}
	  
	} 
	/**
	 * 转向到编辑页面
	 * @return
	 */
	@GetMapping("/toedit")
	public String  tooEdit(Integer id ,Model model){
		Contacts contacts=contactsService.findById(id);
		List<Customer> cus=cusService.findAll();
		model.addAttribute("contacts",contacts);
		model.addAttribute("cus", cus);
		return "system/contacts/editContacts";
	} 
	/**
	 * 编辑联系人
	 * @param contacts
	 * @return
	 */
	@PostMapping("/toedit")
	@ResponseBody
	public JsonResult  update(Contacts contacts){
		if(contacts==null){
			return JsonResult.buildFailureResult(-200,"修改联系人信息失败");
		}
		Integer  rows=contactsService.update(contacts);
		if(rows>0){
			return JsonResult.buildSuccessResult("修改成功");
		}else{
			return JsonResult.buildFailureResult(-120,"修改失败");
		}
	}
	
	/**  
     * 批量删除客户  
     * @param id  
     * @param request  
     * @param response  
     */  
	@PostMapping("/delContacts")
	@ResponseBody
	public JsonResult deleteContacts(String contactsIds) {
			Integer rows = contactsService.deleteContacts(contactsIds);
			
			
		if (rows > 0) {
			return JsonResult.buildSuccessResult("删除成功！");
		} else {
			return JsonResult.buildFailureResult(-120, "删除失败！");
		}
	}
	/**
	 * 查看联系人详情
	 * @param customerId
	 * @param model
	 * @return 
	 */
      @GetMapping("/findAll")
      public String findAll(Integer id,Model modle){
    	 Contacts contacts=contactsService.findById(id);
 		   modle.addAttribute("contacts",contacts);
    	  return "system/contacts/contactsInfo";  
      }
	/**
	 * 查询全部信息
	 * @return
	 */
	@PostMapping("/contact/listAll")
	@ResponseBody
	public JsonResult listAll(){
		List<Contacts> contacts=contactsService.findAll();
		return JsonResult.buildSuccessResult("查询成功", contacts);
		
	}
}