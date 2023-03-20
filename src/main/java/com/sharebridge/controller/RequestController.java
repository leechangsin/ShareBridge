package com.sharebridge.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharebridge.dto.RequestDto;
import com.sharebridge.service.RequestService;

@Controller
public class RequestController {
	@Autowired
	RequestService service;
	
	// 대여신청서 작성 성공
	@PostMapping("/requestFrmAf.do")
	public String requestFrmAf(RequestDto dto, 
								@RequestParam(value="start", required=false)@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
								LocalDateTime sdate,
								@RequestParam(value="end", required=false)@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
								LocalDateTime edate,
								Model model) {
		
		dto.setSdate(Timestamp.valueOf(sdate)); 
		dto.setEdate(Timestamp.valueOf(edate)); 
		
		boolean isS = service.insertReq(dto);
		int mid = dto.getMember_id();
		
		String msg = "REQUEST_INSERT_OK";
		if(!isS) {
			msg = "REQUEST_INSERT_NO";
		}
		
		System.out.println(dto.toString());
		model.addAttribute("insertReq", msg);
		model.addAttribute("mid", mid);
		
		return "detailsMsg";
	}
	
	// 확인페이지로 이동
	@GetMapping("/successReq.do")
	public String successReq(int member_id, Model model) {
		RequestDto req = service.getReqFrm(member_id);
		
		model.addAttribute("req", req);
		
		return "requestConfirm";
	}
	
	// 대여신청서 수정 페이지로 이동
	@PostMapping("/goRequestUpdate.do")
	public String goRequestUpdate(int request_id, Model model) {
		RequestDto req = service.getReqFrm(request_id);
		List<Integer> list = service.getProductPriceAndCate(req.getProduct_id());
		
		model.addAttribute("req", req);
		model.addAttribute("list", list);
		
		return "RequestUpdate";
	}
	
	// 대여 신청서 수정
	@PostMapping("/updateReq.do")
	public String updateReq(int request_id,int category_id, Model model) {
		boolean isS = service.updateReq(request_id);
		String msg = "REQUEST_UPDATE_OK";
		if(!isS) {
			msg = "REQUEST_UPDATE_NO";
		}
		
		model.addAttribute("updateReq", msg);
		model.addAttribute("r_rid", request_id);
		model.addAttribute("r_cid", category_id);
		
		return "detailsMsg";
	}
	
}
