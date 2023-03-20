package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.WishDto;

public interface WishDao {
	List<ProductDto> getAllWishByMemberId(int memberId);
	int addWish(WishDto wishDto);
	int removeWish(WishDto wishDto);
}
