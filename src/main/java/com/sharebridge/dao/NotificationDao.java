package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.NotificationDto;
import com.sharebridge.param.NotificationListParam;

public interface NotificationDao {
	int getNotificationCountByMemberId(int memberId);
	List<NotificationDto> getNotificationList(NotificationListParam nlp);
}
