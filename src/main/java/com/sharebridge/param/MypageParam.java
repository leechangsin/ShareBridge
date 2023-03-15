package com.sharebridge.param;

public class MypageParam {
	private int memberId;
	private int limitStart;
	private int limitEnd;
	
	public MypageParam(int memberId, int limitStart, int limitEnd) {
		this.memberId = memberId;
		this.limitStart = limitStart;
		this.limitEnd = limitEnd;
	}
	
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
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
