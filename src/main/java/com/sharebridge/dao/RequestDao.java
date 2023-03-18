package com.sharebridge.dao;

import com.sharebridge.dto.RequestDto;

public interface RequestDao {
	int insertReq(RequestDto dto);
	
	RequestDto getReqFrm(int request_id);
}
