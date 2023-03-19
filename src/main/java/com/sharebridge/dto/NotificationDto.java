package com.sharebridge.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class NotificationDto {
	private int notification_id;
	private int request_id;
	private byte read;
	private LocalDateTime rdate;
	
	public NotificationDto(int notification_id, int request_id, byte read, LocalDateTime rdate) {
		super();
		this.notification_id = notification_id;
		this.request_id = request_id;
		this.read = read;
		this.rdate = rdate;
	}
	
	@Override
	public String toString() {
		return "NotificationDto [notification_id=" + notification_id + ", request_id=" + request_id + ", read=" + read
				+ ", rdate=" + rdate + "]";
	}

	public int getNotification_id() {
		return notification_id;
	}
	public void setNotification_id(int notification_id) {
		this.notification_id = notification_id;
	}
	public int getRequest_id() {
		return request_id;
	}
	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}
	public byte getRead() {
		return read;
	}
	public void setRead(byte read) {
		this.read = read;
	}
	public LocalDateTime getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate.toLocalDateTime();
	}
}
