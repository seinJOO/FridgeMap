package com.zerock.fridge.util;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class MyFridgeUtil {
	
	public static int d_day(Date date) {
		
		java.util.Date now = new java.util.Date();
		java.util.Date expdate = date;
		
		long gap = expdate.getTime() - now.getTime();
		
		int dDay = (int) (gap / (24*60*60*1000));
		
		return dDay;
	}
	
	public static String now() {
		
		java.util.Date date = new java.util.Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String now = format.format(date);
		
		return now;
	}
	
	public static String expdate(int expday) {
		Calendar cal = Calendar.getInstance();
        cal.setTime(new java.util.Date());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        cal.add(Calendar.DATE, expday);
        
        String expdate = df.format(cal.getTime());
        
        return expdate;
	}
}