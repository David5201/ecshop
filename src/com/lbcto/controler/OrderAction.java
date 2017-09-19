package com.lbcto.controler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lbcto.model.entity.Address;
import com.lbcto.model.entity.Order;
import com.lbcto.model.entity.OrderItem;
import com.lbcto.model.entity.User;
import com.lbcto.model.service.AddressService;
import com.lbcto.model.service.CartService;
import com.lbcto.model.service.ProductService;
import com.lbcto.model.service.impl.OrderService;
import com.lbcto.utils.GetCurrentDateTime;
import com.lbcto.utils.OrderCodeNo;
import com.opensymphony.xwork2.ActionContext;

public class OrderAction {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private  ProductService productService;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private CartService cartService;
	
	private Order order =new Order();
	private OrderItem orderItem = new OrderItem();
	private List<OrderItem> orderDetaillist = new ArrayList<OrderItem>();
	private List<Order> orderlist;
	private int addressID;
	private double payment;
	private String count;
	private String productsID;
	private long orderNo;
	
	public String addOrder(){
		order.setOrderNo(OrderCodeNo.getOrderNo());
		User user = ((User)ActionContext.getContext().getSession().get("user"));
		order.setUserId(user.getId());
		order.setShippingId(addressID);
		order.setPayment(payment);
		order.setStatus(10);
		order.setCreateTime(GetCurrentDateTime.getNowTime());
		order.setEndTime(addressService.getAddressInfoByIdService(addressID).getName());
		String[] product=null;
		String[] counts=null;
		product=productsID.split(",");
		counts=count.split(",");		
		orderService.addOrderService(order);
		addOrderToSession();
		for(int i=0;i<product.length;i++){
			orderItem.setUserId(user.getId());
			orderItem.setOrderNo(order.getOrderNo());
			orderItem.setProductId(Integer.parseInt(product[i]));
			orderItem.setProductName(productService.getProductDetailByIdService(Integer.parseInt(product[i])).getSubtitle());
			orderItem.setProductImage(productService.getProductDetailByIdService(Integer.parseInt(product[i])).getMainImage());
			orderItem.setUnitPrice(productService.getProductDetailByIdService(Integer.parseInt(product[i])).getPrice());
			orderItem.setQuantity(Integer.parseInt(counts[i]));
			orderItem.setTotalPrice(orderItem.getUnitPrice()*orderItem.getQuantity());
			orderItem.setCreateTime(GetCurrentDateTime.getNowTime());
			orderService.addOrderDetailService(orderItem);
		}
		deleteCart();//清空购物车
		
		/*System.out.println(order);
		System.out.println(addressID);
		System.out.println(payment);
		System.out.println(count);
		System.out.println(productsID);
		System.out.println(product.length);
		System.out.println(counts.length);*/
		return "success";
	}
	
	public String showOrders(){
		addOrderToSession();
		return "success";
	}
	
	public String showOrderDetails(){
		
		orderDetaillist = orderService.getOrderDetailsByOrderNoService(orderNo);
		ActionContext.getContext().getSession().put("orderDetaillist", orderDetaillist);
		
		order = orderService.getOrderByOrderNoService(orderNo);
		ActionContext.getContext().getSession().put("order", order);
		
		int addreID = order.getShippingId();
		Address address = addressService.getAddressInfoByIdService(addreID);
		ActionContext.getContext().getSession().put("address", address);
		return "success";
	}
	
	//重写订单session
	public void addOrderToSession(){
		order.setOrderNo(OrderCodeNo.getOrderNo());
		User user = ((User)ActionContext.getContext().getSession().get("user"));
		orderlist=orderService.getOrdersService(user.getId());
		ActionContext.getContext().getSession().put("orderlist", orderlist);
	}
	
	//删除购物车
	public void deleteCart(){
		User user = ((User)ActionContext.getContext().getSession().get("user"));
		cartService.deleteCartByUIdService(user.getId());
	}

	public int getAddressID() {
		return addressID;
	}

	public void setAddressID(int addressID) {
		this.addressID = addressID;
	}

	public double getPayment() {
		return payment;
	}

	public void setPayment(double payment) {
		this.payment = payment;
	}

	public String getProductsID() {
		return productsID;
	}

	public void setProductsID(String productsID) {
		this.productsID = productsID;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}
	
	
	
}
