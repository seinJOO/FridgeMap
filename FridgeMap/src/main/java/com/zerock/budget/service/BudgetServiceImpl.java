package com.zerock.budget.service;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zerock.budget.command.PriceVO;
import com.zerock.budget.command.DateVO;
import com.zerock.budget.mapper.BudgetMapper;

@Service
public class BudgetServiceImpl implements BudgetService {
	
	@Autowired
	BudgetMapper mapper;

	HttpSession session;
	
	@Override
	public DateVO getToday() {
		DateVO vo = new DateVO(mapper.nowYear(),mapper.nowMonth(),mapper.nowDate());
		return vo;
	}

	@Override
	public ArrayList<Integer> getCalendar(DateVO vo) {	
		
		int weeks = vo.getWeekdays();
		
		int endDate = mapper.getEndDate(vo) - 1;
		ArrayList<Integer> list = new ArrayList<Integer>();	
		int startDay = mapper.getStartDay(vo) - 1;
		
		// 숫자가 들어가는 index : (시작요일-1) ~ (말일-1)
		// 실제 날짜 인덱스는 실제날짜+(startDay)

		int j = 1;
		for (int i = 0 ; i < weeks ; i++) {	
			if (i < startDay ) {
				list.add(0);
			} else if (i > endDate + startDay) {
				list.add(0);				
			} else {				
				list.add(j);
				j++;
			}			
		}	
		return list;	
	}

	@Override
	public ArrayList<PriceVO> getList(DateVO datevo) {
		ArrayList<PriceVO> orderList = mapper.getBuyList(datevo);
		return orderList;
	}

	@Override
	public ArrayList<Integer> getPrice(DateVO datevo, ArrayList<Integer> calList) {
		ArrayList<PriceVO> priceList = mapper.getPrice(datevo);	

		ArrayList<Integer> list = new ArrayList<Integer>();	
				
		int j = 0;
		for (int i = 0 ; i < calList.size() ; i++ ) {
			if (priceList.size() == 0) {
				list.add(i,0);
			} else {			
			if (calList.get(i) == 0) {
				list.add(i,0);
			} else {				
				 if (calList.get(i) == priceList.get(j).getBuyDate()) {
					list.add(i,priceList.get(j).getFridge_price());
					j++;
				} else {
					list.add(i,0);
				}				
			}	
			if (j >= priceList.size()) break;
			}
		}
		return list;
	}

	@Override
	public String getTotalSpend(DateVO vo) {
		String total = mapper.getTotalSpend(vo);
		return total;
	}

	@Override
	public String[] sendViewList(ArrayList<PriceVO> orderList) {
		String[] list = new String[orderList.size()];
		for (int i = 0 ; i < orderList.size() ; i++) {
			list[i] = orderList.get(i).getFridge_name() + " " + orderList.get(i).getFridge_quantity() + "개 :  " + orderList.get(i).getFridge_price() + "원";
		}
		return list;
	}

	
	}


