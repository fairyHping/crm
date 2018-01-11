package com.zhidi.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhidi.base.BaseDao;
import com.zhidi.system.entity.Product;

public interface IProductDao extends BaseDao<Product> {

   	Product findByProductName(@Param("name") String productname);
   	
   	/**
   	 * 查询表中最后一个自增最大的id
   	 * @return
   	 */
   	int findByMaxId();
   	
   	int deleteProduct(@Param("productIds")List<Integer> productIds);
   	
   	Product findProduct(@Param("id")Integer id);
}