package com.sharebridge.dto;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/*
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '후기 번호',
  `product_id` int(11) NOT NULL COMMENT '대여한 상품 번호',
  `renter_id` int(11) NOT NULL COMMENT '대여한 상품을 등록한 렌터 회원 번호',
  `rentee_id` int(11) NOT NULL COMMENT '대여한 렌티 번호',
  `content` varchar(2000) NOT NULL COMMENT '내용',
  `rating` tinyint(4) NOT NULL DEFAULT 0 COMMENT '별점',
  `photo` varchar(50) DEFAULT NULL COMMENT '이미지 파일',
  `rdate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '등록 날짜',
  PRIMARY KEY (`review_id`),
  KEY `review_FK1` (`product_id`),
  KEY `review_FK2` (`renter_id`),
  KEY `review_FK3` (`rentee_id`),
  CONSTRAINT `review_FK1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `review_FK2` FOREIGN KEY (`renter_id`) REFERENCES `member` (`member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `review_FK3` FOREIGN KEY (`rentee_id`) REFERENCES `member` (`member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='리뷰 테이블';
*/

public class ReviewDto implements Serializable {
	private int review_id;
	private int product_id;
	private int renter_id;
	private int rentee_id;
	private String content;
	private int rating;
	private String photo;
	private LocalDateTime rdate;
	private int request_id;
	
	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDto(int review_id, int product_id, String content, int rating, String photo) {
		super();
		this.review_id = review_id;
		this.product_id = product_id;
		this.content = content;
		this.rating = rating;
		this.photo = photo;
	}
	
	public ReviewDto(int review_id, int product_id, int renter_id, int rentee_id, String content, int rating,
			String photo, LocalDateTime rdate, int request_id) {
		super();
		this.review_id = review_id;
		this.product_id = product_id;
		this.renter_id = renter_id;
		this.rentee_id = rentee_id;
		this.content = content;
		this.rating = rating;
		this.photo = photo;
		this.rdate = rdate;
		this.request_id = request_id;
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
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate.toLocalDateTime();
	}

	public int getRequest_id() {
		return request_id;
	}

	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}
}
