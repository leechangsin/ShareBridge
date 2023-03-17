package com.sharebridge.dto;

import java.time.LocalDateTime;

public class WishDto {

	private int product_id;
	private int member_id;
	private LocalDateTime rdate;

	public WishDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WishDto(int product_id, int member_id, LocalDateTime rdate) {
		super();
		this.product_id = product_id;
		this.member_id = member_id;
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
	
	public LocalDateTime getRdate() {
		return rdate;
	}

	public void setRdate(LocalDateTime rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "WishDto [product_id=" + product_id + ", member_id=" + member_id
				+ ", rdate=" + rdate + "]";
	}

}
