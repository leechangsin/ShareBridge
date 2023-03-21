package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.ReviewDao;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.dto.ReviewDto;
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
	
	// 후기 작성
	@Override
	public boolean writeRev(ReviewDto dto) {
		int n = dao.writeRev(dto);
		return n>0?true:false;
	}

	// 후기 작성했는지 확인용
	@Override
	public boolean writeRevTwo(int request_id) {
		int n = dao.writeRevTwo(request_id);
		return n>0?true:false;
	}

	// 대여 신청서 번호로 후기 내용 가져오기
	@Override
	public ReviewDto revFromReq(int request_id) {
		
		return dao.revFromReq(request_id);
	}

	// 후기 수정
	@Override
	public boolean updateRev(ReviewDto dto) {
		int n = dao.updateRev(dto);
		return n>0?true:false;
	}
	
	// 후기 삭제
	@Override
	public boolean deleteRev(int request_id) {
		int n = dao.deleteRev(request_id);
		return n>0?true:false;
	}
	@Override
	public boolean deleteRevTwo(int request_id) {
		int n = dao.deleteRevTwo(request_id);
		return n>0?true:false;
	}
	
	// 후기 번호로 후기 데이터 가져오기
	@Override
	public ReviewDto selecAllRev(int review_id) {
		
		return dao.selecAllRev(review_id);
	}

	// 후기 답글
	@Override
	public boolean answerRev(ReviewDto dto) {
		int n = dao.answerRev(dto);
		return n>0?true:false;
	}

	// 렌터번호로 후기 가져오기(답글 순서 고려)
	@Override
	public List<ReviewDto> revListAnsOrder(int renter_id) {
		
		return dao.revListAnsOrder(renter_id);
	}

	// 답글 삭제
	@Override
	public boolean deleteAns(int review_id) {
		int n = dao.deleteAns(review_id);
		return n>0?true:false;
	}
}
