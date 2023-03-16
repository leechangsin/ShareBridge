package com.sharebridge.service;

import java.util.List;

import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;

public interface ProductService {
	List<CategoryDto> allCategory();
	
	boolean insertProduct(ProductDto dto);
	
	boolean updateProduct(int product_id);
	
	ProductDto getProduct(int product_id);
	
	CategoryDto getCate(int category_id);
	
	boolean delProduct(int product_id);
}
