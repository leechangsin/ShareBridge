package com.sharebridge.service;

import java.util.List;

import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;

public interface ProductService {
	List<CategoryDto> getAllCategory();
	
	boolean insertProduct(ProductDto dto);
	
	int getProductCountByMemberId(int memberId);
	
	List<ProductDto> getAllProducts();
	
	boolean updateProduct(ProductDto dto);
	
	ProductDto getProduct(int product_id);
	
	CategoryDto getCate(int category_id);
	
	boolean delProduct(int product_id);
}
