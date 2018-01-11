package com.zhidi.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.system.dao.IProductCategoryDao;
import com.zhidi.system.entity.ProductCategory;
import com.zhidi.system.service.IProductCategoryService;

/**
*2017年11月3日
*@author 作者: Zhang
*描述：
*/
@Service
public class ProductCategoryServiceImpl extends BaseServiceImpl<ProductCategory> implements IProductCategoryService {

	@Autowired
	protected IProductCategoryDao productCategoryDao;
	
	
}

