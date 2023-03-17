package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.WishDto;

public interface WishDao {
	List<WishDto> getAllWishByMemberId();
}
