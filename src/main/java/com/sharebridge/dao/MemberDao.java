package com.sharebridge.dao;

import com.sharebridge.dto.MemberDto;

public interface MemberDao {
	// 아이디 찾기
	MemberDto idSearch(String phone_number);
	
	// 아이디 중복확인
	int idcheck(String email);
	
	// 닉네임 중복확인
	int nickcheck(String nickname);
	
	// 회원가입
	int addmember(MemberDto mem);
	
	// 로그인
	MemberDto login(MemberDto mem);
}
