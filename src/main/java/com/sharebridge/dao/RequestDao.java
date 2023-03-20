package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.RequestDto;

public interface RequestDao {
	int insertReq(RequestDto dto);
	
	RequestDto getReqFrm(int member_id);
	
	int getProductPrice(int product_id);
	
	int getProductCate(int product_id);
	
	int updateReq(int request_id);
}
