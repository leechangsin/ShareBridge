package com.sharebridge.service;

import java.util.List;

import com.sharebridge.dto.RequestDto;

public interface RequestService {
	boolean insertReq(RequestDto dto);
	
	RequestDto getReqFrm(int request_id);
	
	List<Integer> getProductPriceAndCate(int product_id);
	
	boolean updateReq(int request_id);
}
