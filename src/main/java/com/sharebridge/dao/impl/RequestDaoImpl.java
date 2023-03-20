package com.sharebridge.dao.impl;

import java.util.List;

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
	public RequestDto getReqFrm(int request_id) {
		return session.selectOne(ns + "getReqFrm", request_id);
	}

	@Override
	public List<Integer> getProductPriceAndCate(int product_id) {
		return session.selectList(p_ns, product_id);
	}

	@Override
	public int updateReq(int request_id) {
		return session.update(ns + "updateReq", request_id);
	}
}
