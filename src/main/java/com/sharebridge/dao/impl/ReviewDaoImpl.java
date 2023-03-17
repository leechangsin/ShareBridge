package com.sharebridge.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.ReviewDao;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	SqlSession session;
	
	String ns = "Review.";

	@Override
	public int getReviewCountByMemberId(int memberId) {
		return session.selectOne(ns + "getReviewCountByMemberId", memberId);
	}

	// 작성해야할 후기 목록(상품번호 + 대여기간)
	@Override
	public List<RequestDto> reviewList(int member_id) {
		int memberId = member_id;
		return session.selectList(ns + "reviewList", memberId);
	}

	// 작성해야할 후기 목록(상품명 + 렌터번호 + 금액)
	@Override
	public ProductDto reviewListTwo(int product_id) {
		
		return session.selectOne(ns + "reviewListTwo", product_id);
	}

	// 작성해야할 후기 목록(렌터 닉네임)
	@Override
	public String reviewListThree(int member_id) {
		
		return session.selectOne(ns + "reviewListThree", member_id);
	}

	// 후기 작성
	@Override
	public int writeRev(ReviewDto dto) {
		
		return session.insert(ns + "writeRev", dto);
	}
}
