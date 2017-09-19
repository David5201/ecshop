package com.lbcto.model.dao;

import java.util.List;

import com.lbcto.model.entity.Order;
import com.lbcto.model.entity.OrderItem;

public interface OrderDao {

	boolean addOrder(Order order);
	
	List<Order> getOrders(int id);
	
	boolean addOrderDetail(OrderItem orderItem);
	
	List<OrderItem> getOrderDetailsByOrderNo(long orderNO);
	
	Order getOrderByOrderNo(long orderNO);
}
