package com.sharebridge.dao;

import com.sharebridge.dto.MemberDto;

public interface MemberDao {

	MemberDto idSearch(String phone_number);
	MemberDto selectOneByMemberId(int memberId);
	MemberDto selectOneByNickname(String nickname);
	MemberDto selectOneByPhone_number(String phone_number);
	void updateMemberInfo(MemberDto newMemberInfo);
}
