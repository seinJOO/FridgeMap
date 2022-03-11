package com.zerock.board.util;

// pageVO와 criteria는 상호의존적 ! 특히 pageVO는 criteria 없이 동작하지 않음
// pageVO는 페이징 버튼의 기준을 설정

public class PageVO {
	
	//화면에 그려질 버튼들의 개수를 계산하는 클래스
	private int startPage; // 현재페이지의 버튼 시작번호
	private int endPage; // 현재페이지의 버튼 끝번호
	private int total; // 전체 게시글 수
	
	private int pageNum; // 현재 조회하는 페이지
	
	private boolean next; // 다음 버튼 활성화 여부
	private boolean prev; // 이전 버튼 활성화 여부
	
	private Criteria cri; // 페이지 버튼들의 기준
	private String board_category;
	
	// 생성자를 기본생성자로 생성하지 못하고, total과 cri를 인자값으로 하여 계산 처리하도록 선언한다!
	
	public PageVO(int total, Criteria cri) {
		// 전달되는 매개변수에서 초기값을 저장
		this.total = total;
		this.cri = cri;
		this.pageNum = cri.getPageNum();
		this.board_category = cri.getBoard_category();
		
		// endPage 끝페이지 계산 -> 큰 범위의 페이지 번호
		// ex. 조회하는 페이지 번호가 1~10 => 10 / 조회하는 페이지 번호가 11~20 => 20
		// math.ceil을 사용하는 이유 : 10페이지씩 출력 시 5페이지 조회할 경우 4/10 = 0.4 -> 형변환시 0으로 변환
		// 10개씩 출력하려 할 때 pageNum=11일 경우 endPage = 20
		
		this.endPage = (int) Math.ceil(pageNum / (double) 5) * 5; 
		
		// 시작페이지 계산 = 끝 페이지 번호 + (- 한번에 보여질 페이지 번호 + 1)
		this.startPage = endPage - 4 ; // 한 번에 보여질 페이지 번호 = 하단 페이지 번호
		
		// 페이지 번호가 적을때 나타내는 진짜 끝번호 = 전체의 맨 끝 페이지
		// total은 전체 게시물 개수 - total=117일 경우 endPage=20, realEnd=12 <-(11.7)
		int realEnd = (int) Math.ceil(this.total / (double) 6);
		
		// 마지막 페이지 세팅에서 보여줘야 할 번호
		if (this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		// 이전 페이지 버튼 활성화 여부 (startPage => 1, 11, 21, 31, 41... >> 나머지가 1일 경우 이전페이지 showing)
		// startPage가 1보다 크면 true로 반환
		this.prev = startPage > 1;
		
		// 다음 페이지 버튼 활성화 여부
		this.next = realEnd > this.endPage;		
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	
	
}
