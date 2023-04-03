package com.sharebridge.param;

public class QuestionListParam {
	private int product_id;
	private int page;
	private int limitStart;
	
	public QuestionListParam(int product_id, int page) {
		this.product_id = product_id;
		this.page = page;
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getLimitStart() {
		return limitStart;
	}
	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}
}
