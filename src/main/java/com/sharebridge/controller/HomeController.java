package com.sharebridge.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.service.CategoryService;
import com.sharebridge.service.ProductService;

@Controller
public class HomeController {

	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService productService;

	//category
	@GetMapping(value = "baseLayout.do")
	public String baseLayout(HttpSession session, Model model) {
		List<CategoryDto> categories = categoryService.getAllCategory();
		
		//상품을 메인화면에 불러오기
		List<ProductDto> products = productService.getAllProducts();
		for (ProductDto x : products) { //객체가져오기
			System.out.println(x);
		}
		
		System.out.println(categories.toString());
		session.setAttribute("categories", categories);
		model.addAttribute("products", products);
		
		return "baseLayout";
	}
}
