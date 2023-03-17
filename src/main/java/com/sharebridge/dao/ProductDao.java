package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;

public interface ProductDao {
	List<CategoryDto> allCategory();	
		
	int insertProduct(ProductDto dto);
	
	int updateProduct(ProductDto dto);
	
	ProductDto getProduct(int product_id);
	
	CategoryDto getCate(int category_id);
	
	int delProduct(int product_id);
}
