package com.lbcto.controler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lbcto.model.entity.Product;
import com.lbcto.model.service.ProductService;
import com.opensymphony.xwork2.ActionContext;

public class ProductAction {
	
	@Autowired
	private  ProductService productService;
	private String msg;
	private List<Product> plist;
	private Integer categoryId;
	private Integer productId;
	
	//获得某类别商品列表
	public String getProductList(){
		plist=productService.getProductsListByPIDService(categoryId);
		ActionContext.getContext().getSession().put("plist", plist);
		return "success";
	}
	
	//获得单个商品详情
	public String getProductDetail(){
		ActionContext.getContext().getSession().put("product",productService.getProductDetailByIdService(productId));
		return "success";
	}
	


	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}



	public List<Product> getPlist() {
		return plist;
	}



	public void setPlist(List<Product> plist) {
		this.plist = plist;
	}



	public Integer getCategoryId() {
		return categoryId;
	}



	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}



	public Integer getProductId() {
		return productId;
	}



	public void setProductId(Integer productId) {
		this.productId = productId;
	}


	

	
	
	
}
