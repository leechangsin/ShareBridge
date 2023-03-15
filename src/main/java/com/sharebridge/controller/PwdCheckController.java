package com.sharebridge.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharebridge.dto.MemberDto;
import com.sharebridge.service.MemberService;

@Controller
public class PwdCheckController {

	@Autowired
	MemberService memberService;
	
	@GetMapping(value="/mypage/pwd_check.do")
	public String pwdCheckView(HttpSession session, HttpServletResponse response) {
		if(session.getAttribute("member_id") == null) {
			System.out.println("로그인 페이지로 이동");
//			return "redirect://";
		} else if(session.getAttribute("redirectURL") == null) {
			response.setStatus(400);
			
			Cookie cookie = new Cookie("status", "forbidden");
			response.addCookie(cookie);
		}
		
		return "mypage_pwd_chk";
	}
	
	@PostMapping(value="/mypage/go_from.do")
	public void goFrom(String pwd, HttpSession session, HttpServletResponse response) {
		session.setAttribute("member_id", 1);
		
		if(session.getAttribute("member_id") == null) {
			System.out.println("로그인 페이지로 이동");
			
			response.setStatus(300);
			response.setHeader("Location", "로그인 페이지 URL");
		} else if(session.getAttribute("redirectURL") == null) {
			response.setStatus(403);
		} else {
			int member_id = (int) session.getAttribute("member_id");
			
			MemberDto memberDto = memberService.selectOneByMemberId(member_id);
			if(memberDto.getPwd().equals(pwd)) {
				String redirectURL = (String) session.getAttribute("redirectURL");
				
				response.setStatus(300);
				response.setHeader("Location", redirectURL);
			}
		}
	}
}
