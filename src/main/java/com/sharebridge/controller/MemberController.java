package com.sharebridge.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharebridge.dto.MemberDto;
import com.sharebridge.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
//	@GetMapping(value = "baseLayout.do")
//	public String baseLayout() {
//		System.out.println("MemberController baseLayout " + new Date());
//		
//		return "baseLayout";
//	}
	
	@GetMapping(value = "login.do")
	public String login() {
		System.out.println("MemberController login " + new Date());
		
		return "login";
	}
	
	@GetMapping(value = "idSearch.do")
	public String idSearch() {
		System.out.println("MemberController idSearch " + new Date());
		
		return "idSearch";
	}
	
	@GetMapping(value = "pwdSearch.do")
	public String pwdSearch() {
		System.out.println("MemberController pwdSearch " + new Date());
		
		return "pwdSearch";
	}
	
	@PostMapping(value = "idSearchAf.do")
	public String idSearchAf(String phone_number, Model model) {
		System.out.println("MemberController idSearchAf " + new Date());
		
		MemberDto mem = service.idSearch(phone_number);
		
		model.addAttribute("mem", mem);
		
		return "idCorrect";
	}
}
