package com.sharebridge.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharebridge.dto.CartDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.RequestDto;
import com.sharebridge.dto.WishDto;
import com.sharebridge.service.CartService;
import com.sharebridge.service.RequestService;

@Controller
public class CartController {
	@Autowired
	CartService cartService;
	@Autowired
	RequestService reqService;

	@GetMapping(value = "cart.do")
	public String cart(HttpSession session, Model model) {
		System.out.println("CartController cart" + new Date());

		List<ProductDto> carts = cartService.getAllCarts();

		model.addAttribute("carts", carts);
		return "cart";
	}

	@ResponseBody
	@RequestMapping(value = "removeCart.do", method = RequestMethod.POST, produces = "application/String; charset=utf-8")
	public String removeWish(@RequestBody List<CartDto> cartDtos) {
		return cartService.removeCarts(cartDtos) > 0 ? "SUCCESS" : "ERROR";
	}
	
	// 장바구니 추가후 장바구니 페이지로 이동
	@GetMapping(value="addCart.do")
	public String addCart(int member_id, CartDto dto , Model model) {
		RequestDto req = reqService.getReqFrm(member_id);
		dto.setMember_id(member_id);
		dto.setProduct_id(req.getProduct_id());
		dto.setRequest_id(req.getRequest_id());
		
		cartService.addCart(dto); // 장바구니 추가
		List<CartDto> cartList = cartService.getCartList(member_id); // 장바구니 리스트
		
		model.addAttribute("cartlist", cartList);
				
		return "cart";
	}
}
