package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.RequestDto;
import com.sharebridge.param.MypageParam;

public interface RenteeRequestDao {
	List<RequestDto> getRequestListByMemberId(MypageParam mp);
	RequestDto getRequestByRequest_id(int request_id);
	void cancelRequest(int request_id);
}
