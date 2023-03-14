package com.sharebridge.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class sbcontroller {
	
	@GetMapping(value = "baseLayout.do")
	public String baseLayout() {
		System.out.println("sbcontroller baseLayout" + new Date());
		return "baseLayout";
	}
}
