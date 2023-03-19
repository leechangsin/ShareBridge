package com.sharebridge.controller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharebridge.dto.RequestDto;
import com.sharebridge.service.RequestService;

@Controller
public class RequestController {
	@Autowired
	RequestService service;
	
	@PostMapping("/requestFrmAf.do")
	public String requestFrmAf(RequestDto dto, 
								@RequestParam(value="start", required=false)@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
								LocalDateTime sdate,
								@RequestParam(value="end", required=false)@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
								LocalDateTime edate,
								Model model) {
		
		dto.setSdate(sdate); 
		dto.setEdate(edate); 
		
		boolean isS = service.insertReq(dto);
		int request_id = dto.getRequest_id();
		
		String msg = "REQUEST_INSERT_OK";
		if(!isS) {
			msg = "REQUEST_INSERT_NO";
		}
		
		System.out.println(msg);
		model.addAttribute("insertReq", msg);
		model.addAttribute("rid", request_id);
		
		return "detailsMsg";
	}
}