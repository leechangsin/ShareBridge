package com.sharebridge.service;

import java.util.List;

import com.sharebridge.dto.RequestDto;
import com.sharebridge.param.MypageParam;

public interface RenterRequestService {
	List<RequestDto> getRequestListByMemberId(MypageParam mp);
	String acceptRequest(int member_id, int request_id);
	String rejectRequest(int member_id, int request_id);
}
