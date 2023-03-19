package com.sharebridge.dao;

import com.sharebridge.dto.QuestionDto;

public interface QuestionDao {
	int writeQuestion(QuestionDto dto);
}
