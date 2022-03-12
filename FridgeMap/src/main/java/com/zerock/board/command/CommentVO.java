package com.zerock.board.command;

import java.sql.Timestamp;

public class CommentVO {
	
	private int comment_num;
	private int board_num;
	private String user_nick;
	private String comment_content;
	private Timestamp comment_date;
	
	public CommentVO() {}
	
	public CommentVO(int comment_num, int board_num, String user_nick, String comment_content, Timestamp comment_date) {
		this.comment_num = comment_num;
		this.board_num = board_num;
		this.user_nick = user_nick;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
	}	

	public CommentVO(int board_num, String user_nick, String comment_content) {
		this.board_num = board_num;
		this.user_nick = user_nick;
		this.comment_content = comment_content;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Timestamp getComment_date() {
		return comment_date;
	}

	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}
	
	
	

}
