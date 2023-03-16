package com.sharebridge.dto;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class ReviewDto implements Serializable {
	private int review_id;
	private int product_id;
	private int renter_id;
	private int rentee_id;
	private String content;
	private int rating;
	private String photo;
	private LocalDateTime rdate;
	
	public ReviewDto(int review_id, int product_id, int renter_id, int rentee_id, String content, int rating, String photo, LocalDateTime rdate) {
		this.review_id = review_id;
		this.product_id = product_id;
		this.renter_id = renter_id;
		this.rentee_id = rentee_id;
		this.content = content;
		this.rating = rating;
		this.photo = photo;
		this.rdate = rdate;
	}
	
	@Override
	public String toString() {
		return "ReviewDto [review_id=" + review_id + ", product_id=" + product_id + ", renter_id=" + renter_id
				+ ", rentee_id=" + rentee_id + ", content=" + content + ", rating=" + rating + ", photo=" + photo
				+ ", rdate=" + rdate + "]";
	}

	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getRenter_id() {
		return renter_id;
	}
	public void setRenter_id(int renter_id) {
		this.renter_id = renter_id;
	}
	public int getRentee_id() {
		return rentee_id;
	}
	public void setRentee_id(int rentee_id) {
		this.rentee_id = rentee_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public LocalDateTime getRdate() {
		return rdate;
	}
	public void setRdate(LocalDateTime rdate) {
		this.rdate = rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate.toLocalDateTime();
	}
}
