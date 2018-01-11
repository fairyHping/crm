package com.zhidi.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.zhidi.common.result.PageBean;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年4月20日
* 类描述：
*/
public class BaseServiceImpl<E> implements BaseService<E>{
	
	@Autowired
	private BaseDao<E> baseDao;

	/**
	 * 添加实体对象
	 * @param e
	 * @throws Exception 
	 */
	@Override
	public Integer save(E e) {
		return baseDao.insert(e);

	}

	/**
	 * 更新实体对象
	 * @param e
	 * @return 
	 */
	@Override
	public Integer update(E e) {
		return baseDao.updateByPrimaryKey(e);
	}

	/**
	 * 根据id删除实体对象
	 * @param id
	 * @return 
	 */
	@Override
	public Integer delete(Integer id) {
		return baseDao.deleteByPrimaryKey(id);
	}
	
	/**
	 * 根据id查找单个实体对象
	 * @param id
	 * @return
	 */
	@Override
	public E findById(Integer id) {
		
		return baseDao.selectByPrimaryKey(id);
	}

	/**
	 * 查询所有实体对象
	 * @return
	 */
	@Override
	public List<E> findAll() {
		
		return baseDao.selectAll();
	}


	/**
	 * 根据条件进行分页查询,PageBean中包含了总记录数
	 * @param offset -起始位置
	 * @param pageSize -每页展示的记录数
	 * @param condition -查询条件
	 * @return
	 */
	@Override
	public PageBean<E> findByPage(PageBean<E> page) {
		//获取总记录数
		int count =baseDao.count(page.getCondition());
		//将总记录数放到PageBean对象中
		page.setTotal(count);
		//获取分页数据
		List<E> list=baseDao.findByPage(page.getOffset(), page.getRows(), page.getCondition());
		//将查询结果放到PageBean对象中
		page.setResult(list);
		
		return page;
	}
}


