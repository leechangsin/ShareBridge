package com.sharebridge.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.CartDao;
import com.sharebridge.dto.CartDto;

@Repository
public class CartDaoImpl implements CartDao{
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<CartDto> getAllCarts(){
		return session.selectList("Cart.getAllCarts");
	}
}
