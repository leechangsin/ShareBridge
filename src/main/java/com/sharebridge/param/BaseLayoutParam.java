package com.sharebridge.param;

public class BaseLayoutParam {
	private int category_id;
	private String term;
	
	public BaseLayoutParam() {
		
	}

	public BaseLayoutParam(int category_id, String term) {
		super();
		this.category_id = category_id;
		this.term = term;
	}

	@Override
	public String toString() {
		return "BaseLayoutParam [category_id=" + category_id + ", term=" + term + "]";
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}
}
