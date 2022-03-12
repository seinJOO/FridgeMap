<%@page import="com.zerock.budget.command.PriceVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link href="/resources/css/budget.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js "></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>Budget</title>
<style>
body {
	font-family: 'Poor Story', cursive;
	font-weight : 800;
	font-size : 20px; 
	font-color : black;
}
 strong {
 	font-size: 20px; 
    font-family: 'Poor Story', cursive;
 }
 
 h1, a {
 	font-family: 'Poor Story', cursive;
	font-weight : 600;
	font-size : 20px; 
 }
 
 span, button, p {
 	font-family: 'Poor Story', cursive;
	font-weight : 800;
	font-size : 18px; 
 }
 .calheight {
 	height : 60hv;
 }

</style>
</head>
<body>
<div class="container">
<div class="tile is-ancestor">
<div class="tile is-parent is-vertical">
<div class="tile is-child box">
<div class="tile content">
<div class="tile is-parent pickers">
<div class="tile is-child" >
		<p class = "title">Track Your Food Expenses!</p>
		<input class="input is-warning dateinput" type="text" id="pickStartDate" class="pickStartDate">
		 ~ 
		<input	class="input is-warning dateinput" type="text" id="pickEndDate" class="pickEndDate">
		<button class="button is-link is-light" onclick="getTotalSpend()">확인</button>
</div>
</div>
<div class ="tile is-parent pickers">
	<blockquote id="moneySpend" class="moneySpend"><i id="total"></i></blockquote>
</div>
</div>
</div>


<div class="tile is-child">
<div class="tile">
<div class="tile is-parent box is-8">
	<div class="calendar is-calendar-large calheight">
		<div class="calendar-nav">
			<div class="calendar-nav-left">
				<button class="button is-link" onclick="location.href='calendar?year=${cri.month==1 ? cri.year-1 : cri.year}&month=${cri.month==1 ? 12 : cri.month-1}'">
					<i class="fa fa-chevron-left">&lt;</i>
				</button>
			</div>
			<div>${cri.year}년 ${cri.month }월</div>
			<div class="calendar-nav-right">
				<button class="button is-link" onclick="location.href='calendar?year=${cri.month==12 ? cri.year+1 : cri.year}&month=${cri.month==12 ? 1 : cri.month+1}'">
					<i class="fa fa-chevron-right">&gt;</i>
				</button>
			</div>
		</div>
		<div class="calendar-container">
			<div class="calendar-header">
				<div class="calendar-date">Sun</div>
				<div class="calendar-date">Mon</div>
				<div class="calendar-date">Tue</div>
				<div class="calendar-date">Wed</div>
				<div class="calendar-date">Thu</div>
				<div class="calendar-date">Fri</div>
				<div class="calendar-date">Sat</div>
			</div>
			<div class="calendar-body">
		<c:forEach var = "date" items="${cal }" varStatus = "num">
		<c:choose>		
			<c:when test="${date == today.date && today.month == cri.month && monthly[num.index] != 0 && monthly[num.index] != null}">
			<div class="calendar-date tooltip" data-tooltip="You have appointments">
			<button class="date-item is-today badge" id="price">${date }</button>
			<div class="calendar-events">
			<a class="calendar-event is-warning" href="#" onclick="showList(${date});">${monthly[num.index] }</a>
			</div>
			</div>
			</c:when>
			<c:when test="${date eq today.date && today.month eq cri.month}">
				<div class="calendar-date">
				<button class="date-item is-today">${date }</button>
				</div>
			</c:when>
			<c:when test="${date == 0 }">
				<div class="calendar-date disabled">
				<button class="date-item"></button>
				</div>
			</c:when>			
			<c:when test="${monthly[num.index] != 0 && monthly[num.index] != null}">				
			<div class="calendar-date tooltip" data-tooltip="You have appointments">
			<button class="date-item badge" id="price">${date }</button>
			<div class="calendar-events">
			<a class="calendar-event is-warning" href="#" onclick="showList(${date});">${monthly[num.index] }</a>
			</div> 
			</div>
			</c:when>			
		<c:otherwise>
			<div class="calendar-date">
				<button class="date-item">${date }</button>
			</div>
		</c:otherwise>
		</c:choose>		
		</c:forEach>		
		</div>
		</div>
</div>
</div>
<div class="tile is-parent box">
<div class="tile is-child notification" style="text-align : center; background-color : whitesmoke;">
	<input type="hidden" id="nowYear" value="${cri.year }">
	<input type="hidden" id="nowMonth" value="${cri.month }">
       <p class="title" id="buydate">장보기 날짜의<br>기록을 확인하세요</p><br> <!-- class : title/subtitle/content -->
       <p id="all">기록을 클릭하면<br>목록을 확인할 수 있어요 !</p>
</div>
</div>
</div>

</div>
</div>
</div>
</div>

	<script type="text/javascript">
	  function showList(a) {
		  $("#all").empty();
		  $("#buydate").text($("#nowMonth").val()+"월 "+ a + "일");
		  $.ajaxSettings.traditional = true;
		  list="";
		  $.ajax({
			  type : "post",
			  url : "getOrderList",
			  data : {
				  "year" : $("#nowYear").val(),
				  "month" : $("#nowMonth").val(),
				  "date" : a
			  },
			  success : (function(list) {
				  for (i = 0 ; i < list.length; i++) {
					  $("#all").append(list[i]);
					  jQuery("<br>").appendTo("#all");
				  }
				  	
				  })
		  });
	  }
</script>
<script>
 $(document).ready(function() {		
	 	$("#pickEndDate").datepicker();
	    $("#pickStartDate").datepicker();    
 
		 $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: false //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: false //콤보박스에서 년 선택 가능
            ,changeMonth: false //콤보박스에서 월 선택 가능                
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트  
            ,maxDate: "today" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
		 })  
}); 
 

 function getTotalSpend() {
	 $("#moneySpend").empty();
	 
	 $.ajax({
		  type : "post",
		  url : "getTotalSpend",
		  data : {
			  "pickStartDate" : $("#pickStartDate").datepicker().val(),
			  "pickEndDate" : $("#pickEndDate").datepicker().val()
		  },
		  success : (function(total) {	
			  		if (total == '') {
			  			$("#moneySpend").append("해당 기간에는 지출 내역이 없습니다");
			  		}else $("#moneySpend").append(total+"원 지출했네요!<br> 날짜별 지출 리스트를 확인하세요");
			  })
	  });
 }
</script>
</body>
</html>