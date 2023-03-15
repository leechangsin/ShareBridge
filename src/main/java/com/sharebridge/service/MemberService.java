package com.sharebridge.service;

import com.sharebridge.dto.MemberDto;

public interface MemberService {
	// 아이디 찾기
	MemberDto idSearch(String phone_number);
	
	// 아이디 중복확인
	boolean idcheck(String email);
	
	// 닉네임 중복확인
	boolean nickcheck(String nickname);
	
	// 회원가입
	boolean addmember(MemberDto mem);
	
	// 로그인
	MemberDto login(MemberDto mem);
	
	// 임시 비밀번호 제작
	boolean updatePw(MemberDto mem);
	
	// 임시 비밀번호 이메일로 보내기
	void sendEmail(MemberDto mem) throws Exception;
	
	MemberDto selectOneByMemberId(int memberId);
}