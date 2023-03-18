package com.sharebridge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharebridge.dto.RequestDto;
import com.sharebridge.service.RequestService;

@Controller
public class RequestController {
	@Autowired
	RequestService service;
	
	@PostMapping("/requestFrmAf.do")
	public String requestFrmAf(RequestDto dto, Model model) {
		boolean isS = service.insertReq(dto);
		int request_id = dto.getRequest_id();
		
		String msg = "REQUEST_INSERT_OK";
		if(!isS) {
			msg = "REQUEST_INSERT_NO";
		}
		
		model.addAttribute("insertReq", msg);
		model.addAttribute("rid", request_id);
		
		return "detailsMsg";
	}
}
