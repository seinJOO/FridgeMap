package com.zerock.fridge.mapper;

import java.util.ArrayList;

import com.zerock.fridge.command.Board_alertVO;
import com.zerock.fridge.command.FoodVO;
import com.zerock.fridge.command.FridgeVO;

public interface FridgeMapper {
	
	
		public void delete(String fridge_name);//냉장고 전체 삭제
		public ArrayList<FridgeVO> getExpdate(String user_id); //냉장고 가져오기
		public ArrayList<FoodVO> getFoodTable(); //냉장고 이모티콘 가져오기
		public ArrayList<FridgeVO> getPurchase(String user_id);
		public ArrayList<Board_alertVO> getAlert(String user_id);//게시판 알람 가져오기

	
	

}
