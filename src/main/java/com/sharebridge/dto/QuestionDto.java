package com.sharebridge.dto;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class QuestionDto implements Serializable{
	private int question_id;
	private int product_id;
	private int member_id;
	private String title;
	private String content;
	private boolean private_question;
	private boolean qstate;
	private LocalDateTime rdate;
	
	public QuestionDto() {
		// TODO Auto-generated constructor stub
	}
	
	public QuestionDto(int question_id, int product_id, int member_id, String title, String content,
			boolean private_question, boolean qstate, LocalDateTime rdate) {
		super();
		this.question_id = question_id;
		this.product_id = product_id;
		this.member_id = member_id;
		this.title = title;
		this.content = content;
		this.private_question = private_question;
		this.qstate = qstate;
		this.rdate = rdate;
	}

	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean isPrivate_question() {
		return private_question;
	}

	public void setPrivate_question(boolean private_question) {
		this.private_question = private_question;
	}

	public boolean isQstate() {
		return qstate;
	}

	public void setQstate(boolean qstate) {
		this.qstate = qstate;
	}

	public LocalDateTime getRdate() {
		return rdate;
	}

	public void setRdate(Timestamp rdate) {
		this.rdate = rdate.toLocalDateTime();
	}

	@Override
	public String toString() {
		return "QuestionDto [question_id=" + question_id + ", product_id=" + product_id + ", member_id=" + member_id
				+ ", title=" + title + ", content=" + content + ", private_question=" + private_question + ", qstate="
				+ qstate + ", rdate=" + rdate + "]";
	}
}
