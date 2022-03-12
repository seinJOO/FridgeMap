package com.zerock.board.command;

public class LikeVO {
	
	private int heart_num;
	private int board_num;
	private String user_id;
	
	public LikeVO() {}

	public LikeVO(int heart_num, int board_num, String user_id) {
		this.heart_num = heart_num;
		this.board_num = board_num;
		this.user_id = user_id;
	}	

	public LikeVO(int board_num) {
		this.board_num = board_num;
	}	

	public LikeVO(int board_num, String user_id) {
		this.board_num = board_num;
		this.user_id = user_id;
	}

	public int getHeart_num() {
		return heart_num;
	}

	public void setHeart_num(int heart_num) {
		this.heart_num = heart_num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



}
