package com.sharebridge.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharebridge.dto.MemberDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.ReviewDto;
import com.sharebridge.service.MemberService;
import com.sharebridge.service.ProductService;
import com.sharebridge.service.ReviewService;

@Controller
public class SellerInfoController {
	
	@Autowired
	MemberService memserv;
	
	@Autowired
	ProductService proserv;
	
	@Autowired
	ReviewService revserv;

	@GetMapping(value = "sellerInfo.do")
	public String sellerInfo(int renterId, Model model) {
		System.out.println("SellerInfoController sellerInfo " + new Date());
		
		MemberDto mem = memserv.selectOneByMemberId(renterId);
		List<ReviewDto> list = revserv.revListAnsOrder(renterId);
		System.out.println(renterId);
		// 리스트로 받아온 ReviewDto에서 렌티 번호로 렌티 정보 가져오기
		List<MemberDto> renteeList = new ArrayList<>();
		for(int i=0; i < list.size(); i++) {
			MemberDto renteeMem = memserv.selectOneByMemberId(list.get(i).getRentee_id());
			renteeList.add(i, renteeMem);
			
		}
		
		// ReviewDto에서 상품번호로 상품정보 가져오기
		List<ProductDto> prodList = new ArrayList<>();
		for(int i=0; i < list.size(); i++) {
			ProductDto prodInfo = proserv.getProduct(list.get(i).getProduct_id());
			prodList.add(i, prodInfo);
			
		}
		
		model.addAttribute("mem", mem);
		model.addAttribute("list", list);
		model.addAttribute("renteeList", renteeList);
		model.addAttribute("prodList", prodList);
		
		return "seller_info";
	}
	
	@GetMapping(value = "answerReview.do")
	public String answerReview(int reviewId, Model model) {
		System.out.println("SellerInfoController answerReview " + new Date());
		
		ReviewDto dto = revserv.selecAllRev(reviewId);
		ProductDto prodInfo = proserv.getProduct(dto.getProduct_id());
		
		model.addAttribute("dto", dto);
		model.addAttribute("prodInfo", prodInfo);
		
		return "answerRev";
	}
	
	@PostMapping(value = "answerRevAf.do")
	public String answerRevAf(ReviewDto dto, Model model) {
		System.out.println("SellerInfoController answerRevAf " + new Date());
		
		boolean isS = revserv.answerRev(dto);
		String msg = "REV_ANS_NO";
		
		if(isS) {
			msg = "REV_ANS_OK";
		}
		
		model.addAttribute("ansRev", msg);
		
		return "revMsg";
	}
	
	@GetMapping(value = "upDateReview.do")
	public String upDateReview(int review_id, Model model) {
		System.out.println("SellerInfoController upDateReview " + new Date());
		
		ReviewDto dto = revserv.selecAllRev(review_id);
		ProductDto prodInfo = proserv.getProduct(dto.getProduct_id());
		
		model.addAttribute("dto", dto);
		model.addAttribute("prodInfo", prodInfo);
		
		return "upDateRev";
	}
	
	@PostMapping(value = "upDateRevAf.do")
	public String upDateRevAf(ReviewDto dto, Model model) {
		System.out.println("SellerInfoController upDateRevAf " + new Date());
		
		boolean isS = revserv.updateRev(dto);
		String msg = "ANS_UP_NO";
		if(isS) {
			msg = "ANS_UP_OK";
		}
		
		model.addAttribute("ansUp", msg);
		
		return "revMsg";
	}
	
	@GetMapping(value = "deLeteReview.do")
	public String deLeteReview(int review_id, Model model) {
		System.out.println("SellerInfoController deLeteReview " + new Date());
		
		boolean isS = revserv.deleteAns(review_id);
		String msg = "ANS_DEL_NO";
		if(isS) {
			msg = "ANS_DEL_OK";
		}
		
		model.addAttribute("ansDel", msg);
		
		return "revMsg";
	}
}
