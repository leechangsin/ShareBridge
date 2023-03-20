package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.QuestionDto;
import com.sharebridge.param.QuestionListParam;

public interface QuestionDao {
	int writeQuestion(QuestionDto dto);

	List<QuestionDto> getQuestionListByProduct_id(QuestionListParam qp);
	
	int getQuestionCount(int product_id);
	
	QuestionDto getQuestionByQuestion_id(int question_id);
	
	void updateQstateTo1(int question_id);
}
