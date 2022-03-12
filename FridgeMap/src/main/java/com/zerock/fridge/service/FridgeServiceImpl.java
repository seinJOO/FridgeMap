package com.zerock.fridge.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.fridge.command.Board_alertVO;
import com.zerock.fridge.command.FoodVO;
import com.zerock.fridge.command.FridgeVO;
import com.zerock.fridge.mapper.FridgeMapper;

@Service
public class FridgeServiceImpl implements FridgeService {
	
	@Autowired
	FridgeMapper mapper;
	
	@Override
	public ArrayList<FridgeVO> getExpdate(String user_id) {
		
		ArrayList<FridgeVO> list = mapper.getExpdate(user_id);	
		return list;
	}
	

	@Override
	public void delete(String fridge_name) {
		
		mapper.delete(fridge_name);
		
	}


	@Override
	public ArrayList<FoodVO> getFoodTable() {
		
		ArrayList<FoodVO> getFoodList = mapper.getFoodTable();
		
		return getFoodList;
	}


	@Override
	public ArrayList<FridgeVO> getPurchase(String user_id) {
		ArrayList<FridgeVO> list = mapper.getPurchase(user_id);	
		
		return list;
	}


	@Override
	public ArrayList<Board_alertVO> getAlert(String user_id) {
		ArrayList<Board_alertVO> list = mapper.getAlert(user_id);
		return list;
	}


	@Override
	public ArrayList<FridgeVO> getPrice(String user_id) {
		ArrayList<FridgeVO> list = mapper.getPrice(user_id); 
		return list;
	}
	


}
