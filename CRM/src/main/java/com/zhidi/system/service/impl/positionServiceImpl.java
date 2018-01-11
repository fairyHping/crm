package com.zhidi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.system.dao.IPositionDao;
import com.zhidi.system.entity.Position;
import com.zhidi.system.service.IPositionService;

/**
*2017年11月11日
*@author 作者: Zhang
*描述：
*/
@Service
public class positionServiceImpl extends BaseServiceImpl<Position> implements IPositionService{

	@Autowired
	protected IPositionDao positionDao;
	
	@Override
	public int deletePosition(String positionIds) {
		String[] pIds = positionIds.split(",");
		List<Integer> list = new ArrayList<>();
		if (pIds != null && pIds.length > 0) {
			for (String positionId :pIds) {
				list.add(Integer.valueOf(positionId));
			}
		}
		return positionDao.deletePosition(list);
	}

}

