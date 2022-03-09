package com.zerock.board.command;

import java.sql.Timestamp;

import com.mysql.cj.jdbc.Blob;

public class BoardVO {
	
	private int board_num;
	private String board_category;
	private String user_id;
	private String user_nick;
	private String board_title;
	private String board_content;
	private byte[] board_file;
	private int board_view;
	private int board_like;
	private Timestamp board_regdate;
	private int cmtCount;
	
	public BoardVO() {}


	public BoardVO(int board_num, String board_category, String user_id, String user_nick, String board_title,
			String board_content, byte[] board_file, int board_view, int board_like, Timestamp board_regdate) {
		this.board_num = board_num;
		this.board_category = board_category;
		this.user_id = user_id;
		this.user_nick = user_nick;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.board_view = board_view;
		this.board_like = board_like;
		this.board_regdate = board_regdate;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

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

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public byte[] getBoard_file() {
		return board_file;
	}

	public void setBoard_file(byte[] board_file) {
		this.board_file = board_file;
	}

	public int getBoard_view() {
		return board_view;
	}

	public void setBoard_view(int board_view) {
		this.board_view = board_view;
	}

	public int getBoard_like() {
		return board_like;
	}

	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}

	public Timestamp getBoard_regdate() {
		return board_regdate;
	}

	public void setBoard_regdate(Timestamp board_regdate) {
		this.board_regdate = board_regdate;
	}


	public int getCmtCount() {
		return cmtCount;
	}


	public void setCmtCount(int cmtCount) {
		this.cmtCount = cmtCount;
	}
	
	
	
	

}
