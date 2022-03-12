package com.zerock.fridge.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zerock.fridge.command.Board_alertVO;
import com.zerock.fridge.command.FoodVO;
import com.zerock.fridge.command.FridgeVO;
import com.zerock.fridge.service.FridgeService;

@Controller
@RequestMapping("/fridge/*")

public class FridgeController {
	
	@Autowired
 	private FridgeService service; 

	
//	@RequestMapping("/myPage")
//	public String fridge() {
//		
//		
//		
//	   return "fridge/myPage";	
//	}
	
	@RequestMapping(value="/myPage")
	public String expdate(Model model, HttpSession session){
		//1.list 에 요청이 들어오면 DB에서 모든 값을 가지고 화면으로 이동해야한다.
		String user_id = (String)session.getAttribute("user_id");
		
		ArrayList<FridgeVO> expList = service.getExpdate(user_id);
		ArrayList<FoodVO> foodList = service.getFoodTable();
		ArrayList<FridgeVO> purchaseList = service.getPurchase(user_id);
		ArrayList<Board_alertVO> alertList = service.getAlert(user_id);
		ArrayList<FridgeVO> priceList = service.getPrice(user_id);
	    
		model.addAttribute("priceList", priceList);	
		model.addAttribute("alertList",alertList);
		model.addAttribute("purchaseList",purchaseList);
		//model.addAttribute("today_date", smt);
		model.addAttribute("foodList", foodList);
		model.addAttribute("fridge_expdate", expList);
		
	
		return "fridge/myPage";
		    
		}
		 
	@RequestMapping("/myFridge")
	public String myfridge() {
		return "fridge/myFridge";
	}
	
	
	
	//냉장고 삭제하기
	@RequestMapping("/fridgeDelete")
	public String delete(@RequestParam("user_id") String user_id) {
		 System.out.println(user_id);
		 service.delete(user_id);
		
		 return "redirect:/fridge/myPage";
     }
}

	
