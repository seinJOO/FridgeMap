package com.zerock.budget.service;

import java.util.ArrayList;
import java.util.Map;

import com.zerock.budget.command.PriceVO;
import com.zerock.budget.command.DateVO;

public interface BudgetService {

	public DateVO getToday();
	public ArrayList<Integer> getCalendar(DateVO vo);
	public ArrayList<PriceVO> getList(DateVO vo);
	public ArrayList<Integer> getPrice(DateVO vo, ArrayList<Integer> calList);
	public String getTotalSpend(DateVO vo);
	public String[] sendViewList(ArrayList<PriceVO> orderList);
}
