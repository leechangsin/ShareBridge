package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.dto.ReviewDto;

public interface ReviewDao {
	int getReviewCountByMemberId(int memberId);
	
	// 작성해야할 후기 목록(상품번호 + 대여기간)
	List<RequestDto> reviewList(int member_id);
	
	// 작성해야할 후기 목록(상품명 + 렌터번호 + 금액)
	ProductDto reviewListTwo(int product_id);
	
	// 작성해야할 후기 목록(렌터 닉네임)
	String reviewListThree(int member_id);
	
	// 후기 작성
	int writeRev(ReviewDto dto);
	
	// 후기 작성이 됐는지를 표시
	int writeRevTwo(int request_id);
	
	// 대여신청서 번호로 후기 내용 가져오기
	ReviewDto revFromReq(int request_id);
	
	// 후기 수정
	int updateRev(ReviewDto dto);
	
	// 후기 삭제
	int deleteRev(int request_id);
	int deleteRevTwo(int request_id);
	
	// 후기 번호로 후기 데이터 가져오기
	ReviewDto selecAllRev(int review_id);
	
	// 후기 답글
	int answerRev(ReviewDto dto);
	
	// 렌터번호로 후기 가져오기(답글 순서 고려)
	List<ReviewDto> revListAnsOrder(int renter_id);
}
