

package com.zhidi.util;

/**
* createTime 创建时间:2017年10月21日
* 类描述：认证工具类
*/
public class AuthUtil {
	/**
	 * 利用md5算法、对盐值和密码进行加密
	 * @param salt 
	 * @param password
	 * @return -返回加密后结果
	 */
	public static String encryptPassword(String salt,String password){
		
		if(salt != null && salt.isEmpty()){
			return EncryptUtil.encryptMD5(salt+password);
		}
		
		return EncryptUtil.encryptMD5(password);
	}
}


