package com.lbcto.model.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lbcto.model.dao.OrderDao;
import com.lbcto.model.entity.Order;
import com.lbcto.model.entity.OrderItem;

@Transactional
@Repository("orderDao")
public class OrderDaoImpl implements OrderDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean addOrder(Order order) {
		// TODO Auto-generated method stub
		try {
			sessionFactory.getCurrentSession().save(order);
			return true;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public List<Order> getOrders(int id) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Order where userId=?");
		query.setParameter(0, id);
		return query.list();
	}

	@Override
	public boolean addOrderDetail(OrderItem orderItem) {
		// TODO Auto-generated method stub
		try {
			sessionFactory.getCurrentSession().save(orderItem);
			return true;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<OrderItem> getOrderDetailsByOrderNo(long orderNO) {
		// TODO Auto-generated method stub
		System.out.println("getOrderDetailsByOrderNo");
		Query query = sessionFactory.getCurrentSession().createQuery("from OrderItem where orderNO=?");
		query.setLong(0, orderNO);
		return query.list();
	}

	@Override
	public Order getOrderByOrderNo(long orderNO) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Order where orderNO=?");
		query.setLong(0, orderNO);
		return (Order) query.uniqueResult();
	}

}
