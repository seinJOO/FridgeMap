package com.zerock.board.util;


public class Criteria {
	// mysql, mariadb : select * from board by num desc limit ?,?;
	// oracle : select * from (select rownum as rnum, num, writer from board 
	//			where ? >= rownum order by num desc) where rnum >= ? ;
	
	private int pageNum; // 조회할 페이지 번호
	private int count; // 몇 개의 데이터를 게시판에 출력할지 결정
	private String board_category;
	private String keyword;
	
	public Criteria() {
		// 최초 게시판에 진입할 때 기본값 1번 페이지, 10개 데이터 세팅
		this.pageNum = 1;
		this.count = 6;
	}
	
	public Criteria(int pageNum, int count) {
		// 전달받은 매개변수를 이용한 페이지 값 출력
		super();
		this.pageNum = pageNum;
		this.count = count;
	}
	
	public Criteria(String board_category) {
		// 전달받은 매개변수를 이용한 페이지 값 출력
		this.pageNum = 1;
		this.count = 6;
		this.setBoard_category(board_category);
	}		

	public Criteria(int pageNum, String board_category) {
		this.pageNum = pageNum;
		this.count = 6;
		this.setBoard_category(board_category);
	}

	public int getPageStart() {
		return ((pageNum - 1) * count); //-> myspl, mariadb limit x, count 구문의 x값을 구하는 메서드
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}


	
	
	
	
	
}
