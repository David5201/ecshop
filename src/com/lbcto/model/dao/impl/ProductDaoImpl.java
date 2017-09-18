package com.lbcto.model.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lbcto.model.dao.ProductDao;
import com.lbcto.model.entity.Product;


@Transactional
@Repository("productDao")
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Product> getProductsListByPID(int pId) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Product where categoryId=?");
		query.setParameter(0, pId);
		return query.list();
	}

	@Override
	public Product getProductDetailById(int productId) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Product where id=?");
		query.setParameter(0, productId);
		return (Product) query.uniqueResult();
	}
	

	
	

}
