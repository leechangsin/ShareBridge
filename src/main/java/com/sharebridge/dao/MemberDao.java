package com.sharebridge.dao;

import com.sharebridge.dto.MemberDto;

public interface MemberDao {

	MemberDto idSearch(String phone_number);
}
