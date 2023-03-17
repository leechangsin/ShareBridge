package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.ReviewDao;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewDao dao;

	@Override
	public int getReviewCountByMemberId(int memberId) {
		return dao.getReviewCountByMemberId(memberId);
	}

	// 작성해야할 후기 목록(상품번호 + 대여기간)
	@Override
	public List<RequestDto> reviewList(int member_id) {
		
		return dao.reviewList(member_id);
	}

	// 작성해야할 후기 목록(상품명 + 렌터번호 + 금액)
	@Override
	public ProductDto reviewListTwo(int product_id) {
		
		return dao.reviewListTwo(product_id);
	}

	// 작성해야할 후기 목록(렌터 닉네임)
	@Override
	public String reviewListThree(int member_id) {
		
		return dao.reviewListThree(member_id);
	}
}
