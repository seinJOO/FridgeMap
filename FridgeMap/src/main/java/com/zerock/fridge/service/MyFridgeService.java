package com.zerock.fridge.service;

import java.util.ArrayList;

import com.zerock.fridge.command.CountVO;
import com.zerock.fridge.command.FoodVO;
import com.zerock.fridge.command.FridgeVO;

public interface MyFridgeService {
	
	public ArrayList<FridgeVO> getAllList(String user_id, int count);
	public ArrayList<FridgeVO> getFrozenList(String user_id, int count);
	public ArrayList<FridgeVO> getRefriList(String user_id, int count);
	public ArrayList<FridgeVO> getRoomList(String user_id, int count);
	public ArrayList<FoodVO> getFoodList();
	public int getCountExpdateOver(String user_id);
	public int updateItem(FridgeVO vo);
	public int deleteItem(String user_id, String num);
	public ArrayList<FoodVO> getCategory(String category);
	public FoodVO getFoodItem(String id);
	public int insertItem(FridgeVO vo);
	public int deleteExpdateOverItems(String user_id);
	public int getAllListCount(String user_id);
	public int getFrozenListCount(String user_id);
	public int getRefriListCount(String user_id);
	public int getRoomListCount(String user_id);
	
	public ArrayList<FridgeVO> getSearchList(String user_id,String val,String searchOption,String searchVal);
	public int getSearchListCount(String user_id,String val,String searchOption,String searchVal);
	
	public CountVO getExpdateCount(String user_id);
}