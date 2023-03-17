package com.sharebridge.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.WishDto;
import com.sharebridge.service.CategoryService;
import com.sharebridge.service.ProductService;
import com.sharebridge.service.WishService;
import com.sharebridge.service.impl.CategoryServiceImpl;

@Controller
public class wishController {

	@Autowired
	WishService service;
	
	@GetMapping(value = "wish.do")
	public String wish(HttpSession session, Model model) {
		System.out.println("sbcontroller baseLayout" + new Date());

		List<WishDto> wishes = service.getAllWishByMemberId();
		model.addAttribute("wishes", wishes);
		return "wish";
	}
}
