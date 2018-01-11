

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
import com.zhidi.system.entity.Dictionary;
import com.zhidi.system.service.IDictionaryService;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年4月17日
* 类描述：
*/
@Controller
@RequestMapping("/system/dictionary")
public class DictionaryController {
	
	@Autowired
	private IDictionaryService dService;
	
	/**
	 * 获取字典中所有的状态
	 * @return
	 */
	@RequestMapping("/listStatus")
	@ResponseBody
	public JsonResult listAll(){
		List<Dictionary> dics=dService.findStatus();
		return JsonResult.buildSuccessResult("查询成功", dics);
		
	}

	/**
	 * 获取字典中所有的尊称
	 * @return
	 */
	@RequestMapping("/listSaltname")
	@ResponseBody
	public JsonResult listSaltname(){
		List<Dictionary> dics=dService.findSaltname();
		return JsonResult.buildSuccessResult("查询成功", dics);
		
	}
	
	/**
	 * 转向到字典展示页面
	 * @return
	 */
	@GetMapping("/list")
	public String toListDictionary(Model model){
		List<String> types=dService.listTypes();
		model.addAttribute("types", types);
		return "system/dictionary/listDictionary";
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @return
	 */
	@PostMapping("/listDictionary")
	@ResponseBody
	public JsonResult listDictionary(PageBean<Dictionary> page){
		page=dService.findByPage(page);
		return JsonResult.buildSuccessResult("查询成功", page);
	}
	/**
	 * 根据字典id删除信息，可批量删除
	 * @param dicIds
	 * @return
	 */
	@PostMapping("/deleteBatch")
	@ResponseBody
	public JsonResult deleteBatch(String dicIds){
		Integer rows=dService.deleteBatch(dicIds);
		if (rows > 0) {
			return JsonResult.buildSuccessResult("删除成功！");
		} else {
			return JsonResult.buildFailureResult(-120, "删除失败！");
		}
		
	}
	
	/**
	 * 转向到添加字典页面
	 * @return
	 */
	@GetMapping("/addDictionary")
	public String toAddDictionary(){
		return "system/dictionary/addDictionary";
		
	}
	
	/**
	 * 处理添加字典的业务
	 * @param dict
	 * @return
	 */
	@PostMapping("/addDictionary")
	@ResponseBody
	public JsonResult addDictionary(Dictionary dict){
		dict.setCreateTime(new Date());
		dict.setState(1);
		Integer rows=dService.save(dict);
		
		if (rows > 0) {
			return JsonResult.buildSuccessResult("添加字典成功！");
		} else {
			return JsonResult.buildFailureResult(-120, "添加字典失败！");
		}
	}
	
	/**
	 * 转向到修改字典页面
	 * @param dicId
	 * @param model
	 * @return
	 */
	@GetMapping("/updateDictionary")
	public String toUpdateDictionary(Integer dicId,Model model){
		Dictionary dic=dService.findById(dicId);
		model.addAttribute("dictionary", dic);
		return "system/dictionary/updateDictionary";
		
	}
	
	/**
	 * 处理修改字典的业务
	 * @param dic
	 * @return
	 */
	@PostMapping("/updateDictionary")
	@ResponseBody
	public JsonResult updateDictionary(Dictionary dic){
		dic.setUpdateTime(new Date());
		Integer rows=dService.update(dic);
		if (rows > 0) {
			return JsonResult.buildSuccessResult("修改字典成功！");
		} else {
			return JsonResult.buildFailureResult(-120, "修改字典失败！");
		}
	}
	
	@GetMapping("/dictionaryInfo")
	public String dictionaryInfo(Integer dicId,Model model){
		Dictionary dic=dService.findById(dicId);
		model.addAttribute("dic", dic);
		return "system/dictionary/dictionaryInfo";
		
	}
	
}


