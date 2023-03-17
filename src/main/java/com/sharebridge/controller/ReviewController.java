package com.sharebridge.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	
	@GetMapping(value = "reviewList.do")
	public String reviewList(int member_id, Model model) {
		System.out.println("ReviewController reviewList " + new Date());
		
		// 세션정보의 렌티 회원번호를 통해 상품번호와 대여기간 취득
		List<RequestDto> rentalDate = service.reviewList(member_id);
		System.out.println(rentalDate.size());
		
		// 취득한 상품번호로 상품명, 등록자, 가격을 취득하자!
		List<ProductDto> product = new ArrayList<>();
		for (int i = 0; i < rentalDate.size(); i++) {
			ProductDto dto = service.reviewListTwo(rentalDate.get(i).getProduct_id());
			product.add(i, dto);
		}
		System.out.println(product.size());
		
		// 취득한 렌터번호로 렌터닉네임을 취득하자!
		List<String> nickname = new ArrayList<>();
		for (int i = 0; i < rentalDate.size(); i++) {
			String renter_id = service.reviewListThree(member_id);
			nickname.add(i, renter_id);
		}
		System.out.println(nickname.size());
		
		model.addAttribute("rentalDate", rentalDate);
		model.addAttribute("product", product);
		model.addAttribute("nickname", nickname);
		
		return "review";
	}
}
