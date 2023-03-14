package com.sharebridge.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.service.productService;

@Controller
public class ProductController {
	@Autowired
	productService service;
	
	@GetMapping(value = "productRegi.do")
	public String productRegi(Model model) {
		System.out.println("ProductController productRegi() " + new Date());
		
		List<CategoryDto> allCategory = service.allCategory();
		model.addAttribute("allCategory", allCategory);
		
		return "productRegi";
	}
	
	@PostMapping(value = "productRegiAf.do")
	public String productRegiAf(ProductDto dto) {
		System.out.println("ProductController productRegiAf() " + new Date());
		
		boolean isS = service.insertProduct(dto);
		String msg = "Yes";
		if(isS) {
			System.out.println(msg);
		} else {
			msg = "No";
			System.out.println(msg);
		}
		
		return "productRegiAf";	// message.jsp로 이동 혹은 메인페이지로 이동
	}
}
