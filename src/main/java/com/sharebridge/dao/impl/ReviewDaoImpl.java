package com.sharebridge.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.ReviewDao;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	SqlSession session;
	
	String ns = "Review.";

	@Override
	public int getReviewCountByMemberId(int memberId) {
		return session.selectOne(ns + "getReviewCountByMemberId", memberId);
	}
}
