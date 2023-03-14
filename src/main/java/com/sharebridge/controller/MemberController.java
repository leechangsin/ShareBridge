package com.sharebridge.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharebridge.dto.MemberDto;
import com.sharebridge.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	/* 은아꺼랑 겹치니까 일단 주석 처리
	@GetMapping(value = "baseLayout.do")
	public String baseLayout() {
		System.out.println("MemberController baseLayout " + new Date());
		
		return "baseLayout";
	}
	*/
	
	// 로그인 페이지로 이동
	@GetMapping(value = "login.do")
	public String login() {
		System.out.println("MemberController login " + new Date());
		
		return "login";
	}
	
	// 회원가입 페이지로 이동
	@GetMapping(value = "regi.do")
	public String regi() {
		System.out.println("MemberController regi " + new Date());
		
		return "regi";
	}
	
	// 아이디 찾기 페이지로 이동
	@GetMapping(value = "idSearch.do")
	public String idSearch() {
		System.out.println("MemberController idSearch " + new Date());
		
		return "idSearch";
	}
	
	// 패스워드 찾기 페이지로 이동
	@GetMapping(value = "pwdSearch.do")
	public String pwdSearch() {
		System.out.println("MemberController pwdSearch " + new Date());
		
		return "pwdSearch";
	}
	
	// 아이디 찾기에서 연락처 입력 후
	@PostMapping(value = "idSearchAf.do")
	public String idSearchAf(String phone_number, Model model) {
		System.out.println("MemberController idSearchAf " + new Date());
		
		MemberDto mem = service.idSearch(phone_number);
		
		model.addAttribute("mem", mem);
		
		return "idCorrect";
	}
	
	// 회원가입에서 아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "emailcheck.do",
					method = RequestMethod.POST,
					produces="application/String; charset=utf-8")
	public String emailcheck(String email) {
		System.out.println("MemberController emailcheck " + new Date());
		
		boolean isS = service.idcheck(email);
		// System.out.println(isS);
		if(isS) {
			return "NO";
		}
		
		return "YES";
	}
	
	// 닉네임 중복확인
	@ResponseBody
	@RequestMapping(value = "nickcheck.do",
			method = RequestMethod.POST,
			produces="application/String; charset=utf-8")
	public String nickcheck(String nickname) {
		System.out.println("MemberController nickcheck " + new Date());
		
		boolean isS = service.nickcheck(nickname);
		
		if(isS) {
			return "NO";
		}
		
		return "YES";
	}
	
	// 회원가입
	@RequestMapping(value = "regiAf.do",
					method = RequestMethod.POST,
					produces="application/String; charset=utf-8")
	public String regiAf(Model model, MemberDto mem) {
		System.out.println("MemberController regiAf " + new Date());
		
		boolean isS = service.addmember(mem);
		String msg = "MEM_ADD_NO";
		
		if(isS) {
			msg = "MEM_ADD_OK";
		}
		
		model.addAttribute("msg", msg);
		
		return "logMsg";
	}
}
