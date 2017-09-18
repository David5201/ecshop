package com.lbcto.model.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lbcto.model.dao.CategoryDao;
import com.lbcto.model.entity.Category;
import com.lbcto.model.service.CategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public List<Category> getMainCategoryService(int pid) {
		// TODO Auto-generated method stub
		return categoryDao.getMainCategory(pid);
	}

	@Override
	public List<Category> getAllCategoryService() {
		// TODO Auto-generated method stub
		return categoryDao.getAllCategory();
	}
	
	@Override
	public Map<Category,List<Category>> getCategory(int pid){
		Map<Category,List<Category>> cMap = new HashMap<Category, List<Category>>();
		for(Category item :getMainCategoryService(pid)){
			cMap.put(item, getMainCategoryService(item.getId()));
		}
		return cMap;	
	}

}
