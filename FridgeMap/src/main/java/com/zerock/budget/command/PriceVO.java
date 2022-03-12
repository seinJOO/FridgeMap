package com.zerock.budget.command;

import javax.servlet.http.HttpSession;

public class PriceVO {
	

	private String food_id;
	private int fridge_quantity;
	private int buyDate;
	private int fridge_price;	
	private String user_id;
	
	public PriceVO() {}
	
	public PriceVO(String food_id, int fridge_quantity, int buyDate, int fridge_price, HttpSession session) {
		this.food_id = food_id;
		this.fridge_quantity = fridge_quantity;
		this.buyDate = buyDate;		// mapper에서 일수만 받아옴
		this.fridge_price = fridge_price;
		
		this.user_id = (String) session.getAttribute("user_id");
	}
	
	public PriceVO(int buyDate, int fridge_price) {
		this.buyDate = buyDate;
		this.fridge_price = fridge_price;
	}

	public int getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(int buyDate) {
		this.buyDate = buyDate;
	}

	public String getFood_id() {
		return food_id;
	}

	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}

	public int getFridge_price() {
		return fridge_price;
	}

	public void setFridge_price(int fridge_price) {
		this.fridge_price = fridge_price;
	}

	public int getFridge_quantity() {
		return fridge_quantity;
	}

	public void setFridge_quantity(int fridge_quantity) {
		this.fridge_quantity = fridge_quantity;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	

}
