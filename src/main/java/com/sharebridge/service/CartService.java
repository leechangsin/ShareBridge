package com.sharebridge.service;

import java.util.List;

import com.sharebridge.dto.CartDto;
import com.sharebridge.dto.ProductDto;

public interface CartService {
	List<ProductDto> getAllCarts();
	int removeCarts(List<CartDto> carts);
}
