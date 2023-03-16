package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.RenteeRequestDao;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.param.MypageParam;
import com.sharebridge.service.RenteeRequestService;

@Service
public class RenteeRequestServiceImpl implements RenteeRequestService {
	@Autowired
	RenteeRequestDao dao;

	@Override
	public List<RequestDto> getRequestListByMemberId(MypageParam mp) {
		return dao.getRequestListByMemberId(mp);
	}
}
