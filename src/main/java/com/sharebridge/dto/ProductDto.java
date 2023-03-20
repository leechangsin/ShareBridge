package com.sharebridge.dto;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;


/*
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL COMMENT '상품 번호',
  `category_id` int(11) NOT NULL COMMENT '카테고리 번호',
  `member_id` int(11) NOT NULL COMMENT '렌터 회원 번호',
  `title` varchar(200) NOT NULL COMMENT '제목',
  `content` varchar(2000) NOT NULL COMMENT '내용',
  `sdate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '대여 시작 날짜',
  `edate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '대여 종료 날짜',
  `price` int(11) NOT NULL COMMENT '일일 대여 가격',
  `photo` varchar(50) NOT NULL COMMENT '이미지 파일',
  `wdate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '등록 날짜',
  `state` bit(1) DEFAULT NULL COMMENT '대여 상태',
  `del` bit(1) DEFAULT NULL COMMENT '삭제 여부',
  PRIMARY KEY (`product_id`),
  KEY `product_FK1` (`member_id`),
  KEY `product_FK2` (`category_id`),
  CONSTRAINT `product_FK1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_FK2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='상품 정보 테이블( 렌터가 대여 할 상품 정보 )';
*/

public class ProductDto implements Serializable{
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
	private byte state;
	private byte del;

	// TODO 나중에 1:1 관계 변경 필요 
	private int wish_member_id;
	private int cart_id;
	
	
	public ProductDto() {
		// TODO Auto-generated constructor stub
	}

	public ProductDto(int product_id, int category_id, int member_id, String title, String content, LocalDateTime sdate,
			LocalDateTime edate, int price, String photo, LocalDateTime wdate, byte state, byte del,int wish_member_id, int cart_id) {

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
		this.wish_member_id = wish_member_id;
		this.cart_id = cart_id;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	
	public int getWish_member_id() {
		return wish_member_id;
	}

	public void setWish_member_id(int wish_member_id) {
		this.wish_member_id = wish_member_id;
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

	public void setSdate(Timestamp sdate) {
		this.sdate = sdate.toLocalDateTime();
	}

	public LocalDateTime getEdate() {
		return edate;
	}
	
	public void setEdate(Timestamp edate) {
		this.edate = edate.toLocalDateTime();
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
	
	public void setWdate(Timestamp wdate) {
		this.wdate = wdate.toLocalDateTime();
	}
	
	public byte getState() {
		return state;
	}

	public void setState(byte state) {
		this.state = state;
	}

	public byte getDel() {
		return del;
	}

	public void setDel(byte del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "ProductDto [product_id=" + product_id + ", category_id=" + category_id + ", member_id=" + member_id
				+ ", title=" + title + ", content=" + content +  ", price="
				+ price + ", photo=" + photo + ", state=" + state + ", del=" + del + ", wish_member_id=" + wish_member_id +"]";
	}
}
