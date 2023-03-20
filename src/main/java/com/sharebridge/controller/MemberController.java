package com.sharebridge.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	// 비밀번호 찾기
	@ResponseBody
	@RequestMapping(value = "pwdSearchAf.do",
					method = RequestMethod.POST,
					produces="application/String; charset=utf-8")
	public String pwdSearchAf(String email) throws Exception {
		System.out.println("MemberController pwdSearchAf " + new Date());
		
		// 첫 번째 입력한 이메일과 일치하는 이메일이 DB에 있는지 확인
		boolean isS = service.idcheck(email);
		if(isS == false) {
			return "입력하신 이메일과 일치하는 이메일이 없습니다.";
		}
		
		// 두 번째 이메일이 일치하면 임시 비밀번호를 생성
		String pwd = "";
		for (int i = 0; i < 12; i++) {
			pwd += (char) ((Math.random() * 26) + 97);
		}
		MemberDto mem = new MemberDto(email, pwd);
		boolean updatePw = service.updatePw(mem);
		if(updatePw) {
			return "임시비밀번호는 " + pwd + " 입니다.";
		}
		return "";
		/*	이메일 발송을 계속 실패해서 일단 alert로 띄운 상황, 후기 만들고 나중에 다시 손 보자!
		// 마지막으로 이메일로 임시 비밀번호를 발송
		service.sendEmail(mem);
		System.out.println("MemberController pwdSearchAfThree " + new Date());
		return "이메일로 임시 비밀번호를 발급했습니다";
		*/
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
	
	// 로그인 후
	@PostMapping(value = "loginAf.do")
	public String loginAf(HttpSession session, Model model, MemberDto mem) {
		System.out.println("MemberController loginAf " + new Date());
		
		MemberDto dto = service.login(mem);
		String msg = "LOGIN_FAIL";
		
		if(dto != null) {
			session.setAttribute("login", dto);
			session.setMaxInactiveInterval(60 * 60 * 2);
			msg = "LOGIN_OK";
			if(dto.getDel() == 0) {
				session.setAttribute("login", dto);
				session.setMaxInactiveInterval(60 * 60 * 2);
				msg = "LOGIN_OK";
			} else {
				msg = "DELETE";
			}
		}
		
		model.addAttribute("log", msg);
		
		return "logMsg";
	}
	
	// 로그아웃
	@GetMapping(value = "logout.do")
	public String sessionOut(Model model, HttpSession session) {
		String logout = "logout";
		session.invalidate();
		
		model.addAttribute("logout", logout);
		return "logMsg";
	}
}