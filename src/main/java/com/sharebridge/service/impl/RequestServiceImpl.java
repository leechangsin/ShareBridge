package com.sharebridge.service.impl;

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
	public RequestDto getReqFrm(int request_id) {
		return dao.getReqFrm(request_id);
	}

}
