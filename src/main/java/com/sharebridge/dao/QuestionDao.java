package com.sharebridge.dao;

import java.util.List;

import com.sharebridge.dto.QuestionDto;

public interface QuestionDao {
	int writeQuestion(QuestionDto dto);
}
