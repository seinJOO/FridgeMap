package com.zerock.fridge.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.fridge.command.CountVO;
import com.zerock.fridge.command.FoodVO;
import com.zerock.fridge.command.FridgeVO;
import com.zerock.fridge.mapper.MyFridgeMapper;

@Service
public class MyFridgeServiceImpl implements MyFridgeService {
	
	@Autowired
	private MyFridgeMapper mapper;

	@Override
	public ArrayList<FridgeVO> getAllList(String user_id, int count) {
		ArrayList<FridgeVO> allList = mapper.getAllList(user_id, count);
		return allList;
	}

	@Override
	public ArrayList<FridgeVO> getFrozenList(String user_id, int count) {
		ArrayList<FridgeVO> frozenList = mapper.getFrozenList(user_id, count);
		
		return frozenList;
	}

	@Override
	public ArrayList<FridgeVO> getRefriList(String user_id, int count) {
		ArrayList<FridgeVO> refriList = mapper.getRefriList(user_id, count);
		
		return refriList;
	}

	@Override
	public ArrayList<FridgeVO> getRoomList(String user_id, int count) {
		ArrayList<FridgeVO> roomList = mapper.getRoomList(user_id, count);
		
		return roomList;
	}

	@Override
	public ArrayList<FoodVO> getFoodList() {
		ArrayList<FoodVO> iconList = mapper.getFoodList();
		
		return iconList;
	}

	@Override
	public int getCountExpdateOver(String user_id) {
		int count = mapper.getExpdateOver(user_id);
		
		return count;
	}

	@Override
	public int updateItem(FridgeVO vo) {
		int result = mapper.updateItem(vo);
		
		return result;
	}

	@Override
	public int deleteItem(String user_id, String num) {
		int result = mapper.deleteItem(user_id, num);
		
		return result;
	}

	@Override
	public ArrayList<FoodVO> getCategory(String category) {
		ArrayList<FoodVO> categoryList = mapper.getCategory(category);
		
		return categoryList;
	}

	@Override
	public FoodVO getFoodItem(String id) {
		FoodVO vo = mapper.getFoodItem(id);
		
		return vo;
	}

	@Override
	public int insertItem(FridgeVO vo) {
		int result = mapper.insertItem(vo);
		
		return result;
	}

	@Override
	public int deleteExpdateOverItems(String user_id) {
		int result = mapper.deleteExpdateOverItems(user_id);
		
		return result;
	}

	@Override
	public int getAllListCount(String user_id) {
		int result = mapper.getAllListCount(user_id);
		
		return result;
	}

	@Override
	public int getFrozenListCount(String user_id) {
		int result = mapper.getFrozenListCount(user_id);
		
		return result;
	}

	@Override
	public int getRefriListCount(String user_id) {
		int result = mapper.getRefriListCount(user_id);
		
		return result;
	}

	@Override
	public int getRoomListCount(String user_id) {
		int result = mapper.getRoomListCount(user_id);
		
		return result;
	}

	@Override
	public ArrayList<FridgeVO> getSearchList(String user_id, String val, String searchOption, String searchVal) {
		ArrayList<FridgeVO> searchList = mapper.getSearchList(user_id, val, searchOption, searchVal);
		
		return searchList;
	}

	@Override
	public int getSearchListCount(String user_id, String val, String searchOption, String searchVal) {
		int result = mapper.getSearchListCount(user_id, val, searchOption, searchVal);
		
		return result;
	}

	@Override
	public CountVO getExpdateCount(String user_id) {
		CountVO vo = mapper.getExpdateCount(user_id);
		
		return vo;
	}

}
