package com.sharebridge.service;

import com.sharebridge.dto.ReplyDto;

public interface ReplyService {
	String reply(ReplyDto replyDto);
	ReplyDto getReplyByQuestion_id(int question_id);
}
