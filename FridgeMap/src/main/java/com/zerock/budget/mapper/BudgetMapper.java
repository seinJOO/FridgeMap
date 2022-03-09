package com.zerock.budget.mapper;

import java.util.ArrayList;

import com.zerock.budget.command.PriceVO;
import com.zerock.budget.command.DateVO;

public interface BudgetMapper {
	
	public int nowYear();
	public int nowMonth();
	public int nowDate();
	public int getStartDay(DateVO vo);
	public int getEndDate(DateVO vo);
	
	public ArrayList<PriceVO> getBuyList(DateVO vo);
	public ArrayList<PriceVO> getPrice(DateVO vo);
	public String getTotalSpend(DateVO vo);
}
