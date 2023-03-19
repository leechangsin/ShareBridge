package com.sharebridge.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.QuestionDao;
import com.sharebridge.dto.QuestionDto;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	@Autowired
	SqlSession session;

	String ns = "Question.";
	
	@Override
	public int writeQuestion(QuestionDto dto) {
		return session.insert(ns + "writeQuestion", dto);
	}
}
