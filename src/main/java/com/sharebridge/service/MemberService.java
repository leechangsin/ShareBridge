package com.sharebridge.service;

import com.sharebridge.dto.MemberDto;

public interface MemberService {

	MemberDto idSearch(String phone_number);
	MemberDto selectOneByMemberId(int memberId);
}
