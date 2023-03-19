package com.sharebridge.service;

import com.sharebridge.dto.RequestDto;

public interface RequestService {
	boolean insertReq(RequestDto dto);
	
	RequestDto getReqFrm(int request_id);
}
