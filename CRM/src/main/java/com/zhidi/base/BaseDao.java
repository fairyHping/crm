
package com.zhidi.base;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * @author 作者:ZHP createTime 创建时间:2017年4月20日 类描述：
 */
public interface BaseDao<E> {

	int deleteByPrimaryKey(Integer id);

	int insert(E e);

	E selectByPrimaryKey(Integer id);

	List<E> selectAll();

	int updateByPrimaryKey(E e);

	/**
	 * 根据条件获取总记录数
	 * @param condition
	 * @return
	 */
	Integer count(@Param("con")Map<String, Object> condition);
	
	/**
	 * 根据条件进行分页查询
	 * @param offset -起始位置
	 * @param pageSize -每页展示的记录数
	 * @param condition -查询条件
	 * @return
	 */
	List<E> findByPage(@Param("offset")Integer offset,@Param("pageSize")Integer pageSize,@Param("con") Map<String, Object> condition);

}
