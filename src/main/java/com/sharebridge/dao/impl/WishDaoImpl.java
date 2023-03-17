package com.sharebridge.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.WishDao;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.WishDto;

@Repository
public class WishDaoImpl implements WishDao {

	@Autowired
	SqlSession session;

	@Override
	public List<ProductDto> getAllWishByMemberId(int memberId) {
		return session.selectList("Wish.getAllWishByMemberId", memberId);
	}

	@Override
	public int addWish(WishDto wishDto) {
		return session.insert("Wish.addWish", wishDto);
	}

}