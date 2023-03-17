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
import com.sharebridge.service.CategoryService;
import com.sharebridge.service.ProductService;
import com.sharebridge.service.impl.CategoryServiceImpl;

@Controller
public class sbcontroller {

	@Autowired
	CategoryService categoryService;

	//category
	@GetMapping(value = "baseLayout.do")
	public String baseLayout(HttpSession session, Model model) {
		System.out.println("sbcontroller baseLayout" + new Date());

		List<CategoryDto> categories = categoryService.getAllCategory();

//		for (CategoryDto x : categories) { //객체가져오기
//			x.getCategory_id();
//			System.out.println(x);
//		}

		model.addAttribute("displayCategories", categories.stream().limit(3).toList()); // 3개만 가져오기
		model.addAttribute("hideCategories", categories.stream().skip(3).toList()); // 3개 이후부터 가져오기

		return "baseLayout";

	}
}
