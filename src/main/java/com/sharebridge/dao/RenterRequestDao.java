package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.RequestDto;
import com.sharebridge.param.MypageParam;

public interface RenterRequestDao {
	List<RequestDto> getRequestListByMemberId(MypageParam mp);
	void acceptRequest(int request_id);
}
