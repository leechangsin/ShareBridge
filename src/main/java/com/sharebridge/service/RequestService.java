package com.sharebridge.service;

import java.util.List;

import com.sharebridge.dto.RequestDto;

public interface RequestService {
	boolean insertReq(RequestDto dto);
	
	RequestDto getReqFrm(int member_id);
	
	int getProductPrice(int product_id);
	
	int getProductCate(int product_id);
	
	boolean updateReq(int request_id);
}
