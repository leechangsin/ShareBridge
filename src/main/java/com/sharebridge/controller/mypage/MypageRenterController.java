package com.sharebridge.controller.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharebridge.dto.MemberDto;
import com.sharebridge.service.RenterRequestService;

@Controller
public class MypageRenterController {
	@Autowired
	RenterRequestService service;

	@PostMapping(value="/mypage/request/accept.do")
	public ResponseEntity<Void> acceptRequest(HttpSession session, int request_id) {
		if(session.getAttribute("login") == null) {
			session.setAttribute("required", true);
			return ResponseEntity.status(300).header("Location", "/sharebridge/login.do").build();
		}
		
		MemberDto memberInfo = (MemberDto) session.getAttribute("login");
		
		String result = service.acceptRequest(memberInfo.getMember_id(), request_id);
		if(result.equals("success")) {
			return ResponseEntity.status(200).build();
		} else if(result.equals("forbidden")) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		} else if(result.equals("already")) {
			return ResponseEntity.status(HttpStatus.ALREADY_REPORTED).build();
		} else {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
	
	@PostMapping(value="/mypage/request/reject.do")
	public ResponseEntity<Void> rejectRequest(HttpSession session, int request_id) {
		if(session.getAttribute("login") == null) {
			session.setAttribute("required", true);
			return ResponseEntity.status(300).header("Location", "/sharebridge/login.do").build();
		}
		
		MemberDto memberInfo = (MemberDto) session.getAttribute("login");
		
		String result = service.rejectRequest(memberInfo.getMember_id(), request_id);
		if(result.equals("success")) {
			return ResponseEntity.status(200).build();
		} else if(result.equals("forbidden")) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		} else if(result.equals("already")) {
			return ResponseEntity.status(HttpStatus.ALREADY_REPORTED).build();
		} else {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
}
