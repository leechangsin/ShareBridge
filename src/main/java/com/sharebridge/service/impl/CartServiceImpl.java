package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.CartDao;
import com.sharebridge.dto.CartDto;
import com.sharebridge.service.CartService;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	CartDao dao;

	@Override
	public List<CartDto> getAllCarts() {
		return dao.getAllCarts();
	}
	

}
