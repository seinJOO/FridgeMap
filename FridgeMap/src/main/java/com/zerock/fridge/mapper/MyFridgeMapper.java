package com.zerock.fridge.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.zerock.fridge.command.CountVO;
import com.zerock.fridge.command.FoodVO;
import com.zerock.fridge.command.FridgeVO;

public interface MyFridgeMapper {
	public ArrayList<FridgeVO> getAllList(@Param("user_id")String user_id, @Param("count")int count);
	public ArrayList<FridgeVO> getFrozenList(@Param("user_id")String user_id, @Param("count")int count);
	public ArrayList<FridgeVO> getRefriList(@Param("user_id")String user_id, @Param("count")int count);
	public ArrayList<FridgeVO> getRoomList(@Param("user_id")String user_id, @Param("count")int count);
	public ArrayList<FoodVO> getFoodList();
	public int getExpdateOver(String user_id);
	public int updateItem(FridgeVO vo);
	public int deleteItem(@Param("user_id")String user_id, @Param("num")String num);
	public ArrayList<FoodVO> getCategory(String category);
	public FoodVO getFoodItem(String id);
	public int insertItem(FridgeVO vo);
	public int deleteExpdateOverItems(String user_id);
	
	public int getAllListCount(String user_id);
	public int getFrozenListCount(String user_id);
	public int getRefriListCount(String user_id);
	public int getRoomListCount(String user_id);
	
	public ArrayList<FridgeVO> getSearchList(
			@Param("user_id") String user_id,
			@Param("val") String val, 
			@Param("searchOption") String searchOption, 
			@Param("searchVal") String searchVal);
	
	public int getSearchListCount(
			@Param("user_id") String user_id,
			@Param("val") String val, 
			@Param("searchOption") String searchOption, 
			@Param("searchVal") String searchVal);
	
	public CountVO getExpdateCount(String user_id);
}