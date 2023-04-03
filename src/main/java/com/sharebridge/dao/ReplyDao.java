package com.sharebridge.dao;

import com.sharebridge.dto.ReplyDto;

public interface ReplyDao {
	void reply(ReplyDto replyDto);
	ReplyDto getReplyByQuestion_id(int question_id);
	void deleteReplyByQuestion_id(int question_id);
}
