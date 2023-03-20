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
import com.sharebridge.dto.WishDto;
import com.sharebridge.service.CartService;

@Controller
public class CartController {
	@Autowired
	CartService cartService;

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
}
