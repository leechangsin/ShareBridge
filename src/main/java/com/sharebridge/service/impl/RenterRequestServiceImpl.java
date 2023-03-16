package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.RenterRequestDao;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.param.MypageParam;
import com.sharebridge.service.RenterRequestService;

@Service
public class RenterRequestServiceImpl implements RenterRequestService {
	@Autowired
	RenterRequestDao dao;

	@Override
	public List<RequestDto> getRequestListByMemberId(MypageParam mp) {
		return dao.getRequestListByMemberId(mp);
	}
}
