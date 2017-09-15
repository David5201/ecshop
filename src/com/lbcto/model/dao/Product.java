package com.lbcto.model.dao;

import java.util.List;

public interface Product {

	List<Product> getProductsByCategoryId(int id);
}
