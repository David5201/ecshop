package com.lbcto.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.lbcto.model.dao.ProductDao;
import com.lbcto.model.entity.Product;
import com.lbcto.model.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	@Override
	public List<Product> getProductsListByPIDService(int pId) {
		// TODO Auto-generated method stub
		return productDao.getProductsListByPID(pId);
	}

	@Override
	public Product getProductDetailByIdService(int productId) {
		// TODO Auto-generated method stub
		return productDao.getProductDetailById(productId);
	}
	

}
