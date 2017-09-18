package com.lbcto.controler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lbcto.model.VO.CartVO;
import com.lbcto.model.entity.Cart;
import com.lbcto.model.entity.User;
import com.lbcto.model.service.CartService;
import com.lbcto.utils.GetCurrentDateTime;
import com.opensymphony.xwork2.ActionContext;

public class CartAction {

	@Autowired
	private CartService cartService;
	
	private List<CartVO> cartVOList;
	
	private Integer productId;
	private Integer count;
	private Cart cart = new Cart();
	
	public String getCartVO(){
		cartVOList = cartService.getCartVO(((User)ActionContext.getContext().getSession().get("user")).getId());
		//System.out.println(cartVOList.size());
		ActionContext.getContext().getSession().put("cartVOList", cartVOList);
		return "success";
	}
	
	public String addCart(){
		int uId = ((User)ActionContext.getContext().getSession().get("user")).getId();
		if(cartService.checkIsExistsService(uId, productId)==null){
			cart.setUserId(uId);
			cart.setProductId(productId);
			cart.setQuantity(count);
			cart.setCreateTime(GetCurrentDateTime.getNowTime());
			if(cartService.addCartService(cart)){
				return "success";
			}else{
				return "fail";
			}
		}else{
			count+=cartService.checkIsExistsService(uId, productId).getQuantity();
			if(cartService.changeCartCountService(uId, productId, count)){
				return "success";
			}else{
				return "fail";
			}
		}
			
	}
	
	public List<CartVO> getCartVOList() {
		return cartVOList;
	}

	public void setCartVOList(List<CartVO> cartVOList) {
		this.cartVOList = cartVOList;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	
	
	
	
}
