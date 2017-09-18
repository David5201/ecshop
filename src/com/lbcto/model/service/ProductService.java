package com.lbcto.model.service;

import java.util.List;

import com.lbcto.model.entity.Product;


public interface ProductService {
	
	List<Product> getProductsListByPIDService(int pId);
	
	Product getProductDetailByIdService(int productId);

}
