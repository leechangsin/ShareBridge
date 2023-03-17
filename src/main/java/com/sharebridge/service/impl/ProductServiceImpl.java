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
	public int getProductCountByMemberId(int memberId) {
		return dao.getProductCountByMemberId(memberId);
	}
}
