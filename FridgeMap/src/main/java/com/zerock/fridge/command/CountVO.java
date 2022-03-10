package com.zerock.fridge.command;

public class CountVO {
	
	private int black;
	private int red;
	private int yellow;
	private int green;
	
	public CountVO() {}

	public CountVO(int black, int red, int yellow, int green) {
		super();
		this.black = black;
		this.red = red;
		this.yellow = yellow;
		this.green = green;
	}

	public int getBlack() {
		return black;
	}

	public void setBlack(int black) {
		this.black = black;
	}

	public int getRed() {
		return red;
	}

	public void setRed(int red) {
		this.red = red;
	}

	public int getYellow() {
		return yellow;
	}

	public void setYellow(int yellow) {
		this.yellow = yellow;
	}

	public int getGreen() {
		return green;
	}

	public void setGreen(int green) {
		this.green = green;
	}
}