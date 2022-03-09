package com.zerock.board.command;

public class AlertVO {
	private int alert_id;
	private String user_id;
	private int board_num;
	private String alert_type;
	
	public AlertVO() {}

	public AlertVO(String user_id, int board_num, String alert_type) {
		super();
		this.user_id = user_id;
		this.board_num = board_num;
		this.alert_type = alert_type;
	}

	public int getAlert_id() {
		return alert_id;
	}

	public void setAlert_id(int alert_id) {
		this.alert_id = alert_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getAlert_type() {
		return alert_type;
	}

	public void setAlert_type(String alert_type) {
		this.alert_type = alert_type;
	}
	
	
}
