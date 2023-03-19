package com.sharebridge.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.RenteeRequestDao;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.param.MypageParam;

@Repository
public class RenteeRequestImpl implements RenteeRequestDao {
	@Autowired
	SqlSession session;
	
	String ns = "RenteeRequest.";
	
	@Override
	public List<RequestDto> getRequestListByMemberId(MypageParam mp) {
		return session.selectList(ns + "selectAllByMemberId", mp);
	}
	
	@Override
	public RequestDto getRequestByRequest_id(int request_id) {
		return session.selectOne(ns + "getRequestByRequeste_id");
	}

	@Override
	public void cancelRequest(int request_id) {
		session.update(ns + "cancelRequest", request_id);
	}
}
