package com.sharebridge.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.productDao;
import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;

@Repository
public class productDaoImpl implements productDao {
	@Autowired
	SqlSession session;
	
	String ns = "Product.";	
	
	@Override
	public List<CategoryDto> allCategory() {
		return session.selectList("Category.allCategory");
	}

	@Override
	public int insertProduct(ProductDto dto) {
		return session.insert(ns + "insertProduct", dto);
	}

	@Override
	public int updateProduct(int product_id) {
		return session.update(ns + "updateProduct", product_id);
	}

	@Override
	public ProductDto getProduct(int product_id) {
		return session.selectOne(ns + "getProduct", product_id);
	}
	
}
