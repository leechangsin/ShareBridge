package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.QuestionDto;
import com.sharebridge.dto.ReviewDto;
import com.sharebridge.param.BaseLayoutParam;

public interface ProductDao {
	List<CategoryDto> getAllCategory();
	
	int insertProduct(ProductDto dto);
	
	int getProductCountByMemberId(int memberId);
	
	List<ProductDto> getAllProducts();
	
	List<ProductDto> getCategoryProducts(int category_id);
	
	List<ProductDto> getTermProducts(String term);
	
	List<ProductDto> getCategoryTermProducts(BaseLayoutParam bp);
		
	int updateProduct(ProductDto dto);
	
	ProductDto getProduct(int product_id);
	
	CategoryDto getCate(int category_id);
	
	int delProduct(int product_id);
	
	ProductDto getProductByProduct_id(int product_id);
	
	void updateStateTo1(int product_id);
	
	void updateStateTo0(int product_id);
	
	List<ReviewDto> getReviewList(int renter_id);
	
	List<QuestionDto> getQuestionList();
	
	List<ProductDto> getProductListForRenter(int member_id);
	
	String getProductImg(int product_id);
}
