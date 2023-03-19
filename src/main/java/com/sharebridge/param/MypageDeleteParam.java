package com.sharebridge.param;

public class MypageDeleteParam {
	private int member_id;
	private String reason;
	
	public MypageDeleteParam(int member_id, String reason) {
		this.member_id = member_id;
		this.reason = reason;
	}
	
	@Override
	public String toString() {
		return "MypageDeleteParam [member_id=" + member_id + ", reason=" + reason + "]";
	}

	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
}
