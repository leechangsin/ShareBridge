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

	@Override
	public MemberDto idSearch(String phone_number) {
		
		return session.selectOne(ns + "idSearch", phone_number);
	}

	@Override
	public MemberDto selectOneByMemberId(int memberId) {
		return session.selectOne(ns + "selectOneByMemberId", memberId);
	}

	@Override
	public MemberDto selectOneByNickname(String nickname) {
		return session.selectOne(ns + "selectOneByNickname", nickname);
	}

	@Override
	public MemberDto selectOneByPhone_number(String phone_number) {
		return session.selectOne(ns + "selectOneByPhone_number", phone_number);
	}

	@Override
	public void updateMemberInfo(MemberDto newMemberInfo) {
		session.update(ns + "updateMemberInfo", newMemberInfo);
	}
}
