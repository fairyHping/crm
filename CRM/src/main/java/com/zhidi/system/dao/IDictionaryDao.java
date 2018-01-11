package com.zhidi.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhidi.base.BaseDao;
import com.zhidi.system.entity.Dictionary;

public interface IDictionaryDao extends BaseDao<Dictionary> {

	/**根据字典中的类型名查询对应的所有字典值
	 * @return
	 */
	List<Dictionary> findStatus();

	/**
	 * 查询所有尊称
	 * @return
	 */
	List<Dictionary> findSaltname();

	/**
	 * 查询所有字典类型
	 * @return
	 */
	List<String> listTypes();

	/**根据字典id删除字典信息，可批量删除
	 * @param dicIds
	 * @return
	 */
	Integer deleteBatch(@Param("dicIds")List<Integer> dicIds);
    
}