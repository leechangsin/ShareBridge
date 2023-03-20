package com.sharebridge.dto;

import java.io.Serializable;

public class ReqProdDto implements Serializable{
	private int request_id;
	private int product_id;
	
	public ReqProdDto() {
		// TODO Auto-generated constructor stub
	}

	public ReqProdDto(int request_id, int product_id) {
		super();
		this.request_id = request_id;
		this.product_id = product_id;
	}

	public int getRequest_id() {
		return request_id;
	}

	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	@Override
	public String toString() {
		return "ReqProdDto [request_id=" + request_id + ", product_id=" + product_id + "]";
	}
}
