package com.lbcto.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lbcto.model.dao.OrderDao;
import com.lbcto.model.entity.Order;
import com.lbcto.model.entity.OrderItem;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao orderDao;

	@Override
	public boolean addOrderService(Order order) {
		// TODO Auto-generated method stub
		return orderDao.addOrder(order);
	}

	@Override
	public List<Order> getOrdersService(int id) {
		// TODO Auto-generated method stub
		return orderDao.getOrders(id);
	}

	@Override
	public boolean addOrderDetailService(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return orderDao.addOrderDetail(orderItem);
	}

	@Override
	public List<OrderItem> getOrderDetailsByOrderNoService(long orderNO) {
		// TODO Auto-generated method stub
		return orderDao.getOrderDetailsByOrderNo(orderNO);
	}

	@Override
	public Order getOrderByOrderNoService(long orderNO) {
		// TODO Auto-generated method stub
		return orderDao.getOrderByOrderNo(orderNO);
	}

}
