package com.sharebridge.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharebridge.dto.MemberDto;
import com.sharebridge.dto.ReplyDto;
import com.sharebridge.param.ReplyParam;
import com.sharebridge.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	ReplyService replyService;
	
	@PostMapping("/writeReplyAf.do")
	public ResponseEntity<Void> writeReply(ReplyParam rp, HttpSession session) {
		if(session.getAttribute("login") == null) {
			session.setAttribute("required", true);
			
			return ResponseEntity.status(HttpStatus.MULTIPLE_CHOICES).header("Location", "/sharebridge/login.do").build();
		}
		
		MemberDto memberInfo = (MemberDto) session.getAttribute("login");
		
		ReplyDto replyDto = new ReplyDto();
		replyDto.setMember_id(memberInfo.getMember_id());
		replyDto.setQuestion_id(rp.getQuestion_id());
		replyDto.setTitle(rp.getTitle());
		replyDto.setContent(rp.getContent());
		
		String result = replyService.reply(replyDto);
		if(result.equals("success")) {
			return ResponseEntity.status(HttpStatus.OK).build();
		} else if(result.equals("forbidden")) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		} else {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
}
