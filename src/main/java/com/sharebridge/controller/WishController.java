package com.sharebridge.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharebridge.dto.MemberDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.WishDto;
import com.sharebridge.service.WishService;

@Controller
public class WishController {

	@Autowired
	WishService service;
	
	@GetMapping(value = "wish.do")
	public String wish(HttpSession session, Model model) {
		System.out.println("Wishcontroller baseLayout" + new Date());

		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		// 로그인 했을 때
		if (memberDto != null) {
			List<ProductDto> wishProducts = service.getAllWishByMemberId(memberDto.getMember_id());

			for (ProductDto product : wishProducts) {
				System.out.println(product);

			}

			model.addAttribute("wishes", wishProducts);
		}
		
		return "wish";
	}
	
	@ResponseBody
	@RequestMapping(value = "addWish.do",
					method = RequestMethod.POST,
					produces="application/String; charset=utf-8")
	public String addWish(WishDto wishDto) {
		System.out.println("WishController addWish " + new Date());
		
		return service.addWish(wishDto) > 0 ? "SUCCESS" : "ERROR";
	}
	
	@ResponseBody
	@RequestMapping(value = "removeWish.do",
					method = RequestMethod.POST,
					produces="application/String; charset=utf-8")
	public String removeWish(WishDto wishDto) {
		return service.removeWish(wishDto) > 0 ? "SUCCESS" : "ERROR";
	}
}
