

package com.zhidi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhidi.base.BaseServiceImpl;
import com.zhidi.system.dao.IDictionaryDao;
import com.zhidi.system.entity.Dictionary;
import com.zhidi.system.service.IDictionaryService;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年11月2日
* 类描述：
*/
@Service
public class DictionaryServiceImpl extends BaseServiceImpl<Dictionary> implements IDictionaryService {

	@Autowired
	private IDictionaryDao dictionaryDao;

	/**
	 * 查询字典中的所有状态
	 * @return
	 */
	@Override
	public List<Dictionary> findStatus() {
		
		return dictionaryDao.findStatus();
	}


	/**
	 * 查询字典中的所有尊称
	 * @return
	 */
	@Override
	public List<Dictionary> findSaltname() {
		
		return dictionaryDao.findSaltname();
	}

	/**
	 * 查询所有的字典类型
	 * @return
	 */
	@Override
	public List<String> listTypes() {
		return dictionaryDao.listTypes();
	}


	/**
	 * 根据字典id删除信息，可批量删除
	 * @param dicIds
	 * @return
	 */
	@Override
	public Integer deleteBatch(String dicIds) {
		String[] dIds = dicIds.split(",");
		List<Integer> list = new ArrayList<>();
		if (dIds != null && dIds.length > 0) {
			for (String dId : dIds) {
				list.add(Integer.valueOf(dId));
			}
		}
		return dictionaryDao.deleteBatch(list);
	}

}


