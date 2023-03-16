package com.sharebridge.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.NotificationDao;
import com.sharebridge.dto.NotificationDto;
import com.sharebridge.param.NotificationListParam;

@Repository
public class NotificationDaoImpl implements NotificationDao {
	@Autowired
	SqlSession session;
	
	String ns = "Notification.";

	@Override
	public int getNotificationCountByMemberId(int memberId) {
		return session.selectOne(ns + "getNotificationCountByMemberId", memberId);
	}

	@Override
	public List<NotificationDto> getNotificationList(NotificationListParam nlp) {
		return session.selectList(ns + "getNotificationList", nlp);
	}

	@Override
	public void readNotification(int notification_id) {
		session.update(ns + "readNotification", notification_id);
	}
}
