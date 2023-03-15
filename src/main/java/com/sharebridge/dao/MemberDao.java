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
	
	// 비밀번호 변경
	int updatePw(MemberDto mem);
	
	// 아이디로 회원 정보 조회
	MemberDto selectOneByMemberId(int memberId);
	
	// 닉네임으로 회원 정보 조회
	MemberDto selectOneByNickname(String nickname);
	
	// 휴대전화 번호로 회원 정보 조회
	MemberDto selectOneByPhone_number(String phone_number);
	
	// 회원 정보 수정
	void updateMemberInfo(MemberDto newMemberInfo);
}
