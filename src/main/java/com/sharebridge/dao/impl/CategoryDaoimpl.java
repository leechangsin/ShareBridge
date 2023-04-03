package com.sharebridge.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.CategoryDao;
import com.sharebridge.dto.CategoryDto;

@Repository
public class CategoryDaoimpl implements CategoryDao {

	@Autowired
	SqlSession session;

	@Override
	public List<CategoryDto> getAllCategory() {
		return session.selectList("Category.getAllCategory");
	}

}
