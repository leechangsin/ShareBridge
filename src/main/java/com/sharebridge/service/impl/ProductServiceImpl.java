package com.sharebridge.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.ProductDao;
import com.sharebridge.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;
	
	@Override
	public int getProductCountByMemberId(int memberId) {
		return dao.getProductCountByMemberId(memberId);
	}
	
}
