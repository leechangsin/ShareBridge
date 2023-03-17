package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.CartDto;

public interface CartDao {
	List<CartDto> getAllCarts();
}
