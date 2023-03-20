package com.sharebridge.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharebridge.dao.ProductDao;
import com.sharebridge.dao.QuestionDao;
import com.sharebridge.dao.ReplyDao;
import com.sharebridge.dto.ProductDto;
import com.sharebridge.dto.QuestionDto;
import com.sharebridge.dto.ReplyDto;
import com.sharebridge.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	QuestionDao questionDao;
	@Autowired
	ProductDao productDao;
	@Autowired
	ReplyDao replyDao;
	
	@Override
	public String reply(ReplyDto replyDto) {
		// 문의가 삭제됬는지 확인
		QuestionDto questionDto = questionDao.getQuestionByQuestion_id(replyDto.getQuestion_id());
		if(questionDto == null) {
			return "conflict";
		}
		
		// 로그인한 사용자가 답변을 달 수 있는 권한이 있는지 확인
		ProductDto productDto = productDao.getProductByProduct_id(questionDto.getProduct_id());
		if(productDto.getMember_id() != replyDto.getMember_id()) {
			return "forbidden";
		}
		
		// 답변
		replyDao.reply(replyDto);
		// 해당 질문의 답변 상태를 답변등록 상태로 변경
		questionDao.updateQstateTo1(questionDto.getQuestion_id());
		
		return "success";
	}

}
