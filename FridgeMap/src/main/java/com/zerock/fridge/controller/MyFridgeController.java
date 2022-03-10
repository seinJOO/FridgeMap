package com.zerock.fridge.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.fridge.command.CountVO;
import com.zerock.fridge.command.FoodVO;
import com.zerock.fridge.command.FridgeVO;
import com.zerock.fridge.service.MyFridgeService;

@Controller
@RequestMapping("/fridge/*")
public class MyFridgeController {
	
	@Autowired
	private MyFridgeService service;
	
	@RequestMapping("fridgeMode")
	public String fridgeMode(HttpSession session, Model model) {
		
		String user_id = (String)session.getAttribute("user_id");
		
		ArrayList<FridgeVO> frozenList = service.getFrozenList(user_id, 18);
		ArrayList<FridgeVO> refriList = service.getRefriList(user_id, 18);
		ArrayList<FridgeVO> roomList = service.getRoomList(user_id, 18);
		
		ArrayList<FoodVO> foodList = service.getFoodList();
		
		int expdateOverCount = service.getCountExpdateOver(user_id);
		
		int frozenListCount = service.getFrozenListCount(user_id);
		int refriListCount = service.getRefriListCount(user_id);
		int roomListCount = service.getRoomListCount(user_id);
		
		CountVO expdateCount = service.getExpdateCount(user_id);
		
		model.addAttribute("frozenList", frozenList);
		model.addAttribute("refriList", refriList);
		model.addAttribute("roomList", roomList);
		
		model.addAttribute("foodList", foodList);
		
		model.addAttribute("expdateOverCount", expdateOverCount);
		
		model.addAttribute("frozenListCount", frozenListCount);
		model.addAttribute("refriListCount", refriListCount);
		model.addAttribute("roomListCount", roomListCount);
		
		model.addAttribute("expdateCount", expdateCount);
		
		return "fridge/fridgeMode";
	}
	
	@RequestMapping("listMode")
	public String listMode(Model model, HttpSession session, 
			@RequestParam("val") String val,
			@RequestParam("searchOption") @Nullable String searchOption,
			@RequestParam("searchVal") @Nullable String searchVal) {
		
		String user_id = (String)session.getAttribute("user_id");
		
		ArrayList<FridgeVO> list = null;
		
		int count = 0;
		
		if(searchOption == null || searchVal == null) {
			if (val.equals("all")) {
				list = service.getAllList(user_id, 1000);
				count = service.getAllListCount(user_id);
				
			} else if(val.equals("frozen")) {
				list = service.getFrozenList(user_id, 1000);
				count = service.getFrozenListCount(user_id);
				
			} else if(val.equals("refri")) {
				list = service.getRefriList(user_id, 1000);
				count = service.getRefriListCount(user_id);
				
			} else if(val.equals("room")) {
				list = service.getRoomList(user_id, 1000);
				count = service.getRoomListCount(user_id);
			}
		}
		
		else {
			list = service.getSearchList(user_id, val, searchOption, searchVal);
			count = service.getSearchListCount(user_id, val, searchOption, searchVal);
		}

		int expdateOverCount = service.getCountExpdateOver(user_id);
		CountVO expdateCount = service.getExpdateCount(user_id);
		
		model.addAttribute("list", list);
		model.addAttribute("expdateOverCount", expdateOverCount);
		model.addAttribute("count", count);
		model.addAttribute("expdateCount", expdateCount);
		
		return "fridge/listMode";
	}
	
	@RequestMapping("updateItem")
	public String updateItem(HttpSession session, FridgeVO vo, RedirectAttributes RA) {
		String user_id = (String)session.getAttribute("user_id");
		vo.setUser_id(user_id);
		
		int result = service.updateItem(vo);
		
		if(result==1) {
			RA.addFlashAttribute("msg", "수정 성공!");
			RA.addFlashAttribute("icon", "success");
		} else {
			RA.addFlashAttribute("msg", "수정 실패!");
			RA.addFlashAttribute("icon", "error");
		}
		
		return "redirect:/fridge/fridgeMode";
	}
	
	@RequestMapping("deleteItem")
	public String deleteItem(HttpSession session, @RequestParam("num") String num, RedirectAttributes RA) {
		
		String user_id = (String)session.getAttribute("user_id");
		
		int result = service.deleteItem(user_id, num);
		
		if(result==1) {
			RA.addFlashAttribute("msg", "삭제 성공!");
			RA.addFlashAttribute("icon", "success");
		} else {
			RA.addFlashAttribute("msg", "삭제 실패!");
			RA.addFlashAttribute("icon", "error");
		} 
		
		return "redirect:/fridge/fridgeMode";
	}
	
	@RequestMapping("getCategory")
	public String getCategory(@RequestParam("category") String category, Model model) {
		ArrayList<FoodVO> categoryList = service.getCategory(category);
		
		model.addAttribute("categoryList", categoryList);
		
		return "fridge/indexListAjax";
	}
	
	@RequestMapping("getFoodItem")
	@ResponseBody
	public FoodVO getFoodItem(@RequestParam("id") String id) {
		FoodVO vo = service.getFoodItem(id);
		
		return vo;
	}
	
	@RequestMapping("insertItem")
	public String insertItem(HttpSession session, FridgeVO vo, RedirectAttributes RA) {
		String user_id = (String)session.getAttribute("user_id");
		
		vo.setUser_id(user_id);
		
		int result = service.insertItem(vo);
		
		if(result==1) {
			RA.addFlashAttribute("msg", "추가 성공!");
			RA.addFlashAttribute("icon", "success");
		} else {
			RA.addFlashAttribute("msg", "추가 실패!");
			RA.addFlashAttribute("icon", "error");
		} 
		
		return "redirect:/fridge/fridgeMode";
	}
	
	@RequestMapping("deleteExpdateOverItems")
	public String deleteExpdateOverItems(HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		
		service.deleteExpdateOverItems(user_id);
		
		return "redirect:/fridge/fridgeMode";
	}
	
	@RequestMapping("searchItems")
	public String searchItems(@RequestParam("val") String val,
			@RequestParam("searchOption") String searchOption,
			@RequestParam("searchVal") String searchVal,
			RedirectAttributes RA,
			HttpSession session) throws UnsupportedEncodingException {
		
		String encodedParam = URLEncoder.encode(searchVal, "UTF-8");
		
		return "redirect:/fridge/listMode?val="+val+"&searchOption="+searchOption+"&searchVal="+encodedParam;
	}
}