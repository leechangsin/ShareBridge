package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.WishDao;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.WishDto;
import com.sharebridge.service.WishService;

@Service
public class WishServiceImpl implements WishService {

	@Autowired
	WishDao dao;

	@Override
	public List<ProductDto> getAllWishByMemberId(int memberId) {
		return dao.getAllWishByMemberId(memberId);
	}

	@Override
	public int addWish(WishDto wishDto) {
		return dao.addWish(wishDto);
	}

	@Override
	public int removeWish(WishDto wishDto) {
		return dao.removeWish(wishDto);
	}

}
