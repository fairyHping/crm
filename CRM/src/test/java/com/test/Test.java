package com.test;

import com.zhidi.util.AuthUtil;
import com.zhidi.util.RandomUtil;

public class Test {
	public static void main(String[] args) {
		String salt=RandomUtil.generateUUID();
		System.out.println(salt);
		String psw="admin123";
		System.out.println(AuthUtil.encryptPassword(salt, psw));
	}

}
