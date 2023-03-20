package com.sharebridge.service;

import java.util.List;

import com.sharebridge.dto.CartDto;

public interface CartService {
	List<CartDto> getAllCarts();
	int removeCarts(List<CartDto> carts);
}
