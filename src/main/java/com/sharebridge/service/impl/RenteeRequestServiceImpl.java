package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.RenteeRequestDao;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.param.MypageParam;
import com.sharebridge.service.RenteeRequestService;

@Service
public class RenteeRequestServiceImpl implements RenteeRequestService {
	@Autowired
	RenteeRequestDao dao;

	@Override
	public List<RequestDto> getRequestListByMemberId(MypageParam mp) {
		return dao.getRequestListByMemberId(mp);
	}

	@Override
	public String cancelRequest(int member_id, int request_id) {
//		로그인한 사용자가 신청한 대여 신청서인지 확인
//		로그인한 사용자가 신청한 대여 신청서가 아니라면 400 Response
		RequestDto request = dao.getRequestByRequest_id(request_id);
		if(request == null || request.getMember_id() != member_id) {
			return "forbidden";
		}
		
//		대여 신청 취소 가능 여부 확인
//		대여 신청 취소가 불가능하다면 409 Response
		if(request.getIs_cancel() == 1) {
			// 이미 취소 한 요청서라면
			return "already";
		} else if(request.getIs_accept() != 0) {
			// 렌터가 요청서 수락 또는 거절했다면
			return "conflict";
		}
		
//		대여 신청 취소 처리
		dao.cancelRequest(request_id);
		
		return "success";
	}
}
