package com.lbcto.model.dao;

import java.util.List;

import com.lbcto.model.entity.Cart;

public interface CartDao {

	List<Cart> getCartInfoByUserId(int uId);
	
	boolean addCart(Cart cart);
	
	boolean changeCartCount(int userId,int productId,int count);//修改数量
	
	Cart checkIsExists(int userId,int productId);//判断是否存在某商品
}
