package com.sharebridge.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.ProductDao;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SqlSession session;
	
	String ns = "Product.";

	@Override
	public int getProductCountByMemberId(int memberId) {
		return session.selectOne(ns + "getProductCountByMemberId", memberId);
	}
}
