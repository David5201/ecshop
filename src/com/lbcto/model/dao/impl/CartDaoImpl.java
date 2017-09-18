package com.lbcto.model.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lbcto.model.dao.CartDao;
import com.lbcto.model.entity.Cart;

@Transactional
@Repository("cartDao")
public class CartDaoImpl implements CartDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Cart> getCartInfoByUserId(int uId) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Cart where userId=?");
		query.setParameter(0, uId);
		return query.list();
	}

	@Override
	public boolean addCart(Cart cart) {
		// TODO Auto-generated method stub
		try {
			sessionFactory.getCurrentSession().save(cart);
			return true;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean changeCartCount(int userId, int productId, int count) {
		// TODO Auto-generated method stub
		try {
			Query query = sessionFactory.getCurrentSession().createQuery("update Cart set quantity=? where userId=? and productId=?");
			query.setParameter(0, count);
			query.setParameter(1, userId);
			query.setParameter(2, productId);
			query.executeUpdate();
			return true;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public Cart checkIsExists(int userId, int productId) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Cart where userId=? and productId=?");
		query.setParameter(0, userId);
		query.setParameter(1, productId);
		return (Cart) query.uniqueResult();
	}

}
