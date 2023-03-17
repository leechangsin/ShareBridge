package com.sharebridge.service;

import java.util.List;

import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.RequestDto;

public interface ReviewService {
	int getReviewCountByMemberId(int memberId);
	
	// 작성해야할 후기 목록(상품번호 + 대여기간)
	List<RequestDto> reviewList(int member_id);
	
	// 작성해야할 후기 목록(상품명 + 렌터번호 + 금액)
	ProductDto reviewListTwo(int product_id);
	
	// 작성해야할 후기 목록(렌터 닉네임)
	String reviewListThree(int member_id);
}
