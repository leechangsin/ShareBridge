package com.sharebridge.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageDeleteController {
	
	@GetMapping(value="/mypage/delete.do")
	public String deleteView() {
		
		return "mypage_delete";
	}
}
