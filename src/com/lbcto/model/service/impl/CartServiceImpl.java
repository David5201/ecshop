package com.lbcto.model.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lbcto.model.VO.CartVO;
import com.lbcto.model.dao.CartDao;
import com.lbcto.model.dao.ProductDao;
import com.lbcto.model.entity.Cart;
import com.lbcto.model.service.CartService;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private ProductDao productDao;

	@Override
	public List<Cart> getCartInfoByUserIdService(int uId) {
		// TODO Auto-generated method stub
		return cartDao.getCartInfoByUserId(uId);
	}
	
	public List<CartVO> getCartVO(int uId){
		List<CartVO> CartVOlist=new ArrayList<CartVO>();
		for(Cart clist:cartDao.getCartInfoByUserId(uId)){
			CartVO cartVO =new CartVO();
			cartVO.setId(clist.getId());
			cartVO.setImgpath(productDao.getProductDetailById(clist.getProductId()).getMainImage());
			cartVO.setInfo(productDao.getProductDetailById(clist.getProductId()).getSubtitle());
			cartVO.setPrice(productDao.getProductDetailById(clist.getProductId()).getPrice());
			cartVO.setCount(clist.getQuantity());;
			cartVO.setTotal(clist.getQuantity()*productDao.getProductDetailById(clist.getProductId()).getPrice());
			CartVOlist.add(cartVO);
		}		
		return CartVOlist;
	}

	@Override
	public boolean addCartService(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.addCart(cart);
	}

	@Override
	public boolean changeCartCountService(int userId, int productId, int count) {
		// TODO Auto-generated method stub
		return cartDao.changeCartCount(userId, productId, count);
	}

	@Override
	public Cart checkIsExistsService(int userId, int productId) {
		// TODO Auto-generated method stub
		return cartDao.checkIsExists(userId, productId);
	}

}
