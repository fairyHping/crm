

package com.zhidi.system.service;

import java.util.List;

import com.zhidi.base.BaseService;
import com.zhidi.system.entity.Dictionary;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年11月2日
* 类描述：
*/
public interface IDictionaryService extends BaseService<Dictionary>{

	/**
	 * 查询字典中的所有状态
	 * @return
	 */
	List<Dictionary> findStatus();

	/**
	 * 查询字典中的所有尊称
	 * @return
	 */
	List<Dictionary> findSaltname();

	/**
	 * 查询所有的字典类型
	 * @return
	 */
	List<String> listTypes();

	/**
	 * 根据字典id删除信息，可批量删除
	 * @param dicIds
	 * @return
	 */
	Integer deleteBatch(String dicIds);

}


