

package com.zhidi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.system.dao.ILeadsDao;
import com.zhidi.system.entity.Leads;
import com.zhidi.system.service.ILeadsService;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年5月6日
* 类描述：
*/
@Service
public class LeadsServiceImpl extends BaseServiceImpl<Leads> implements ILeadsService {

	@Autowired
	private ILeadsDao leadsDao;

	/**
	 * 删除线索，可批量删除
	 * @param leadsIds -线索id
	 * @return
	 */
	@Override
	public Integer deleteBatch(String leadsIds) {
		String[] lIds = leadsIds.split(",");
		List<Integer> list = new ArrayList<>();
		if ( lIds != null &&  lIds.length > 0) {
			for (String leadsId :  lIds) {
				list.add(Integer.valueOf(leadsId));
			}
		}
		return leadsDao.deleteBatch(list);
	}

	/**
	 * 将线索放入线索池，可批量放入
	 * @param leadsIds
	 * @return
	 */
	@Override
	public Integer toPoolBatch(String leadsIds) {
		String[] lIds = leadsIds.split(",");
		List<Integer> list = new ArrayList<>();
		if ( lIds != null &&  lIds.length > 0) {
			for (String leadsId :  lIds) {
				list.add(Integer.valueOf(leadsId));
			}
		}
		return leadsDao.toPoolBatch(list);
	}

	/**
	 * 根据线索id将线索从回收站撤回
	 * @param leadsIds -线索id
	 * @return
	 */
	@Override
	public Integer withdrawLeads(String leadsIds) {
		String[] lIds = leadsIds.split(",");
		List<Integer> list = new ArrayList<>();
		if ( lIds != null &&  lIds.length > 0) {
			for (String leadsId :  lIds) {
				list.add(Integer.valueOf(leadsId));
			}
		}
		return leadsDao.withdrawLeads(list);
	}

	/**
	 * 进行线索转换
	 * @param leadsIds -线索id
	 * @param userId -线索转换人id
	 * @return
	 */
	@Override
	public Integer leadsTransform(Integer leadsId,Integer userId) {
		
		return leadsDao.leadsTransform(leadsId,userId);
	}

	/**
	 * 当前用户领取线索池中的线索
	 * @param leadsId -被领取的线索id
	 * @param userId -当前用户的id
	 * @return
	 */
	@Override
	public Integer getLeads(Integer leadsId, Integer userId) {
		
		return leadsDao.getLeads(leadsId,userId);
	}

	/**
	 * 给用户分配线索，可批量分配
	 * @param leadsIds -线索id
	 * @param userId -用户id
	 * @return
	 */
	@Override
	public Integer assignBatch(String leadsIds, Integer userId) {
		String[] lIds = leadsIds.split(",");
		List<Integer> list = new ArrayList<>();
		if ( lIds != null &&  lIds.length > 0) {
			for (String leadsId :  lIds) {
				list.add(Integer.valueOf(leadsId));
			}
		}
		return leadsDao.assignBatch(list,userId);
	}

	
}


