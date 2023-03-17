package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.CategoryDao;
import com.sharebridge.dto.CategoryDto;
import com.sharebridge.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryDao dao;

	@Override
	public List<CategoryDto> getAllCategory() {
		return dao.getAllCategory();
	}

}
