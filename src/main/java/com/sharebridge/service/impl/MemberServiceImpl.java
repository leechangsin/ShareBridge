package com.sharebridge.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.MemberDao;
import com.sharebridge.dto.MemberDto;
import com.sharebridge.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;

	@Override
	public MemberDto idSearch(String phone_number) {
		
		return dao.idSearch(phone_number);
	}

	@Override
	public MemberDto selectOneByMemberId(int memberId) {
		return dao.selectOneByMemberId(memberId);
	}
}
