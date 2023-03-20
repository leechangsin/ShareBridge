package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.QuestionDao;
import com.sharebridge.dto.QuestionDto;
import com.sharebridge.param.QuestionListParam;
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

	@Override
	public List<QuestionDto> getQuestionListByProduct_id(QuestionListParam qp) {
		return dao.getQuestionListByProduct_id(qp);
	}

	@Override
	public int getQuestionCount(int product_id) {
		return dao.getQuestionCount(product_id);
	}
}
