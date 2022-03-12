package com.zerock.user.command;

import java.sql.Timestamp;

public class UserVO {
	private String user_id;
	private String user_nick;
	private String user_pw;
	private String user_email;
	private Timestamp user_signed;
	private Timestamp user_lastlogin;
	
	public UserVO(String user_id, String user_nick, String user_pw, String user_email, Timestamp user_signed,
			Timestamp user_lastlogin) {
		super();
		this.user_id = user_id;
		this.user_nick = user_nick;
		this.user_pw = user_pw;
		this.user_email = user_email;
		this.user_signed = user_signed;
		this.user_lastlogin = user_lastlogin;
	}

	public UserVO() {}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public Timestamp getUser_signed() {
		return user_signed;
	}

	public void setUser_signed(Timestamp user_signed) {
		this.user_signed = user_signed;
	}

	public Timestamp getUser_lastlogin() {
		return user_lastlogin;
	}

	public void setUser_lastlogin(Timestamp user_lastlogin) {
		this.user_lastlogin = user_lastlogin;
	}
	

}
