package com.sharebridge.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.ProductDao;
import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SqlSession session;
	
	String ns = "Product.";	
	
	@Override
	public List<CategoryDto> getAllCategory() {
		return session.selectList("Category.allCategory");
	}

	@Override
	public int insertProduct(ProductDto dto) {
		return session.insert(ns + "insertProduct", dto);
	}
	
	@Override
	public int getProductCountByMemberId(int memberId) {
		return session.selectOne(ns + "getProductCountByMemberId", memberId);
	}

	@Override
	public List<ProductDto> getAllProducts() {
		return session.selectList("Product.getAllProducts");
	}
}
