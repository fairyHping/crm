package com.zhidi.system.service;

import com.zhidi.base.BaseService;
import com.zhidi.system.entity.Product;

/**
*2017年10月31日
*@author 作者: Zhang
*描述：
*/
public interface IProductService extends BaseService<Product> {
	
	Integer findByMaxId();
	
	Integer deleteProduct(String productIds);
	
	Product findProduct(Integer id);
}

