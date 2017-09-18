package com.lbcto.model.dao;

import java.util.List;

import com.lbcto.model.entity.Product;

public interface ProductDao {

	List<Product> getProductsListByPID(int pId);
	
	Product getProductDetailById(int productId);
}
