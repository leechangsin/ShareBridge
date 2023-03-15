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

	// 아이디 찾기
	@Override
	public MemberDto idSearch(String phone_number) {
		
		return dao.idSearch(phone_number);
	}

	// 아이디 중복확인
	@Override
	public boolean idcheck(String email) {
		int n = dao.idcheck(email);
		return n>0?true:false;
	}

	// 닉네임 중복확인
	@Override
	public boolean nickcheck(String nickname) {
		int n = dao.nickcheck(nickname);
		return n>0?true:false;
	}

	// 회원가입
	@Override
	public boolean addmember(MemberDto mem) {
		int n = dao.addmember(mem);
		return n>0?true:false;
	}

	// 로그인
	@Override
	public MemberDto login(MemberDto mem) {
		
		return dao.login(mem);
	}
}
