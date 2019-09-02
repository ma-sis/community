package org.masis.community.member.domain;

import java.sql.Timestamp;

public class MemberDTO {
	//회원 이메일, 비밀번호, 이름, 휴대전화 번호, 프로필 사진 이름
	private String email,pwd,name,phone,profile;
	//가입날짜와 시간
	private Timestamp reg_date;
	//관리자인지 아닌지
	private int admin;
	
	//로그인시 로그창에 보여줄 정보
	public String logInfo() {
		return "[email=" + email + ", name=" + name + ", profile="+ profile + ", admin=" + admin + "]";
	}
	
	//회원 insert시 로그에 보여줄 정보
	public String memberInfo() {
		return "[email=" + email + "pwd=" + pwd + ", name=" + name + ", phone="+ phone + "]";
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
}
