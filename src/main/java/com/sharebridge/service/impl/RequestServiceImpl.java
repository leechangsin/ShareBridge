package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.RequestDao;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.service.RequestService;

@Service
public class RequestServiceImpl implements RequestService {
	@Autowired
	RequestDao dao;

	@Override
	public boolean insertReq(RequestDto dto) {
		int n = dao.insertReq(dto);
		return n>0?true:false;
	}

	@Override
	public RequestDto getReqFrm(int member_id) {
		return dao.getReqFrm(member_id);
	}

	@Override
	public int getProductPrice(int product_id) {
		return dao.getProductPrice(product_id);
	}

	@Override
	public int getProductCate(int product_id) {
		return dao.getProductCate(product_id);
	}
	
	@Override
	public boolean updateReq(int request_id) {
		int n = dao.updateReq(request_id);
		return n>0?true:false;
	}
}
