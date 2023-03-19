package com.sharebridge.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.QuestionDao;
import com.sharebridge.dto.QuestionDto;
import com.sharebridge.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	QuestionDao dao;

	@Override
	public boolean writeQuestion(QuestionDto dto) {
		int n = dao.writeQuestion(dto);
		return n>0?true:false;
	}
}
