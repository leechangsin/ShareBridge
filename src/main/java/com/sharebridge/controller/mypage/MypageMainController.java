package com.sharebridge.controller.mypage;

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
import com.sharebridge.dto.ReviewDto;
import com.sharebridge.param.MypageParam;
import com.sharebridge.service.MemberService;
import com.sharebridge.service.NotificationService;
import com.sharebridge.service.ProductService;
import com.sharebridge.service.RenteeRequestService;
import com.sharebridge.service.RenterRequestService;
import com.sharebridge.service.ReviewService;

@Controller
public class MypageMainController {
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
		if(session.getAttribute("login") == null) {
			session.setAttribute("required", true);
			return "redirect:/login.do";
		}
		
		MemberDto memberInfo = (MemberDto) session.getAttribute("login");
		int member_id = memberInfo.getMember_id();
		
//		로그인한 사용자의 후기 개수 가져오기
		int reviewCount = reviewService.getReviewCountByMemberId(member_id);
		System.out.println("reviewCount = " + reviewCount);
		// 렌터의 별점 계산
		List<ReviewDto> list = reviewService.revListAnsOrder(reviewCount);
		System.out.println(list.size());
		double rate = 0;
		for (int i = 0; i < list.size(); i++) {
			rate += list.get(i).getRating();
		}
		
		// 평균값 계산하자!
		double rateAvg = 0;
		if(list.size() == 0) {
			rateAvg = 0;
		}else if(list.size() == 1) {
			rateAvg = rate;
		}else {
			rateAvg = rate / (list.size()-1);
		}
		
		
//		로그인한 사용자의 알림 개수 가져오기
		int notiCount = notificationService.getNotificationCountByMemberId(member_id);
		System.out.println("notiCount = " + notiCount);
		
//		로그인한 사용자의 등록한 상품 개수 가져오기
		int productCount = productService.getProductCountByMemberId(member_id);
		System.out.println("productCount = " + reviewCount);
		
//		로그인한 사용자의 대여 신청 목록 가져오기
		MypageParam mp = new MypageParam(member_id, 0, 5);
		List<RequestDto> requestSendList = renteeRequestService.getRequestListByMemberId(mp);
		System.out.println("requestSendList = " + requestSendList);
		
//		로그인한 사용자의 대여 요청 목록 가져오기
		List<RequestDto> requestReceiveList = renterRequestService.getRequestListByMemberId(mp);
		System.out.println("requestReceiveList = " + requestReceiveList);
		
//		회원 정보, 후기 개수, 등록한 상품 개수, 대여 신청 목록, 대여 요청 목록 뷰로 전달
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("notiCount", notiCount);
		model.addAttribute("productCount", productCount);
		model.addAttribute("requestSendList", requestSendList);
		model.addAttribute("requestReceiveList", requestReceiveList);
		model.addAttribute("rateAvg", rateAvg);
		
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
