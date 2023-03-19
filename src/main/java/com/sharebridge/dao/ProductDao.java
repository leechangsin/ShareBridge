package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;

public interface ProductDao {
	List<CategoryDto> getAllCategory();
	
	int insertProduct(ProductDto dto);
	
	int getProductCountByMemberId(int memberId);
	
	List<ProductDto> getAllProducts();
	
	ProductDto getProductByProduct_id(int product_id);
	
	void updateStateTo1(int product_id);
	
	void updateStateTo0(int product_id);
}
