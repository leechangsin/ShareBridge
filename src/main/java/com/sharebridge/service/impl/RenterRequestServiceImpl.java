package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.ProductDao;
import com.sharebridge.dao.RenteeRequestDao;
import com.sharebridge.dao.RenterRequestDao;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.param.MypageParam;
import com.sharebridge.service.RenterRequestService;

@Service
public class RenterRequestServiceImpl implements RenterRequestService {
	@Autowired
	RenteeRequestDao renteeDao;
	
	@Autowired
	RenterRequestDao renterDao;
	
	@Autowired
	ProductDao productDao;
	
	@Override
	public List<RequestDto> getRequestListByMemberId(MypageParam mp) {
		return renterDao.getRequestListByMemberId(mp);
	}

	@Override
	public String acceptRequest(int member_id, int request_id) {
		// 요청서 아이디로 요청서 정보 가져오기
		RequestDto request = renteeDao.getRequestByRequest_id(request_id);
		if(request == null) {
			return "forbidden";
		}
		
		// 요청서 정보에 기록된 물품 아이디로 물품 정보 가져오기
		ProductDto product = productDao.getProductByProduct_id(request.getProduct_id());
		if(product.getMember_id() != member_id) {
			// 다른 사람이 올린 물품의 요청서를 수락하는 경우
			return "forbidden";
		}
		
//		대여 신청 수락 가능 여부 확인
//		대여 신청 수락이 불가능하다면 409 Response
		if(request.getIs_cancel() == 1) {
			// 이미 취소 한 요청서라면
			return "conflict";
		} else if(request.getIs_accept() != 0) {
			// 렌터가 요청서 수락 또는 거절했다면
			return "already";
		}
		
//		대여 신청 수락 처리
		renterDao.acceptRequest(request_id);
		// 대여 상태를 대여중 으로 변경
		productDao.updateStateTo1(request.getProduct_id());
		
		return "success";
	}

	@Override
	public String rejectRequest(int member_id, int request_id) {
		// 요청서 아이디로 요청서 정보 가져오기
		RequestDto request = renteeDao.getRequestByRequest_id(request_id);
		if(request == null) {
			return "forbidden";
		}
		
		// 요청서 정보에 기록된 물품 아이디로 물품 정보 가져오기
		ProductDto product = productDao.getProductByProduct_id(request.getProduct_id());
		if(product.getMember_id() != member_id) {
			// 다른 사람이 올린 물품의 요청서를 수락하는 경우
			return "forbidden";
		}
		
//		대여 신청 수락 가능 여부 확인
//		대여 신청 수락이 불가능하다면 409 Response
		if(request.getIs_cancel() == 1) {
			// 이미 취소 한 요청서라면
			return "conflict";
		} else if(request.getIs_accept() != 0) {
			// 렌터가 요청서 수락 또는 거절했다면
			return "already";
		}
		
//		대여 신청 거절 처리
		renterDao.rejectRequest(request_id);
		
		return "success";
	}
}
