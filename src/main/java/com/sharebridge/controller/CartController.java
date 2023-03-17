package com.sharebridge.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sharebridge.dto.CartDto;
import com.sharebridge.service.CartService;

@Controller
public class CartController {
	@Autowired
	CartService cartService;
	
	@GetMapping(value = "cart.do")
	public String cart(HttpSession session, Model model) {
		System.out.println("CartController cart" + new Date());
		
		List<CartDto> carts = cartService.getAllCarts(); 
	
		model.addAttribute("carts",carts);
		return "cart";
	}
}
