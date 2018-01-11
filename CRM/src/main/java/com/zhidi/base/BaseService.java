

package com.zhidi.base;

import java.util.List;

import com.zhidi.common.result.PageBean;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年4月20日
* 类描述：
*/
public interface BaseService<E> {
	/**
	 * 添加实体对象
	 * @param e
	 * @throws Exception 
	 */

	Integer save(E e);

	
	/**
	 * 更新实体对象
	 * @param e
	 */
	Integer update(E e);
	
	/**
	 * 根据id删除实体对象
	 * @param id
	 */
	Integer delete(Integer id);
	
	/**
	 * 根据id查找单个实体对象
	 * @param id
	 * @return
	 */
	E findById(Integer id);
	
	/**
	 * 查询所有实体对象
	 * @return
	 */
	List<E> findAll();
	
	/**
	 * 根据条件进行分页查询,PageBean中包含了总记录数
	 * @param offset -起始位置
	 * @param pageSize -每页展示的记录数
	 * @param condition -查询条件
	 * @return
	 */
	PageBean<E> findByPage(PageBean<E> page);

}


