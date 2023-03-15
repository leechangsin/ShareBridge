package com.sharebridge.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sharebridge.dto.MemberDto;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.param.MypageParam;
import com.sharebridge.service.MemberService;
import com.sharebridge.service.NotificationService;
import com.sharebridge.service.ProductService;
import com.sharebridge.service.RenteeRequestService;
import com.sharebridge.service.RenterRequestService;
import com.sharebridge.service.ReviewService;

@Controller
public class MypageController {
	@Autowired
	MemberService memberService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	NotificationService notificationService;
	@Autowired
	ProductService productService;
	@Autowired
	RenteeRequestService renteeRequestService;
	@Autowired
	RenterRequestService renterRequestService;
	
	@RequestMapping(value="/mypage/mypage.do", method = RequestMethod.GET)
	public String mypageView(HttpSession session, Model model) {
		int member_id = 1;
		
		if(session.getAttribute("member_id") == null) {
			System.out.println("로그인 페이지로 이동");
//			return "redirect://";
		}
		
//		int member_id = (int) session.getAttribute("member_id");
		
//		로그인한 사용자의 회원 정보 가져오기
		MemberDto memberInfo = memberService.selectOneByMemberId(member_id);
		System.out.println(memberInfo);
		
//		로그인한 사용자의 후기 개수 가져오기
		int reviewCount = reviewService.getReviewCountByMemberId(member_id);
		System.out.println("reviewCount = " + reviewCount);
		
//		로그인한 사용자의 알림 개수 가져오기
		int notiCount = notificationService.getNotificationCountByMemberId(member_id);
		System.out.println("notiCount = " + notiCount);
		
//		로그인한 사용자의 등록한 상품 개수 가져오기
		int productCount = productService.getProductCountByMemberId(member_id);
		System.out.println("productCount = " + reviewCount);
		
//		로그인한 사용자의 대여 신청 목록 가져오기
		MypageParam mp = new MypageParam(member_id, 0, 5);
		List<RequestDto> requestSendList = renteeRequestService.getRequestListByMemberId(mp);
		System.out.println(requestSendList);
		
//		로그인한 사용자의 대여 요청 목록 가져오기
		List<RequestDto> requestReceiveList = renterRequestService.getRequestListByMemberId(mp);
		System.out.println(requestReceiveList);
		
//		회원 정보, 후기 개수, 등록한 상품 개수, 대여 신청 목록, 대여 요청 목록 뷰로 전달
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("notiCount", notiCount);
		model.addAttribute("productCount", productCount);
		model.addAttribute("requestSendList", requestSendList);
		model.addAttribute("requestReceiveList", requestReceiveList);
		
		return "mypage_main";
	}
	
	@GetMapping(value="/mypage/pwd_check/update.do")
	public String goFromPwdCheckViewToUpdateView(HttpSession session) {
		session.setAttribute("redirectURL", "/mypage/update.do");
		
		return "redirect:/mypage/pwd_check.do";
	}
	
	@GetMapping(value="/mypage/pwd_check/delete.do")
	public String goFromPwdCheckViewToDeleteView(HttpSession session) {
		session.setAttribute("redirectURL", "/mypage/delete.do");
		
		return "redirect:/mypage/pwd_check.do";
	}
}
