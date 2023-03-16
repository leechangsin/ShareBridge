package com.sharebridge.controller.mypage;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharebridge.dto.MemberDto;
import com.sharebridge.service.MemberService;

@Controller
public class MypageUpdateController {
	@Autowired
	MemberService memberService;
	
	@GetMapping(value="/mypage/update.do")
	public String updateView(HttpSession session, Model model) {
		if(session.getAttribute("member_id") == null) {
			System.out.println("로그인 페이지로 이동");
//			return "redirect://";
		}
		
		int member_id = 1;
//		int member_id = (int) session.getAttribute("member_id");
		
//		로그인한 사용자의 회원 정보 가져오기
		MemberDto memberInfo = memberService.selectOneByMemberId(member_id);
		
		model.addAttribute("memberInfo", memberInfo);
		
		return "mypage_update";
	}
	
	@PostMapping(value="/mypage/updateAf.do")
	public ResponseEntity<String> updateAf(MemberDto newMemberInfo, HttpSession session,HttpServletResponse response) {
		if(session.getAttribute("member_id") == null) {
			System.out.println("로그인 페이지로 이동");
//			return "redirect://";
		}
		
		int member_id = 1;
//		int member_id = (int) session.getAttribute("member_id");
		
//		로그인한 사용자의 회원 정보 가져오기
		MemberDto oldMemberInfo = memberService.selectOneByMemberId(member_id);
		
		String result = memberService.updateMemberInfo(newMemberInfo, oldMemberInfo);
		if(result.equals("nickname_conflict")) {
			return new ResponseEntity<>("nickiname", HttpStatus.CONFLICT);
		} else if(result.equals("phone_number_conflict")) {
			return new ResponseEntity<>("phone_number", HttpStatus.CONFLICT);
		} else if(result.equals("not_change")) {
			return new ResponseEntity<>("not_change", HttpStatus.BAD_REQUEST);
		} else {
			return new ResponseEntity<>("OK", HttpStatus.OK);
		}
	}
}
