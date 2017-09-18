package com.lbcto.model.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lbcto.model.dao.CategoryDao;
import com.lbcto.model.entity.Category;

@Transactional
@Repository("categoryDao")
public class CategoryDaoImpl implements CategoryDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getMainCategory(int pid) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Category where parentId=?");
		query.setInteger(0, pid);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getAllCategory() {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Category");
		return query.list();
	}
	
	

}
