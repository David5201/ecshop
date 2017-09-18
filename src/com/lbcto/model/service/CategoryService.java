package com.lbcto.model.service;

import java.util.List;
import java.util.Map;

import com.lbcto.model.entity.Category;

public interface CategoryService {

	List<Category> getMainCategoryService(int pid);
	
	List<Category> getAllCategoryService();
	
	Map<Category,List<Category>> getCategory(int pid);
}
