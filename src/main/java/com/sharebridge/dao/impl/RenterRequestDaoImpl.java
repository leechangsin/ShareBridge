package com.sharebridge.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.RenterRequestDao;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.param.MypageParam;

@Repository
public class RenterRequestDaoImpl implements RenterRequestDao {
	@Autowired
	SqlSession session;
	
	String ns = "RenterRequest.";
	
	@Override
	public List<RequestDto> getRequestListByMemberId(MypageParam mp) {
		return session.selectList(ns + "selectAllByMemberId", mp);
	}

	@Override
	public void acceptRequest(int request_id) {
		session.update(ns + "acceptRequest", request_id);
	}

	@Override
	public void rejectRequest(int request_id) {
		session.update(ns + "rejectRequest", request_id);
	}
}
