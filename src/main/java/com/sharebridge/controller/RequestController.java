package com.sharebridge.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.service.NotificationService;
import com.sharebridge.service.ProductService;
import com.sharebridge.service.RequestService;

@Controller
public class RequestController {
	@Autowired
	RequestService service;
	@Autowired
	ProductService productService;
	@Autowired
	NotificationService notiService;
	
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
		int price = service.getProductPrice(member_id);
		int cid = service.getProductCate(member_id);
		
		// 대여신청 알림 -> 해당 상품의 렌터에게 감
		// 알림 추가
		boolean reqNoti = notiService.requestNoti(req.getRequest_id());
		if(reqNoti) {
			System.out.println("send notification succcess");
 		} else {
 			System.out.println("send notification fail"); 			
 		}
 		
		model.addAttribute("req", req);
		model.addAttribute("price", price);
		model.addAttribute("cid", cid);

		return "requestConfirm";
	}
	
	@GetMapping("/checkReq.do")
	public String checkReq(int request_id, HttpSession session, Model model) {
		RequestDto request = service.getRequestFormByRequest_id(request_id);
		ProductDto product = productService.getProduct(request.getProduct_id());
		
		model.addAttribute("req", request);
		model.addAttribute("price", request.getTotal_price());
		model.addAttribute("cid", product.getCategory_id());
		model.addAttribute("status", "check");
		
		return "requestConfirm";
	}
	
	// 대여신청서 수정 페이지로 이동
	@GetMapping("/goRequestUpdate.do")
	public String goRequestUpdate(int request_id, int category_id, int price, Model model) {
		RequestDto req = service.getReqFrmByRequest_id(request_id);
		ProductDto getProduct = productService.getProduct(req.getProduct_id());
		
		model.addAttribute("req", req);
		model.addAttribute("getProduct", getProduct);
		model.addAttribute("price", price);
		model.addAttribute("cid", category_id);
		
		return "requestUpdate";
	}
	
	// 대여 신청서 수정
	@PostMapping("/updateReqAf.do")
	public String updateReq(RequestDto dto, int cid,
							@RequestParam(value="start", required=false)@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
							LocalDateTime sdate,
							@RequestParam(value="end", required=false)@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
							LocalDateTime edate,
							Model model) {
				
		dto.setSdate(Timestamp.valueOf(sdate)); 
		dto.setEdate(Timestamp.valueOf(edate));
				
		boolean isS = service.updateReq(dto);
		String msg = "REQUEST_UPDATE_OK";
		if(!isS) {
			msg = "REQUEST_UPDATE_NO";
		}
		
		model.addAttribute("updateReq", msg);
		model.addAttribute("r_rid", dto.getRequest_id());
		model.addAttribute("r_pid", dto.getProduct_id());
		model.addAttribute("r_cid", cid);
		
		return "detailsMsg";
	}
	
}
