package com.sharebridge.controller.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharebridge.param.MypageDeleteParam;
import com.sharebridge.service.MemberService;

@Controller
public class MypageDeleteController {
	@Autowired
	MemberService service;
	
	@GetMapping(value="/mypage/delete.do")
	public String deleteView(HttpSession session) {
		if(session.getAttribute("member_id") == null) {
			System.out.println("로그인 페이지로 이동");
//			return "redirect://";
		}
		
		return "mypage_delete";
	}
	
	@PostMapping(value="/mypage/deleteAf.do")
	public ResponseEntity<Void> deleteAf(String reason, HttpSession session) {
		if(session.getAttribute("member_id") == null) {
			System.out.println("로그인 페이지로 이동");
//			return "redirect://";
		}
		
		int member_id = 1;
//		int member_id = (int) session.getAttribute("member_id");
		
		MypageDeleteParam param = new MypageDeleteParam(member_id, reason);
		
		service.deleteByMember_id(param);
		
		return ResponseEntity.status(200).build();
	}
}
