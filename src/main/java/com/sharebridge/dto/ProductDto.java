package com.sharebridge.dto;

import java.io.Serializable;
import java.time.LocalDateTime;

public class ProductDto implements Serializable {
	private int product_id;
	private int category_id;
	private int member_id;
	private String title;
	private String content;
	private LocalDateTime sdate;
	private LocalDateTime edate;
	private int price;
	private String photo;
	private LocalDateTime wdate;
	private boolean state;	
	private boolean del;
	
	public ProductDto() {
	}

	public ProductDto(int product_id, int category_id, int member_id, String title, String content, LocalDateTime sdate,
			LocalDateTime edate, int price, String photo, LocalDateTime wdate, boolean state, boolean del) {
		super();
		this.product_id = product_id;
		this.category_id = category_id;
		this.member_id = member_id;
		this.title = title;
		this.content = content;
		this.sdate = sdate;
		this.edate = edate;
		this.price = price;
		this.photo = photo;
		this.wdate = wdate;
		this.state = state;
		this.del = del;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
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

	public LocalDateTime getSdate() {
		return sdate;
	}

	public void setSdate(LocalDateTime sdate) {
		this.sdate = sdate;
	}

	public LocalDateTime getEdate() {
		return edate;
	}

	public void setEdate(LocalDateTime edate) {
		this.edate = edate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public LocalDateTime getWdate() {
		return wdate;
	}

	public void setWdate(LocalDateTime wdate) {
		this.wdate = wdate;
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public boolean isDel() {
		return del;
	}

	public void setDel(boolean del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "ProductDto [product_id=" + product_id + ", category_id=" + category_id + ", member_id=" + member_id
				+ ", title=" + title + ", content=" + content + ", sdate=" + sdate + ", edate=" + edate + ", price="
				+ price + ", photo=" + photo + ", wdate=" + wdate + ", state=" + state + ", del=" + del + "]";
	}
}
