package com.sharebridge.controller.mypage;

import java.sql.Timestamp;

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
		if(session.getAttribute("login") == null) {
			session.setAttribute("required", true);
			return "redirect:/login.do";
		}
		
		MemberDto memberInfo = (MemberDto) session.getAttribute("login");
		
		model.addAttribute("memberInfo", memberInfo);
		
		return "mypage_update";
	}
	
	@PostMapping(value="/mypage/updateAf.do")
	public ResponseEntity<String> updateAf(MemberDto newMemberInfo, HttpSession session,HttpServletResponse response) {
		if(session.getAttribute("login") == null) {
			session.setAttribute("required", true);
			return ResponseEntity.status(300).header("Location", "/sharebridge/login.do").build();
		}
		
		MemberDto oldMemberInfo = (MemberDto) session.getAttribute("login");
		
		String result = memberService.updateMemberInfo(newMemberInfo, oldMemberInfo);
		if(result.equals("nickname_conflict")) {
			return new ResponseEntity<>("nickiname", HttpStatus.CONFLICT);
		} else if(result.equals("phone_number_conflict")) {
			return new ResponseEntity<>("phone_number", HttpStatus.CONFLICT);
		} else if(result.equals("not_change")) {
			return new ResponseEntity<>("not_change", HttpStatus.BAD_REQUEST);
		} else {
			// 회원 정보 수정에서 수정할 수 있는 데이터는 그대로
			// 회원 정보 수정에서 수정할 수 없는 데이터는 기존 로그인 정보에서 가져와
			// newMemberInfo 객체에 저장
			newMemberInfo.setMember_id(oldMemberInfo.getMember_id());
			newMemberInfo.setEmail(oldMemberInfo.getEmail());
			newMemberInfo.setProfile(oldMemberInfo.getProfile());
			newMemberInfo.setRdate(Timestamp.valueOf(oldMemberInfo.getRdate()));
			newMemberInfo.setAuth(oldMemberInfo.getAuth());
			newMemberInfo.setDel(oldMemberInfo.getDel());
			newMemberInfo.setReason(oldMemberInfo.getReason());
			newMemberInfo.setRating(oldMemberInfo.getRating());
			
			// 로그인한 회원의 정보를 수정된 정보로 교체
			session.setAttribute("login", newMemberInfo);
			
			return new ResponseEntity<>("OK", HttpStatus.OK);
		}
	}
}
