package com.zhidi.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zhidi.base.BaseDao;
import com.zhidi.system.entity.Business;
import com.zhidi.system.entity.Customer;
import com.zhidi.system.entity.User;

public interface IBusinessDao extends BaseDao<Business> {
    /**
   	 * 根据条件获取总记录数
   	 * @param condition
   	 * @return
   	 */
   	Integer count(@Param("con") Map<String, Object> condition);
   	
   	/**
   	 * 根据条件进行分页查询
   	 * @param offset -起始位置
   	 * @param pageSize -每页展示的记录数
   	 * @param condition -查询条件
   	 * @return
   	 */
   	List<Business> findByPage(@Param("offset")Integer offset,@Param("pageSize")Integer pageSize,@Param("con") Map<String, Object> condition);
	/**
	 * 根据商机Id删除对应的商机，可批量删除
	 * @param businessIds-id的集合 
	 * @return
	 */
	Integer deleteBusiness(@Param("businessIds") List<Integer> list);
	/**
	 * 查询商机单个信息
	 * @param id
	 * @return
	 */
    List<String> findOrigin();
   
}