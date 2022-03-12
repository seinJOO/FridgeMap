package com.zerock.budget.command;


public class DateVO {
	
	private int year;
	private int month;
	private int date;
	private String fullDate;
	private String nextFullDate;
	private int weekdays;
	private int startDate;
	private int endDate;
	private String buyDate;
	private String user_id;
	
	private String pickStartDate;
	private String pickEndDate;
	
	
	
	public DateVO(String pickStartDate, String pickEndDate, String user_id) {
		this.pickStartDate = pickStartDate;
		this.pickEndDate = pickEndDate;
		this.user_id = user_id;
	}

	public DateVO(int year, int month, int date, String user_id) {
		super();
		this.year = year;
		this.month = month;
		this.date = date;
		this.user_id = user_id;
			
		this.fullDate = year + "-" + month + "-" + "1";
		this.nextFullDate = year + "-" + (month + 1) + "-" + "1";	
		this.setBuyDate(year + "-" + month + "-" + date);
		
		if (this.startDate == 6 && this.endDate > 30) {
			this.weekdays = 42;
		} else if (this.startDate == 7 && this.endDate > 29) {
			this.weekdays = 42;
		} else this.weekdays = 35;

	}
	public DateVO(int year, int month, int date) {
		super();
		this.year = year;
		this.month = month;
		this.date = date;
			
		this.fullDate = year + "-" + month + "-" + "1";
		this.nextFullDate = year + "-" + (month + 1) + "-" + "1";	
		this.setBuyDate(year + "-" + month + "-" + date);
		
		if (this.startDate == 6 && this.endDate > 30) {
			this.weekdays = 42;
		} else if (this.startDate == 7 && this.endDate > 29) {
			this.weekdays = 42;
		} else this.weekdays = 35;

	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}


	public String getFullDate() {
		return fullDate;
	}

	public void setFullDate(String fullDate) {
		this.fullDate = fullDate;
	}

	public String getNextFullDate() {
		return nextFullDate;
	}

	public void setNextFullDate(String nextFullDate) {
		this.nextFullDate = nextFullDate;
	}

	public int getWeekdays() {
		return weekdays;
	}

	public void setWeekdays(int weekdays) {
		this.weekdays = weekdays;
	}

	public int getStartDate() {
		return startDate;
	}

	public void setStartDate(int startDate) {
		this.startDate = startDate;
	}

	public int getEndDate() {
		return endDate;
	}

	public void setEndDate(int endDate) {
		this.endDate = endDate;
	}

	public String getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	public String getPickStartDate() {
		return pickStartDate;
	}

	public void setPickStartDate(String pickStartDate) {
		this.pickStartDate = pickStartDate;
	}

	public String getPickEndDate() {
		return pickEndDate;
	}

	public void setPickEndDate(String pickEndDate) {
		this.pickEndDate = pickEndDate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	
	
}
