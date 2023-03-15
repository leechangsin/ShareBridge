package com.sharebridge.service;

import java.util.List;

import com.sharebridge.dto.RequestDto;
import com.sharebridge.param.MypageParam;

public interface RenterRequestService {
	List<RequestDto> getRequestListByMemberId(MypageParam mp);
}
