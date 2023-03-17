package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.ProductDao;
import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao dao;

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
	public boolean updateProduct(ProductDto dto) {
		int n = dao.updateProduct(dto);
		return n>0?true:false;
	}

	@Override
	public ProductDto getProduct(int product_id) {
		return dao.getProduct(product_id);
	}

	@Override
	public CategoryDto getCate(int category_id) {
		return dao.getCate(category_id);
	}

	@Override
	public boolean delProduct(int product_id) {
		int n = dao.delProduct(product_id);
		return n>0?true:false;
	}
}
