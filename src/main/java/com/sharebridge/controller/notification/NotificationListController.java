package com.sharebridge.controller.notification;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NotificationListController {
	
	@GetMapping("/notification/notification_list.do")
	public String notificationListView() {
		return "notification_list";
	}
}
