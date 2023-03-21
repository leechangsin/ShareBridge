package com.sharebridge.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharebridge.dto.CategoryDto;
import com.sharebridge.dto.MemberDto;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.service.CategoryService;
import com.sharebridge.service.ProductService;
import com.sharebridge.service.WishService;

@Controller
public class HomeController {

	@Autowired
	CategoryService categoryService;

	@Autowired
	ProductService productService;

	@Autowired
	WishService wishService;

	// category
	@GetMapping(value = "baseLayout.do")
	public String baseLayout(HttpSession session, Model model, @RequestParam(required = false, defaultValue = "0")int category_id) {
		List<CategoryDto> categories = categoryService.getAllCategory();

		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		List<ProductDto> products = productService.getAllProducts(category_id);
		if (memberDto != null && memberDto.getMember_id() > 0) {
			List<ProductDto> wishProducts = wishService.getAllWishByMemberId(memberDto.getMember_id());
			for (ProductDto wishProduct : wishProducts) {
				ProductDto temp = products.stream()
						.filter(x -> x.getProduct_id() == wishProduct.getProduct_id())
						.findFirst()
						.orElse(null);
				if (temp != null) {
					temp.setWish_member_id(wishProduct.getWish_member_id());
				}
			}
		}

		for (ProductDto x : products) { // 객체가져오기
			System.out.println(x);
		}

		System.out.println(categories.toString());
		session.setAttribute("categories", categories);
		model.addAttribute("products", products);

		return "baseLayout";
	}
}
