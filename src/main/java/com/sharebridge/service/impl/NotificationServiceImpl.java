package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.NotificationDao;
import com.sharebridge.dto.NotificationDto;
import com.sharebridge.param.NotificationListParam;
import com.sharebridge.service.NotificationService;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	NotificationDao dao;

	@Override
	public int getNotificationCountByMemberId(int memberId) {
		return dao.getNotificationCountByMemberId(memberId);
	}

	@Override
	public List<NotificationDto> getNotificationList(NotificationListParam nlp) {
		return dao.getNotificationList(nlp);
	}
}
