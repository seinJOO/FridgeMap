package com.zerock.fridge.command;

import java.sql.Date;

public class FridgeVO {
	
	private int fridge_num;
	private String user_id;
	private String food_id;
	private String fridge_category;
	private String fridge_name;
	private int fridge_quantity;
	private String fridge_keep;
	private Date fridge_purchase;
	private Date fridge_expdate;
	private int fridge_price;
	
	public FridgeVO() {}

	public FridgeVO(int fridge_num, String user_id, String food_id, String fridge_category, String fridge_name, int fridge_quantity,
			String fridge_keep, Date fridge_purchase, Date fridge_expdate, int fridge_price) {
		super();
		this.fridge_num = fridge_num;
		this.user_id = user_id;
		this.food_id = food_id;
		this.fridge_category = fridge_category;
		this.fridge_name = fridge_name;
		this.fridge_quantity = fridge_quantity;
		this.fridge_keep = fridge_keep;
		this.fridge_purchase = fridge_purchase;
		this.fridge_expdate = fridge_expdate;
		this.fridge_price = fridge_price;
	}

	public int getFridge_num() {
		return fridge_num;
	}

	public void setFridge_num(int fridge_num) {
		this.fridge_num = fridge_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getFood_id() {
		return food_id;
	}

	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}

	public String getFridge_category() {
		return fridge_category;
	}

	public void setFridge_category(String fridge_category) {
		this.fridge_category = fridge_category;
	}

	public String getFridge_name() {
		return fridge_name;
	}

	public void setFridge_name(String fridge_name) {
		this.fridge_name = fridge_name;
	}

	public int getFridge_quantity() {
		return fridge_quantity;
	}

	public void setFridge_quantity(int fridge_quantity) {
		this.fridge_quantity = fridge_quantity;
	}

	public String getFridge_keep() {
		return fridge_keep;
	}

	public void setFridge_keep(String fridge_keep) {
		this.fridge_keep = fridge_keep;
	}

	public Date getFridge_purchase() {
		return fridge_purchase;
	}

	public void setFridge_purchase(Date fridge_purchase) {
		this.fridge_purchase = fridge_purchase;
	}

	public Date getFridge_expdate() {
		return fridge_expdate;
	}

	public void setFridge_expdate(Date fridge_expdate) {
		this.fridge_expdate = fridge_expdate;
	}

	public int getFridge_price() {
		return fridge_price;
	}

	public void setFridge_price(int fridge_price) {
		this.fridge_price = fridge_price;
	}
}