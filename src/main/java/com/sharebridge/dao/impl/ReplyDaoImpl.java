package com.sharebridge.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharebridge.dao.ReplyDao;
import com.sharebridge.dto.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	@Autowired
	SqlSession session;
	
	String ns = "Reply.";
	
	@Override
	public void reply(ReplyDto replyDto) {
		session.insert(ns + "insertReply", replyDto);
	}

	@Override
	public ReplyDto getReplyByQuestion_id(int question_id) {
		return session.selectOne(ns + "getReplyByQuestion_id", question_id);
	}

	@Override
	public void deleteReplyByQuestion_id(int question_id) {
		session.delete(ns + "deleteReplyByQuestion_id", question_id);
	}
}
