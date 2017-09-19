package com.lbcto.model.service;

import java.util.List;

import com.lbcto.model.VO.CartVO;
import com.lbcto.model.entity.Cart;

public interface CartService {

	List<Cart> getCartInfoByUserIdService(int uId);
	
	List<CartVO> getCartVO(int uId);
	
	boolean addCartService(Cart cart);
	
	boolean changeCartCountService(int userId,int productId,int count);//修改数量
	
	Cart checkIsExistsService(int userId,int productId);//判断是否存在某商品
	
	boolean deleteCartByUIdService(int uid);
}
