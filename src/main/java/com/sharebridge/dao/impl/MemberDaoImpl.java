package com.sharebridge.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.MemberDao;
import com.sharebridge.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession session;
	
	String ns = "Member.";

	// 아이디 찾기
	@Override
	public MemberDto idSearch(String phone_number) {
		
		return session.selectOne(ns + "idSearch", phone_number);
	}
	
	@Override
	public MemberDto selectOneByMemberId(int memberId) {
		return session.selectOne(ns + "selectOneByMemberId", memberId);
	}

	// 아이디 중복체크
	@Override
	public int idcheck(String email) {
		
		return session.selectOne(ns + "idcheck", email);
	}

	// 닉네임 중복체크
	@Override
	public int nickcheck(String nickname) {
		
		return session.selectOne(ns + "nickcheck", nickname);
	}

	// 회원가입
	@Override
	public int addmember(MemberDto mem) {
		
		return session.insert(ns + "addmember", mem);
	}

	// 로그인
	@Override
	public MemberDto login(MemberDto mem) {
		
		return session.selectOne(ns + "login", mem);
	}

	// 비밀번호 변경
	@Override
	public int updatePw(MemberDto mem) {
		
		return session.update(ns + "updatePw", mem);
	}
}