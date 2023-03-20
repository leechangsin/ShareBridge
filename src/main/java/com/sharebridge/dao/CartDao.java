package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.CartDto;
import com.sharebridge.dto.ProductDto;

public interface CartDao {
	List<ProductDto> getAllCarts();
	int removeCarts(List<CartDto> carts);
}
