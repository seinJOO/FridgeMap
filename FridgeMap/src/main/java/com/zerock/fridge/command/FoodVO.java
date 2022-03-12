package com.zerock.fridge.command;

public class FoodVO {
	private String food_id; 
    private String food_category; 
    private String food_name; 
    private int food_expdate;
    private String food_img;
    
	public FoodVO(String food_id, String food_category, String food_name, int food_expdate, String food_img) {
		super();
		this.food_id = food_id;
		this.food_category = food_category;
		this.food_name = food_name;
		this.food_expdate = food_expdate;
		this.food_img = food_img;
	}

	public String getFood_id() {
		return food_id;
	}

	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}

	public String getFood_category() {
		return food_category;
	}

	public void setFood_category(String food_category) {
		this.food_category = food_category;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public int getFood_expdate() {
		return food_expdate;
	}

	public void setFood_expdate(int food_expdate) {
		this.food_expdate = food_expdate;
	}

	public String getfood_img() {
		return food_img;
	}

	public void setfood_img(String food_img) {
		this.food_img = food_img;
	}  

}
