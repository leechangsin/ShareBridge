package com.sharebridge.service;

import com.sharebridge.dto.RequestDto;

public interface RequestService {
	boolean insertReq(RequestDto dto);
	
	RequestDto getReqFrm(int member_id);
	
	RequestDto getReqFrmByRequest_id(int request_id);
	
	int getProductPrice(int product_id);
	
	int getProductCate(int product_id);
	
	boolean updateReq(RequestDto dto);
	
	RequestDto getRequestFormByRequest_id(int request_id);
}
