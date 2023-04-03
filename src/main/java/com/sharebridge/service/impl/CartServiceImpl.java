package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.CartDao;
import com.sharebridge.dto.CartDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.service.CartService;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	CartDao dao;

	@Override
	public List<ProductDto> getAllCarts() {
		return dao.getAllCarts();
	}

	@Override
	public int removeCarts(List<CartDto> carts) {
		return dao.removeCarts(carts);
	}

	@Override
	public void addCart(CartDto dto) {
		dao.addCart(dto);
	}

	@Override
	public List<CartDto> getCartList(int member_id) {
		return dao.getCartList(member_id);
	}
}
