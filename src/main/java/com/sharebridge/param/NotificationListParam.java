package com.sharebridge.param;

public class NotificationListParam {
	private int member_id;
	private int limitStart;
	private int limitEnd;
	
	public NotificationListParam(int member_id, int limitStart, int limitEnd) {
		this.member_id = member_id;
		this.limitStart = limitStart;
		this.limitEnd = limitEnd;
	}
	
	@Override
	public String toString() {
		return "NotificationListParam [member_id=" + member_id + ", limitStart=" + limitStart + ", limitEnd=" + limitEnd
				+ "]";
	}

	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getLimitStart() {
		return limitStart;
	}
	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}
	public int getLimitEnd() {
		return limitEnd;
	}
	public void setLimitEnd(int limitEnd) {
		this.limitEnd = limitEnd;
	}
}
