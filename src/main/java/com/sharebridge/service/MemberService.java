package com.sharebridge.service;

import com.sharebridge.dto.MemberDto;
import com.sharebridge.param.MypageDeleteParam;

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
	
	// 아이디로 회원 정보 조회
	MemberDto selectOneByMemberId(int memberId);
	
	// 회원 정보 수정
	String updateMemberInfo(MemberDto newMemberInfo, MemberDto oldMemberInfo);
	
	// 회원 탈퇴
	void deleteByMember_id(MypageDeleteParam param);
}
