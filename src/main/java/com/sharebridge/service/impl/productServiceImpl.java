package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.productDao;
import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.service.productService;

@Service
public class productServiceImpl implements productService {
	@Autowired
	productDao dao;

	@Override
	public List<CategoryDto> allCategory() {
		return dao.allCategory();
	}

	@Override
	public boolean insertProduct(ProductDto dto) {
		int n = dao.insertProduct(dto);
		return n>0?true:false;
	}

	@Override
	public boolean updateProduct(int product_id) {
		int n = dao.updateProduct(product_id);
		return n>0?true:false;
	}

	@Override
	public ProductDto getProduct(int product_id) {
		return dao.getProduct(product_id);
	}
}
