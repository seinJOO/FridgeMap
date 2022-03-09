<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="../include/header.jsp"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js "></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/board.css">
<link href="https://cdn.staticaly.com/gh/hung1001/font-awesome-pro/4cac1a6/css/all.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: 'Poor Story', cursive;
	font-weight : 500;
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
 
 span, button {
 	font-family: 'Poor Story', cursive;
	font-weight : 500;
	font-size : 18px; 
 }
</style>
</head>
<body>

<div class="container">
<div class="tile is-ancestor"  style="margin-top : 5%">
<div class="tile is-parent is-vertical">
<div class="tile is-child box">
  	<h1 class="title is-5 has-text-grey">
    <a href="https://github.com/bluefantail/bulma-list" target="_blank">
      <span class="icon"><i class="fas fa-refrigerator"></i></span> Share your Fridge! | </a>냉장고 포럼</h1>

  <div class="tabs is-boxed">
    <ul>
      <li class="tab is-active"><a href="category?board_category=main">전체보기</a></li>
      <li class="tab"><a href="category?board_category=vers">자랑매치</a></li>
      <li class="tab"><a href="category?board_category=tips">꿀팁줍줍</a></li>
      <li class="tab"><a href="category?board_category=qna">우리끼리Q&amp;A</a></li>
    </ul>
    <div style="float:right; margin: auto 40px;"> 
   <button class="button" type="button" onclick="goWrite('${pageMaker.pageNum}','${pageMaker.cri.board_category }')">글쓰기<i class="fas fa-keyboard" style="margin-left:5px;"></i></button>
    </div>
  </div>

<div class="list has-hoverable-list-items">  
<div class="tile is-child">   
 <c:forEach var="list" items="${list }" varStatus = "num">
   <div class="list-item">
	  <div class="list-item-image">
	  <figure class="image is-48x48">
	  <c:if test="${list.board_category == 'vers'}">
        <i class="fas fa-boxing-glove fa-2x" style="color : #FB7673;"></i> <!-- 카테고리별 이미지 -->
      </c:if>
      <c:if test="${list.board_category == 'tips'}">
        <i class="fas fa-lightbulb-exclamation fa-2x" style="color : #91BEFA;"></i> <!-- 카테고리별 이미지 -->
      </c:if>
      <c:if test="${list.board_category == 'qna'}">
        <i class="fas fa-question-circle fa-2x" style="color : #FB7673;"></i> <!-- 카테고리별 이미지 -->
      </c:if>
      </figure>
	  </div>

      <div class="tite"><a onclick="getContent('${pageMaker.cri.board_category}','${pageMaker.pageNum}', '${list.board_num}')"><strong>${list.board_title }</strong></a></div>
      <div class="nick">${list.user_nick }</div>
      <div class="list-item-description">
            <div class="tag is-rounded">방문자 : ${list.board_view }</div>
            <div class="tag is-rounded">댓글수 : ${list.cmtCount }</div>
            <div class="tag is-rounded">좋아요 : ${list.board_like }</div>
            <div class="tag is-rounded"><fmt:formatDate value="${list.board_regdate }" pattern="yyyy.MM.dd"/></div>
      </div>
    <div class="list-item-controls edit">
      <div class="buttons is-right">
      <c:if test="${list.user_id == sessionScope.user_id }"> <!-- 세션에 아이디 어떻게 저장했는지 확인하기 -->
        <button class="button" type="button" onclick="goModify('${pageMaker.cri.board_category }','${pageMaker.pageNum }','${list.board_num }')">
          <span class="icon is-small">
            <i class="fas fa-edit"></i>
          </span>
          <span>Edit</span>
        </button>
      </c:if>
        <button class="button" type="button" onclick="getContent('${pageMaker.cri.board_category}','${pageMaker.pageNum}', '${list.board_num}')">
          <span class="icon is-small">
            <i class="far fa-hand-pointer"></i>
          </span>
        </button>
        <%-- <button class="button">
        	<span class="icon is-small">
        	
          <c:choose>          
	      <c:when test="${list.board_num eq hearts.board_num }">
	      <i class="fas fa-heart"></i>
	      </c:when>
	      <c:otherwise>
	      <i class="fas fa-heart-circle"></i>     
	      </c:otherwise> 
	      </c:choose>
	      </span></button> --%>
      </div>
    </div>    
 </div>
 </c:forEach> 
</div>  
</div>
</div>
<div class="tile is-child">
<form action="search" method="get">
	<div class="field is-grouped search">
	<input type="hidden" name="board_category" value="${pageMaker.cri.board_category }">
    <input class="input" type="text" name="keyword" placeholder="키워드 검색">
<!--     <datalist id="recommend">
    	<option value="자취생"/>
    	<option value="식단"/>
    </datalist> -->
    <button type="submit" class="button">
     	<span class="icon is-small"><i class="fas fa-search"></i></span>
    </button>
    </div>
</form>
</div>
<div class="tile is-child">
<nav class="pagination is-centered" role="navigation" aria-label="pagination">
<c:if test="${pageMaker.prev }"> 
	<a class="pagination-previous" href="category?board_category=${pageMaker.cri.board_category }&pageNum=${pageMaker.startPage -1 }">Prev</a>
</c:if>				
<ul class="pagination-list">
<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
	<li><a class="pagination-link ${pageMaker.cri.pageNum == num ? 'is-current' : '' }" href="category?board_category=${pageMaker.cri.board_category }&pageNum=${num }" > ${num } </a></li>
</c:forEach>
</ul>
<c:if test="${pageMaker.next }">
	<a class="pagination-next" href="category?board_category=${pageMaker.cri.board_category }&pageNum=${pageMaker.endPage +1 }">Next</a>
</c:if>
</nav>
</div>
</div>
</div>
</div>
<script type="text/javascript">
	function getContent(board_category, pageNum, board_num) {
		var form = document.createElement("form");
        form.setAttribute("charset", "UTF-8");
        form.setAttribute("method", "Post");  //Post 방식
        form.setAttribute("action", "viewContent"); //요청 보낼 주소

        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "board_category");
        hiddenField.setAttribute("value", board_category);
        form.appendChild(hiddenField);

        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "pageNum");
        hiddenField.setAttribute("value", pageNum);
        form.appendChild(hiddenField);
        
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "board_num");
        hiddenField.setAttribute("value", board_num);
        form.appendChild(hiddenField);
        document.body.appendChild(form);
        form.submit();
	}
	
	function goWrite(pageNum, board_category) {		
		var form2 = document.createElement("form");
        form2.setAttribute("charset", "UTF-8");
        form2.setAttribute("method", "Post");  //Post 방식
        form2.setAttribute("action", "write"); //요청 보낼 주소

        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "pageNum");
        hiddenField.setAttribute("value", pageNum);
        form2.appendChild(hiddenField);	

        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "board_category");
        hiddenField.setAttribute("value", board_category);
        form2.appendChild(hiddenField);	
        document.body.appendChild(form2);
        form2.submit();
	}
	
	function goModify(board_category, pageNum, board_num) {
		var form3 = document.createElement("form");
	    form3.setAttribute("charset", "UTF-8");
	    form3.setAttribute("method", "Post");  //Post 방식
	    form3.setAttribute("action", "modify"); //요청 보낼 주소

	    var hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "board_category");
	    hiddenField.setAttribute("value", board_category);
	    form3.appendChild(hiddenField);

	    hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "pageNum");
	    hiddenField.setAttribute("value", pageNum);
	    form3.appendChild(hiddenField);
	    
	    hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "board_num");
	    hiddenField.setAttribute("value", board_num);
	    form3.appendChild(hiddenField);
	    document.body.appendChild(form3);
	    form3.submit();
	}
</script>
</body>
</html>