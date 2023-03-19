package com.sharebridge.dto;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class CartDto implements Serializable{
		private int product_id;  
		private int member_id;  
		private int request_id; 
		private LocalDateTime rdate;
		
		public CartDto() {
			super();
		}

		public CartDto(int product_id, int member_id, int request_id, LocalDateTime rdate) {
			super();
			this.product_id = product_id;
			this.member_id = member_id;
			this.request_id = request_id;
			this.rdate = rdate;
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

		public int getRequest_id() {
			return request_id;
		}

		public void setRequest_id(int request_id) {
			this.request_id = request_id;
		}

		public LocalDateTime getRdate() {
			return rdate;
		}

		public void setRdate(Timestamp rdate) {
			this.rdate = rdate.toLocalDateTime();
		}

		@Override
		public String toString() {
			return "CartDto [product_id=" + product_id + ", member_id=" + member_id + ", request_id=" + request_id
					+ ", rdate=" + rdate + "]";
		}
}
