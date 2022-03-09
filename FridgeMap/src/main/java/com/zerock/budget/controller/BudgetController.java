package com.zerock.budget.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zerock.budget.command.PriceVO;
import com.zerock.budget.command.DateVO;
import com.zerock.budget.service.BudgetService;


@Controller
@RequestMapping("/budget/*")
public class BudgetController {
	
	@Autowired
	BudgetService service;


// !!!!!!USER_ID 세션에서 받아서 장바구니, 목록 vo에 SET해주기 !!!!!!
	// 가계부 처음 화면처리
	@RequestMapping("/main")
	public String budgetMain(Model model) {
		
		DateVO today = service.getToday();
		ArrayList<Integer> date = service.getCalendar(today);
		ArrayList<Integer> priceList = service.getPrice(today, date); // 인자값으로 날짜, 캘린더값 전달
		
		model.addAttribute("cal",date); 		// cal : 해당 월의 날짜배열
		model.addAttribute("cri",today); 		// cri : 달력 보여주는 기준이 되는 연,월
		model.addAttribute("today",today);		// today : 실제 오늘 날짜
		model.addAttribute("monthly", priceList);	// 달력에 표시할 날짜당 금액
		return "budget/main";
	}
	
	// 월 조절 시 화면처리
	@RequestMapping("/calendar") 
	public String Calendar(Model model, @RequestParam("year") int year, @RequestParam("month") int month) {	
		DateVO calList = new DateVO(year, month, 1);
		ArrayList<Integer> date = service.getCalendar(calList);
		ArrayList<Integer> priceList = service.getPrice(calList, date);
		model.addAttribute("cal",date);
		model.addAttribute("cri",calList);
		model.addAttribute("monthly", priceList);
		
		DateVO today = service.getToday();
		model.addAttribute("today", today);
		return "budget/main";
	}

	
	@RequestMapping("/getOrderList")
	@ResponseBody
	public String[] getOrderList(@RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("date") int date) {
		System.out.println(year+"-"+month+"-"+date);
		ArrayList<PriceVO> orderList = service.getList(new DateVO(year, month, date));
		
		String[] list = service.sendViewList(orderList);
		return list;
		
	}
	
	@RequestMapping("/getTotalSpend") 
	@ResponseBody
	public String getTotalSpend(@RequestParam("pickStartDate") String pickStartDate, @RequestParam("pickEndDate") String pickEndDate) {
		DateVO vo = new DateVO(pickStartDate, pickEndDate);
		String total = service.getTotalSpend(vo);
		System.out.println(total);
		return total;		
	}
	
	
}
