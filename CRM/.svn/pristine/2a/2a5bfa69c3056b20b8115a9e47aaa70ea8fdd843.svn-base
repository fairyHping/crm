package com.zhidi.common.taglib;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.zhidi.system.entity.Function;

/**
 * 自定义判断是否拥有指定权限的标签支持类
 * @author lx
 *
 */
public class PermissionTagSupport extends TagSupport {
	
	//表示自定义标签的code属性
	private String code = "";

	@Override
	public int doStartTag() throws JspException {
		//1、获取当前登录用户的权限信息
		HttpSession session = this.pageContext.getSession();
		List<Function> functions = (List<Function>) session.getAttribute("functions");
		
		//2、遍历权限信息，判断code值是否与当前的权限对象的funcCode一致，如果一致说明存在对应的权限返回一个
		if(functions!=null && !functions.isEmpty()){
			for(Function f : functions){
				if(code.equals(f.getFuncCode())){
					//如果用户拥有指定的权限，那么执行标签体
					return EVAL_BODY_INCLUDE;
				}
			}
		}
		
		//如果用户权限列表为空，或者用户没有对应的权限，跳过标签体的执行
		return SKIP_BODY;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	
	
	

}
