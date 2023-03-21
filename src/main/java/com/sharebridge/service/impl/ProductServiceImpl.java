package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.ProductDao;
import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.QuestionDto;
import com.sharebridge.dto.ReviewDto;
import com.sharebridge.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao dao;

	@Override
	public List<CategoryDto> getAllCategory() {
		return dao.getAllCategory();
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

	@Override
	public List<ProductDto> getAllProducts(int category_id) {
		if(category_id == 0) {
			return dao.getAllProducts();
		} else {
			return dao.getCategoryProducts(category_id);
		}
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

	@Override
	public List<ReviewDto> getReviewList(int renter_id) {
		return dao.getReviewList(renter_id);
	}

	@Override
	public List<QuestionDto> getQuestionList() {
		return dao.getQuestionList();
	}

	@Override
	public List<ProductDto> getProductListForRenter(int member_id) {
		return dao.getProductListForRenter(member_id);
	}
}
