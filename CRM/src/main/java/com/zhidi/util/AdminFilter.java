

package com.zhidi.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年11月14日
* 类描述：
*/
//@WebFilter(urlPatterns={"/system/*"})
public class AdminFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub	
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		Object username = session.getAttribute("user");
		String url=httpRequest.getServletPath();
		if(url.indexOf("system/login")<0){
			//若session中没有登录的用户信息，则跳转到登录页面
			if(username!=null){
				chain.doFilter(httpRequest, httpResponse);
			}else{
				httpResponse.sendRedirect(httpRequest.getContextPath()+"/login.html");
			}
		}else{
			chain.doFilter(httpRequest, httpResponse);
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
	
}


