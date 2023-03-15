package com.sharebridge.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageUpdateController {

	@GetMapping(value="/mypage/update.do")
	public String updateView() {
		return "mypage_update";
	}
	
}
