package com.sharebridge.service;

import java.util.List;

import com.sharebridge.dto.NotificationDto;
import com.sharebridge.param.NotificationListParam;

public interface NotificationService {
	int getNotificationCountByMemberId(int memberId);
	List<NotificationDto> getNotificationList(NotificationListParam nlp);
}
