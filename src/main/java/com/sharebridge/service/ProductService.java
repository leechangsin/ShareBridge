package com.sharebridge.service;

import java.util.List;

import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;

public interface ProductService {
	List<CategoryDto> allCategory();
	
	boolean insertProduct(ProductDto dto);
	
	int getProductCountByMemberId(int memberId);
	
	List<ProductDto> getAllProducts();
}
