package com.sharebridge.service;

import java.util.List;

import com.sharebridge.dto.WishDto;

public interface WishService {
	List<WishDto> getAllWishByMemberId();
}
