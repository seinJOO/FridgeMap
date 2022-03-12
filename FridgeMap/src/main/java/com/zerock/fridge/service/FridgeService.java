package com.zerock.fridge.service;

import java.util.ArrayList;

import com.zerock.fridge.command.Board_alertVO;
import com.zerock.fridge.command.FoodVO;
import com.zerock.fridge.command.FridgeVO;


public interface FridgeService {

	
	public ArrayList<FridgeVO> getExpdate(String user_id); 
	public void delete(String user_id); 
	public ArrayList<FoodVO> getFoodTable();
	public ArrayList<FridgeVO> getPurchase(String user_id);
	public ArrayList<Board_alertVO> getAlert(String user_id);
	public ArrayList<FridgeVO> getPrice(String user_id);
}
