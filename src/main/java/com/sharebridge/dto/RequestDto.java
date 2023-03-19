package com.sharebridge.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class RequestDto {
	private int request_id;
	private int product_id;
	private int member_id;
	private String name;
	private String email;
	private String phone_number;
	private LocalDateTime sdate;
	private LocalDateTime edate;
	private String receiver;
	private String receiver_phone;
	private String payment;
	private byte is_cancel;
	private byte is_accept;
	private LocalDateTime rdate;
	private byte del;
	
	public RequestDto() {
		// TODO Auto-generated constructor stub
	}
	
	public RequestDto(int product_id, int member_id) {
		super();
		this.product_id = product_id;
		this.member_id = member_id;
	}

	public RequestDto(int request_id, int product_id, int member_id, String name, String email, String phone_number,
			LocalDateTime sdate, LocalDateTime edate, String receiver, String receiver_phone, String payment,
			byte is_cancel, byte is_accept, LocalDateTime rdate, byte del) {
		this.request_id = request_id;
		this.product_id = product_id;
		this.member_id = member_id;
		this.name = name;
		this.email = email;
		this.phone_number = phone_number;
		this.sdate = sdate;
		this.edate = edate;
		this.receiver = receiver;
		this.receiver_phone = receiver_phone;
		this.payment = payment;
		this.is_cancel = is_cancel;
		this.is_accept = is_accept;
		this.rdate = rdate;
		this.del = del;
	}
	
	@Override
	public String toString() {
		return "RequestDto [request_id=" + request_id + ", product_id=" + product_id + ", member_id=" + member_id
				+ ", name=" + name + ", email=" + email + ", phone_number=" + phone_number + ", sdate=" + sdate
				+ ", edate=" + edate + ", receiver=" + receiver + ", receiver_phone=" + receiver_phone + ", payment="
				+ payment + ", is_cancel=" + is_cancel + ", is_accept=" + is_accept + ", rdate=" + rdate + ", del="
				+ del + "]";
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
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public void setSdate(Timestamp sdate) {
		this.sdate = sdate.toLocalDateTime();
	}
	public void setEdate(Timestamp edate) {
		this.edate = edate.toLocalDateTime();
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getReceiver_phone() {
		return receiver_phone;
	}
	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public byte getIs_cancel() {
		return is_cancel;
	}
	public void setIs_cancel(byte is_cancel) {
		this.is_cancel = is_cancel;
	}
	public byte getIs_accept() {
		return is_accept;
	}
	public void setIs_accept(byte is_accept) {
		this.is_accept = is_accept;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate.toLocalDateTime();
	}
	public byte getDel() {
		return del;
	}
	public void setDel(byte del) {
		this.del = del;
	}

	public LocalDateTime getSdate() {
		return sdate;
	}

	public LocalDateTime getEdate() {
		return edate;
	}

	public LocalDateTime getRdate() {
		return rdate;
	}
}
