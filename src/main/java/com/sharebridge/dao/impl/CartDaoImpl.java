package com.sharebridge.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.CartDao;
import com.sharebridge.dto.CartDto;
import com.sharebridge.dto.ProductDto;

@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	SqlSession session;

	@Override
	public List<ProductDto> getAllCarts() {
		return session.selectList("Cart.getAllCarts");
	}

	@Override
	public int removeCarts(List<CartDto> carts) {
		List<String> ids = new ArrayList<String>();
		for (CartDto cart : carts) {
			ids.add(String.valueOf(cart.getCart_id()));
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cartids", ids);
		int tmp = session.delete("Cart.deleteAll", map);
		System.out.println("test ; "+tmp);
		return tmp;
	}
}
