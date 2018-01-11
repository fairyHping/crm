

package com.zhidi.spring.jackson;

import java.text.SimpleDateFormat;
import java.util.Locale;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年10月28日
* 类描述：自定义一个对象转换的类，主要解决Jackson对日期时间格式转化成长整型的问题以及时间相差八小时的问题
*/
@SuppressWarnings("serial")
public class JacksonObjectMapper extends ObjectMapper{
	
	public JacksonObjectMapper(){
		//设置日期格式，解决日期格式问题
		this.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		//设置地区，解决时间相差八小时的问题
		this.setLocale(Locale.CHINA);
		
	}
}


