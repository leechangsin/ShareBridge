package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.ProductDao;
import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.QuestionDto;
import com.sharebridge.dto.ReviewDto;
import com.sharebridge.param.BaseLayoutParam;
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
	public List<ProductDto> getAllProducts(BaseLayoutParam bp) {
		int category_id = bp.getCategory_id();
		String term = bp.getTerm();
		
		if(category_id == 0 && term == null) {
			return dao.getAllProducts();
		} else if(category_id != 0 && term == null) {
			return dao.getCategoryProducts(category_id);
		} else if(category_id == 0 && term != null) {
			return dao.getTermProducts(term);
		} else {
			return dao.getCategoryTermProducts(bp);
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
