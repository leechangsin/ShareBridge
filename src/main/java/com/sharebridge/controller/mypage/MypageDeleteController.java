package com.sharebridge.controller.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharebridge.dto.MemberDto;
import com.sharebridge.param.MypageDeleteParam;
import com.sharebridge.service.MemberService;

@Controller
public class MypageDeleteController {
	@Autowired
	MemberService service;
	
	@GetMapping(value="/mypage/delete.do")
	public String deleteView(HttpSession session) {
		if(session.getAttribute("login") == null) {
			session.setAttribute("required", true);
			return "redirect:/login.do";
		}
		
		return "mypage_delete";
	}
	
	@PostMapping(value="/mypage/deleteAf.do")
	public ResponseEntity<Void> deleteAf(String reason, HttpSession session) {
		if(session.getAttribute("login") == null) {
			session.setAttribute("required", true);
			return ResponseEntity.status(300).header("Location", "/sharebridge/login.do").build();
		}
		
		MemberDto memberInfo = (MemberDto) session.getAttribute("login");
		int member_id = memberInfo.getMember_id();
		
		MypageDeleteParam param = new MypageDeleteParam(member_id, reason);
		
		service.deleteByMember_id(param);
		
		session.invalidate();
		
		return ResponseEntity.status(200).build();
	}
}
