package com.sharebridge.param;

public class ReplyParam {
	private int product_id;
	private int question_id;
	private String title;
	private String content;
	
	public ReplyParam(int product_id, int question_id, String title, String content) {
		this.product_id = product_id;
		this.question_id = question_id;
		this.title = title;
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "ReplyParam [product_id=" + product_id + ", question_id=" + question_id + ", title=" + title
				+ ", content=" + content + "]";
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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
}
