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

	@Override
	public MemberDto idSearch(String phone_number) {
		
		return dao.idSearch(phone_number);
	}

	@Override
	public MemberDto selectOneByMemberId(int memberId) {
		return dao.selectOneByMemberId(memberId);
	}

	@Override
	public String updateMemberInfo(MemberDto newMemberInfo, MemberDto oldMemberInfo) {
		String newPwd = newMemberInfo.getPwd();
		String newNickname = newMemberInfo.getNickname();
		String newName = newMemberInfo.getName();
		String newPhone_number = newMemberInfo.getPhone_number();
		
		String oldPwd = oldMemberInfo.getPwd();
		String oldNickname = oldMemberInfo.getNickname();
		String oldName = oldMemberInfo.getName();
		String oldPhone_number = oldMemberInfo.getPhone_number();
		
		boolean changePwd = !newPwd.equals(oldPwd);
		boolean changeNickname = !newNickname.equals(oldNickname);
		boolean changeName = !newName.equals(oldName);
		boolean changePhone_number = !newPhone_number.equals(oldPhone_number);
		
		if(!changePwd) {
			// 비밀번호를 변경하지 않으므로 null 처리
			newMemberInfo.setPwd(null);
		}
		
		if(!changeNickname) {
			// 닉네임을 변경하지 않으므로 null 처리
			newMemberInfo.setNickname(null);
		} else {
			// 닉네임을 변경한다면 변경할 닉네임이 사용중인지 확인
			MemberDto otherMemberInfo = dao.selectOneByNickname(newNickname);
			if(otherMemberInfo != null) {
				return "nickname_conflict";
			}
		}
		
		if(!changeName) {
			// 이름을 변경하지 않으므로 null 처리
			newMemberInfo.setName(null);
		}
		
		if(!changePhone_number) {
			newMemberInfo.setPhone_number(null);
		} else {
			// 휴대폰번호를 변경한다면 변경할 휴대폰 번호가 사용중인지 확인
			MemberDto otherMemberInfo = dao.selectOneByPhone_number(newPhone_number);
			if(otherMemberInfo != null) {
				return "phone_number_conflict";
			}
		}
		
		if(changePwd || changeNickname || changeName || changePhone_number) {
			newMemberInfo.setMember_id(oldMemberInfo.getMember_id());
			
			dao.updateMemberInfo(newMemberInfo);
			
			return "success";
		} else {
			return "not_change";
		}
	}
}
