package com.sharebridge.controller.mypage;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharebridge.dto.MemberDto;
import com.sharebridge.service.MemberService;

@Controller
public class MyPagePwdCheckController {
	@Autowired
	MemberService memberService;
	
	@GetMapping(value="/mypage/pwd_check.do")
	public String pwdCheckView(HttpSession session, HttpServletResponse response) {
		if(session.getAttribute("login") == null) {
			session.setAttribute("required", true);
			return "redirect:/login.do";
		} else if(session.getAttribute("redirectURL") == null) {
			response.setStatus(400);
			
			Cookie cookie = new Cookie("status", "forbidden");
			response.addCookie(cookie);
		}
		
		return "mypage_pwd_chk";
	}
	
	@PostMapping(value="/mypage/go_from.do")
	public void goFrom(String pwd, HttpSession session, HttpServletResponse response) {
		if(session.getAttribute("login") == null) {
			session.setAttribute("required", true);
			
			response.setStatus(300);
			response.setHeader("Location", "/sharebridge/login.do");
		} else if(session.getAttribute("redirectURL") == null) {
			response.setStatus(403);
		} else {
			MemberDto memberInfo = (MemberDto) session.getAttribute("login");
			int member_id = memberInfo.getMember_id();
			
			MemberDto memberDto = memberService.selectOneByMemberId(member_id);
			if(memberDto.getPwd().equals(pwd)) {
				String redirectURL = (String) session.getAttribute("redirectURL");
				session.removeAttribute("redirectURL");
				
				response.setStatus(300);
				response.setHeader("Location", redirectURL);
			} else {
				response.setStatus(400);
			}
		}
	}
}