package com.sharebridge.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.NotificationDao;

@Repository
public class NotificationDaoImpl implements NotificationDao {
	@Autowired
	SqlSession session;
	
	String ns = "Notification.";

	@Override
	public int getNotificationCountByMemberId(int memberId) {
		return session.selectOne(ns + "getNotificationCountByMemberId", memberId);
	}
}
