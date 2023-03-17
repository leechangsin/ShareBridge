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
	
	String c_ns = "Category.";
	String ns = "Product.";	
	
	@Override
	public List<CategoryDto> getAllCategory() {
		return session.selectList(c_ns + "allCategory");
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

	@Override
	public int updateProduct(ProductDto dto) {
		return session.update(ns + "updateProduct", dto);
	}

	@Override
	public ProductDto getProduct(int product_id) {
		return session.selectOne(ns + "getProduct", product_id);
	}

	@Override
	public CategoryDto getCate(int category_id) {
		return session.selectOne(c_ns + "getCate", category_id);
	}

	@Override
	public int delProduct(int product_id) {
		return session.update(ns + "delProduct", product_id);
	}
	
}
