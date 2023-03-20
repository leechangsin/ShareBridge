package com.sharebridge.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String goWriteQuestion(
			@RequestParam(required = false, defaultValue = "0") int question_id,
			int product_id, int category_id, Model model) {
		model.addAttribute("pid", product_id);
		model.addAttribute("cid", category_id);
		
		if(question_id != 0) {
			QuestionDto questionInfo = service.getQuestionByQuestion_id(question_id);
			
			model.addAttribute("questionInfo", questionInfo);
		}
		
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
	
	@PostMapping("/updateQuestionAf.do")
	public ResponseEntity<Void> updateQuestion(QuestionDto questionInfo, HttpSession session) {
		if(session.getAttribute("login") == null) {
			session.setAttribute("required", true);
			
			return ResponseEntity.status(HttpStatus.MULTIPLE_CHOICES).header("Location", "/sharebridge/login.do").build();
		}
		
		System.out.println(questionInfo.getTitle().length());
		System.out.println(questionInfo.getContent().length());
		
		service.updateQuestion(questionInfo);
		
		return ResponseEntity.ok(null);
	}
}
