package com.zhidi.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zhidi.base.BaseDao;
import com.zhidi.system.entity.BusinessProduct;

public interface IBusinessProductDao extends BaseDao<BusinessProduct> {
    int deleteByPrimaryKey(Integer id);

    int insert(BusinessProduct record);

    BusinessProduct selectByPrimaryKey(Integer id);

    List<BusinessProduct> selectAll();

    int updateByPrimaryKey(BusinessProduct record);
    
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
   	List<BusinessProduct> findByPage(@Param("offset")Integer offset,@Param("pageSize")Integer pageSize,@Param("con") Map<String, Object> condition);

}