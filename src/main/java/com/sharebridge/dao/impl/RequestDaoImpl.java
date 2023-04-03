package com.sharebridge.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.RequestDao;
import com.sharebridge.dto.RequestDto;

@Repository
public class RequestDaoImpl implements RequestDao {
	@Autowired
	SqlSession session;

	String ns = "Request.";
	String p_ns = "Product.";
	
	@Override
	public int insertReq(RequestDto dto) {
		return session.insert( ns + "insertReq", dto);
	}

	@Override
	public RequestDto getReqFrm(int member_id) {
		return session.selectOne(ns + "getReqFrm", member_id);
	}

	@Override
	public RequestDto getReqFrmByRequest_id(int request_id) {
		return session.selectOne(ns + "getReqFrmByRequest_id", request_id);
	}
	
	@Override
	public int getProductPrice(int product_id) {
		return session.selectOne(p_ns + "getProductPrice", product_id);
	}
	
	@Override
	public int getProductCate(int product_id) {
		return session.selectOne(p_ns + "getProductCate", product_id);
	}

	@Override
	public int updateReq(RequestDto dto) {
		return session.update(ns + "updateReq", dto);
	}

	@Override
	public RequestDto getRequestFormByRequest_id(int request_id) {
		return session.selectOne(ns + "getReqFrmByRequest_id", request_id);
	}
}
