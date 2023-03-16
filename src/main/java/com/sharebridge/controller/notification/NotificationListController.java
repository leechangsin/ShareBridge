package com.sharebridge.controller.notification;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sharebridge.dto.NotificationDto;
import com.sharebridge.param.NotificationListParam;
import com.sharebridge.service.NotificationService;

@Controller
public class NotificationListController {
	@Autowired
	NotificationService notificationService;
	
	@GetMapping("/notification/notification_list.do")
	public String notificationListView(HttpSession session, Model model) {
		if(session.getAttribute("member_id") == null) {
			System.out.println("로그인 페이지로 이동");
//			return "redirect://";
		}
		
		int member_id = 1;
//		int member_id = (int) session.getAttribute("member_id");
		
		NotificationListParam nlp = new NotificationListParam(member_id, 0, 0);
		List<NotificationDto> notificationList = notificationService.getNotificationList(nlp);
		
		model.addAttribute("notificationList", notificationList);
		
		return "notification_list";
	}
}
