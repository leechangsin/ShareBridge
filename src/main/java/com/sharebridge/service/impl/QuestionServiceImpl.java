package com.sharebridge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.QuestionDao;
import com.sharebridge.dao.ReplyDao;
import com.sharebridge.dto.QuestionDto;
import com.sharebridge.param.QuestionListParam;
import com.sharebridge.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	QuestionDao questionDao;
	@Autowired
	ReplyDao replyDao;

	@Override
	public boolean writeQuestion(QuestionDto dto) {
		int n = questionDao.writeQuestion(dto);
		return n>0?true:false;
	}

	@Override
	public List<QuestionDto> getQuestionListByProduct_id(QuestionListParam qp) {
		return questionDao.getQuestionListByProduct_id(qp);
	}

	@Override
	public int getQuestionCount(int product_id) {
		return questionDao.getQuestionCount(product_id);
	}

	@Override
	public void updateQstateTo1(int question_id) {
		questionDao.updateQstateTo1(question_id);
	}

	@Override
	public QuestionDto getQuestionByQuestion_id(int question_id) {
		return questionDao.getQuestionByQuestion_id(question_id);
	}

	@Override
	public void updateQuestion(QuestionDto questionInfo) {
		questionDao.updateQuestion(questionInfo);
	}

	@Override
	public void deleteQuestion(int question_id) {
		replyDao.deleteReplyByQuestion_id(question_id);
		questionDao.deleteQuestion(question_id);
	}
}
