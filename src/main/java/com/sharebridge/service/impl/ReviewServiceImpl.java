package com.sharebridge.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.ReviewDao;
import com.sharebridge.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewDao dao;

	@Override
	public int getReviewCountByMemberId(int memberId) {
		return dao.getReviewCountByMemberId(memberId);
	}
}
