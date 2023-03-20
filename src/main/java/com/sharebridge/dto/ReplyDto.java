package com.sharebridge.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class ReplyDto {
	private int reply_id;
	private int member_id;
	private int question_id;
	private String title;
	private String content;
	private LocalDateTime rdate;
	
	public ReplyDto() {
		
	}
	
	public ReplyDto(int reply_id, int member_id, int question_id, String title, String content, LocalDateTime rdate) {
		this.reply_id = reply_id;
		this.member_id = member_id;
		this.question_id = question_id;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
	}
	
	@Override
	public String toString() {
		return "ReplyDto [reply_id=" + reply_id + ", member_id=" + member_id + ", question_id=" + question_id
				+ ", title=" + title + ", content=" + content + ", rdate=" + rdate + "]";
	}

	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
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
	public LocalDateTime getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate.toLocalDateTime();
	}
}
