package com.sharebridge.dto;

import java.io.Serializable;

/*
CREATE TABLE IF NOT EXISTS `member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원 번호',
  `email` varchar(50) NOT NULL COMMENT '이메일',
  `pwd` varchar(20) NOT NULL COMMENT '비밀번호',
  `nickname` varchar(50) NOT NULL COMMENT '닉네임',
  `name` varchar(50) NOT NULL COMMENT '이름',
  `phone_number` char(13) NOT NULL COMMENT '연락처',
  `profile` varchar(50) DEFAULT NULL COMMENT '프로필 이미지 파일',
  `rdate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '가입일',
  `auth` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT 0 COMMENT '별점(렌터에게 부여되는 것)',
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='회원 정보 테이블';
*/

public class MemberDto implements Serializable{
	private int member_id;
	private String email;
	private String pwd;
	private String nickname;
	private String name;
	private String phone_number;
	private String profile;
	private String rdate;
	private int auth;
	private double rating;
	
	public MemberDto() {
		// TODO Auto-generated constructor stub
	}

	public MemberDto(String email, String nickname) {
		super();
		this.email = email;
		this.nickname = nickname;
	}

	public MemberDto(int member_id, String email, String pwd, String nickname, String name, String phone_number,
			String profile, String rdate, int auth, double rating) {
		super();
		this.member_id = member_id;
		this.email = email;
		this.pwd = pwd;
		this.nickname = nickname;
		this.name = name;
		this.phone_number = phone_number;
		this.profile = profile;
		this.rdate = rdate;
		this.auth = auth;
		this.rating = rating;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "MemberDto [member_id=" + member_id + ", email=" + email + ", pwd=" + pwd + ", nickname=" + nickname
				+ ", name=" + name + ", phone_number=" + phone_number + ", profile=" + profile + ", rdate=" + rdate
				+ ", auth=" + auth + ", rating=" + rating + "]";
	}
}
