package com.zhidi.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年10月16日
* 类描述：
*/
public class DateConverter implements Converter<String, Date>{

	//设置一个默认的日期字符串模式
	private String pattern="yyyy-MM-dd";
	
	//提供setter方法
	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	/**
	 * 将字符串类型转换成日期类型
	 * @param value 待转换成日期类的字符串
	 * @return -转换后的日期类对象
	 */
	@Override
	public Date convert(String value) {
		if(value==null ||value.isEmpty()){
			return null;
		}
		try {
			return new SimpleDateFormat(pattern).parse(value);
		} catch (ParseException e) {
			e.printStackTrace();
			throw new RuntimeException(value+"转换成日期类型时出现异常");
		}
		
	}

}


