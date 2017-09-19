package com.lbcto.model.service.impl;

import java.util.List;

import com.lbcto.model.entity.Order;
import com.lbcto.model.entity.OrderItem;

public interface OrderService {

	
	boolean addOrderService(Order order);
	
	List<Order> getOrdersService(int id);
	
	boolean addOrderDetailService(OrderItem orderItem);
	
	List<OrderItem> getOrderDetailsByOrderNoService(long orderNO);
	
	Order getOrderByOrderNoService(long orderNO);
}
