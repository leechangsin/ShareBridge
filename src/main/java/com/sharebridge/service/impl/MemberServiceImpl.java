package com.sharebridge.service.impl;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.MemberDao;
import com.sharebridge.dto.MemberDto;
import com.sharebridge.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;

	// 아이디 찾기
	@Override
	public MemberDto idSearch(String phone_number) {
		
		return dao.idSearch(phone_number);
	}

	// 아이디 중복확인
	@Override
	public boolean idcheck(String email) {
		int n = dao.idcheck(email);
		return n>0?true:false;
	}

	// 닉네임 중복확인
	@Override
	public boolean nickcheck(String nickname) {
		int n = dao.nickcheck(nickname);
		return n>0?true:false;
	}

	// 회원가입
	@Override
	public boolean addmember(MemberDto mem) {
		int n = dao.addmember(mem);
		return n>0?true:false;
	}

	// 로그인
	@Override
	public MemberDto login(MemberDto mem) {
		
		return dao.login(mem);
	}

	// 비밀번호 변경
	@Override
	public boolean updatePw(MemberDto mem) {
		int n = dao.updatePw(mem);
		return n>0?true:false;
	}

	// 임시 비밀번호 이메일로 보내기
	@Override
	public void sendEmail(MemberDto mem) throws Exception {
		// 메일 서버 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //지메일 이용시 smtp.gmail.com
		String hostSMTPid = "zoro317@naver.com";
		String hostSMTPpwd = "patrick@@";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "cmj@sharebridge.com";
		String fromName = "차민재";
		String subject = "";
		String msg = "";

		subject = "sharebridge 임시 비밀번호 입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += mem.getEmail() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += mem.getPwd() + "</p></div>";
		
		// 받는 사람 E-Mail 주소
		String mail = mem.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //지메일 이용시 465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
}
