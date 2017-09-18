package com.lbcto.model.dao;

import java.util.List;

import com.lbcto.model.entity.Category;

public interface CategoryDao {

	List<Category> getMainCategory(int pid);
	
	List<Category> getAllCategory();
}
