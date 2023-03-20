package com.sharebridge.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharebridge.dto.QuestionDto;
import com.sharebridge.param.QuestionListParam;
import com.sharebridge.service.QuestionService;

@Controller
public class QuestionController {
	@Autowired
	QuestionService service;
	
	@GetMapping("/question/question_list.do")
	public ResponseEntity<List<QuestionDto>> getQuestionList(QuestionListParam qp) {
		qp.setLimitStart((qp.getPage()-1)*10);
		
		// 문의 내역
		List<QuestionDto> questionList = service.getQuestionListByProduct_id(qp);
		
		System.out.println("questionList = " + questionList);
		
		return ResponseEntity.status(200).body(questionList);
	}
	
	@GetMapping("/goWriteQuestion.do")
	public String goWriteQuestion(int product_id, int category_id, Model model) {
		model.addAttribute("pid", product_id);
		model.addAttribute("cid", category_id);
		
		return "questionWrite";
	}
	
	@PostMapping("/writeQuestionAf.do")
	public String writeQuestion(QuestionDto dto, int category_id, Model model) {
		boolean isS = service.writeQuestion(dto);
		String msg = "QUESTION_INSERT_OK";
		if(!isS) {
			msg = "QUESTION_INSERT_NO";
		}
		
		model.addAttribute("writeQuestion", msg);
		model.addAttribute("q_pid", dto.getProduct_id());
		model.addAttribute("q_cid", category_id);
		
		return "detailsMsg";
	}
}
