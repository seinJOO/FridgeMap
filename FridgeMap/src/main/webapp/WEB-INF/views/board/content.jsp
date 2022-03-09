<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="../include/header.jsp"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/board.css">
<link href="https://cdn.staticaly.com/gh/hung1001/font-awesome-pro/4cac1a6/css/all.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-latest.js"></script> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: 'Poor Story', cursive;
	font-weight : 450;
	font-size : 20px; 
}
 strong {
 	font-size: 25px; 
    font-family: 'Poor Story', cursive;
 }
 .media-content a {
 	font-family: 'Poor Story', cursive;
	font-weight : 600;
	font-size : 18px;
 }
 h1, a {
 	font-family: 'Poor Story', cursive;
	font-weight : 600;
	font-size : 20px; 
 }
 
 span, button {
 	font-family: 'Poor Story', cursive;
	font-weight : 600;
	font-size : 18px; 
 }
 .contexts {
 	min-height : 200px;
 }
</style>
</head>
<body>
<div class="container">
<div class="tile is-ancestor">
<div class="tile is-parent is-vertical">
<div class="tile is-child"></div>
<div class="tile is-child box">
  	<h1 class="title is-5 has-text-grey">
    <a href="https://github.com/bluefantail/bulma-list" target="_blank">
      <span class="icon"><i class="fas fa-refrigerator"></i></span> Share your Fridge! | </a>냉장고 포럼</h1>
  	

  <div class="tabs is-boxed" style="margin-bottom : 3%">
    <ul>
      <li class="tab"><a href="category?board_category=main">전체보기</a></li>
      <li class="tab"><a href="category?board_category=vers">자랑매치</a></li>
      <li class="tab"><a href="category?board_category=tips">꿀팁줍줍</a></li>
      <li class="tab"><a href="category?board_category=qna">우리끼리Q&amp;A</a></li>
    </ul>
  </div>
	<div style="margin : 0 10%">
	<div class="block">
	<c:choose>
	<c:when test="${board.board_category eq 'vers' }"><h1>자랑매치</h1></c:when>
	<c:when test="${board.board_category eq 'tips'}"><h1>꿀팁줍줍</h1></c:when>
	<c:when test="${board.board_category eq 'qna'}"><h1>우리끼리Q&amp;A</h1></c:when>	
	</c:choose>
	</div>
	<div class="block">
	<table style="width:100%">
	<tr>
	<td><strong>${board.board_title }</strong></td>
	<td style="text-align:right"><small>조회수 : ${board.board_view } </small><small class="likeCount">  좋아요 : ${board.board_like }</small></td>
	</tr>
	<tr>
	<td><h1>작성자 : ${board.user_nick }</h1></td>
	<td style="text-align:right"><small>작성일 : <fmt:formatDate value="${board.board_regdate }" pattern="yy.MM.dd HH:mm"/></small></td>
	</tr>
	
	</table>
		
		
	</div>
	<hr>
	<div class="field-body">
		<div class="contexts">${board.board_content }</div>
	</div>
	</div>
	<a class="button is-rounded"><i class="fas fa-paperclip"></i>&#32;&#32;filename</a>

<div class="field is-horizontal">
  <div class="field-label">
    <!-- Left empty for spacing -->
  </div>
  <div class="field-body">
    <div class="field">
      <div class="control">
      <input type="hidden" value="${sessionScope.user_id }" id="user_id" name="user_id">
      <button type="button" class="button is-outlined" onclick="goBack('${cri.board_category}','${cri.pageNum }')">
      <span class="icon is-small"><i class="fas fa-backspace"></i></span><span>뒤로가기</span></button>
      
      <c:choose>
      <c:when test="${result > 0 }">
      <button type="button" class="button is-outlined" onclick="unLike('${board.board_num }')">
      <span class="icon is-small"><i class="fas fa-heart" style="color:red" id="icon"></i></span><span>좋아요를 눌렀습니다</span></button>    
      </c:when>
      <c:otherwise>
       <button type="button" class="button is-outlined heartClick" onclick="Like('${board.board_num }')">
      <span class="icon is-small"><i class="fas fa-heart-circle" id="icon"></i></span><span>좋아요</span></button>
      </c:otherwise>
      </c:choose>
      
       <c:if test="${board.user_id == sessionScope.user_id }"> <!-- 세션에 아이디 어떻게 저장했는지 확인하기 -->
        <button type="button" class="button is-danger is-outlined" onclick="goDelete('${board.board_num }')" style="float:right">
        <span class="icon is-small"><i class="fas fa-trash-alt"></i></span><span>삭제하기</span></button>
        <button type="button" class="button is-success is-outlined" onclick="goModify('${cri.board_category }','${cri.pageNum }','${board.board_num }')" style="float:right">
        <span class="icon is-small"><i class="fas fa-tools"></i></span><span>수정하기</span></button>
        </c:if>         
      </div>
    </div>
  </div>
</div>
</div>

<div class="tile is-child box">
<article class="media">
  <div class="media-content">
    <div class="content">
    </div>
    </div>
    </article>
	<strong>댓글 수 : ${board.cmtCount}</strong>
	<hr>
	<c:forEach var="comment" items="${comment }" varStatus="num">
    <article class="media">
      <figure class="media-left">
        <p class="image is-48x48"></p>
      </figure>
      <div class="media-content">
        <div class="content">
          <p>
          	<%-- <input type="hidden" id="modalNum" value="${comment.comment_num }">
          	<input type="hidden" id="modalNick" value="${comment.user_nick }">
          	<input type="hidden" id="modalContent" value="${comment.comment_content }"> --%>
            <span>${comment.user_nick }</span><br>
            <strong>${comment.comment_content }</strong><br>
            <small><fmt:formatDate value="${comment.comment_date }" pattern="yy.MM.dd HH:mm"/></small>
            <c:if test="${sessionScope.user_nick == comment.user_nick }">
            <button class="button is-small" onclick="modComment('${comment.comment_num}','${comment.comment_content }','${cri.board_category }','${cri.pageNum }')">수정/삭제</button>
            <!-- onclick="modalMod('${comment.user_nick }','${comment.comment_content }','${comment.comment_date }) -->
            </c:if>
          </p>
        </div>
      </div>
    </article>
    <hr>
</c:forEach>
<%-- <c:if test="${not empty sessionScope.user_id }"></c:if> --%>
<form id="commentRegist" action="commentRegist" method="post">
<article class="media" style="margin:5% auto">
  <div class="media-content">
    <div class="field">
      <p class="control">
      <input type="hidden"  name="board_category" id="board_category" value="${cri.board_category }">
      <input type="hidden"  name="pageNum" id="pageNum" value="${cri.pageNum }">
      <input type="hidden" name="board_num" id="board_num" value="${board.board_num}">
      <input type="hidden" name="user_id" id="user_id" value="${board.user_id}">
      <input type="hidden"  name="user_nick" id="user_nick" value="${sessionScope.user_nick }">
      <textarea name="comment_content" class="textarea is-info" placeholder="따듯한 배려의 마음을 담아 댓글을 작성해주세요"></textarea>
   		<button class="button" type="button" onclick="commentCheck()" style="float:right">댓글달기</button>
      </p>
    </div>
  </div>
</article>
</form>
</div>
</div>
</div>
</div>
<!-- 모달창 -->
<div class="modal" id="modComment"> 
  <div class="modal-background"></div> 
  <div class="modal-card"> 
    <header class="modal-card-head"> 
      <p class="modal-card-title">댓글 수정하기</p> 
      <button class="delete" id="closetop" aria-label="close"></button> 
    </header> 
    <section class="modal-card-body">    
    <div class="content"> 
      <textarea name="comment_content" id="modalContent" class="textarea is-info"></textarea>
      </div>  
    </section> 
    <footer class="modal-card-foot"> 
      <button class="button is-info" id="update">수정하기</button> 
      <button class="button is-danger" id="delete">삭제하기</button> 
      <button class="button is-info" id="closebtn">취소</button> 
    </footer>
 
  </div>
</div>
<script>

function Like(board_num) {
	$.ajax({
		url : "Like",
		type : "get",
		data : {
			"board_num": board_num
		},
		async : false,
		success : function(count) {
			let heart = count; //하트총개수 다시가져오기
			$(".likeCount").html("  좋아요 : "+heart);
		}		
	})	
	document.location.reload(true);	
}

function unLike(board_num) {
	$.ajax({
		url : "unLike",
		type : "get",
		data : {
			"board_num": board_num
		},
		async : false,
		success : function(result) {
			let heart = result; //하트총개수 다시가져오기
			$(".likeCount").html("  좋아요 : "+ heart);
					
		}		
	})
	document.location.reload(true);
}

function modComment(comment_num, comment_content, board_category, pageNum) {
	
$(".modal").addClass("is-active"); 
	$("#modalContent").append(comment_content);
    
	$("#lanuchModal").click(function() { 
	  $(".modal").addClass("is-active");  
	}); 
	
	$(".modal-close").click(function() { 
	   $(".modal").removeClass("is-active"); 
	}); 
	
	$("#closebtn").click(function() { 
	   $("#modalContent").empty();
	   $(".modal").removeClass("is-active");
	});
	 
	$("#closetop").click(function() {
		$("#modalContent").empty();
	    $(".modal").removeClass("is-active"); 
	});
	
	$("#update").click(function() {
		if($("#modalContent").val() == '') {
			Swal.fire("내용을 한 글자 이상 입력해주세요!","","warning");
			return;
		} else {
			
			var modi = document.createElement("form");
			modi.setAttribute("charset", "UTF-8");
			modi.setAttribute("method", "Post");  //Post 방식
			modi.setAttribute("action", "updateComment"); //요청 보낼 주소

		    var hiddenField = document.createElement("input");
		    hiddenField.setAttribute("type", "hidden");
		    hiddenField.setAttribute("name", "comment_num");
		    hiddenField.setAttribute("value", comment_num);
		    modi.appendChild(hiddenField);

		    hiddenField = document.createElement("input");
		    hiddenField.setAttribute("type", "hidden");
		    hiddenField.setAttribute("name", "comment_content");
		    hiddenField.setAttribute("value", $("#modalContent").val());
		    modi.appendChild(hiddenField);
		    
		    hiddenField = document.createElement("input");
		    hiddenField.setAttribute("type", "hidden");
		    hiddenField.setAttribute("name", "board_category");
		    hiddenField.setAttribute("value", board_category);
		    modi.appendChild(hiddenField);
		    
		    hiddenField = document.createElement("input");
		    hiddenField.setAttribute("type", "hidden");
		    hiddenField.setAttribute("name", "pageNum");
		    hiddenField.setAttribute("value", pageNum);
		    modi.appendChild(hiddenField);
		    
		    hiddenField = document.createElement("input");
		    hiddenField.setAttribute("type", "hidden");
		    hiddenField.setAttribute("name", "board_num");
		    hiddenField.setAttribute("value", $("#board_num").val());
		    modi.appendChild(hiddenField);
		    
		    document.body.appendChild(modi);
		    modi.submit();
		    
		}		
	});
	
	$("#delete").click(function() {
		Swal.fire({
			  title: '댓글을 삭제하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '확인',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.isConfirmed) {
			 
		    var modi = document.createElement("form");
			modi.setAttribute("charset", "UTF-8");
			modi.setAttribute("method", "Post");  //Post 방식
			modi.setAttribute("action", "deleteComment"); //요청 보낼 주소
	
		    var hiddenField = document.createElement("input");
		    hiddenField.setAttribute("type", "hidden");
		    hiddenField.setAttribute("name", "comment_num");
		    hiddenField.setAttribute("value", comment_num);
		    modi.appendChild(hiddenField);
	
		    hiddenField = document.createElement("input");
		    hiddenField.setAttribute("type", "hidden");
		    hiddenField.setAttribute("name", "comment_content");
		    hiddenField.setAttribute("value", $("#modalContent").val());
		    modi.appendChild(hiddenField);
		    
		    hiddenField = document.createElement("input");
		    hiddenField.setAttribute("type", "hidden");
		    hiddenField.setAttribute("name", "board_category");
		    hiddenField.setAttribute("value", board_category);
		    modi.appendChild(hiddenField);
		    
		    hiddenField = document.createElement("input");
		    hiddenField.setAttribute("type", "hidden");
		    hiddenField.setAttribute("name", "pageNum");
		    hiddenField.setAttribute("value", pageNum);
		    modi.appendChild(hiddenField);
		    
		    hiddenField = document.createElement("input");
		    hiddenField.setAttribute("type", "hidden");
		    hiddenField.setAttribute("name", "board_num");
		    hiddenField.setAttribute("value", $("#board_num").val());
		    modi.appendChild(hiddenField);
		    
		    document.body.appendChild(modi);
		    modi.submit();
	  }
	})
	})
}


function goModify(board_category, pageNum, board_num) {
	var form = document.createElement("form");
    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post");  //Post 방식
    form.setAttribute("action", "modify"); //요청 보낼 주소

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

function goDelete(board_num) {
	
	Swal.fire({
		  title: '글을 삭제하시겠습니까?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '확인',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.isConfirmed) {
	
		var del = document.createElement("form");
		del.setAttribute("charset", "UTF-8");
		del.setAttribute("method", "Post");  //Post 방식
		del.setAttribute("action", "deleteContent"); //요청 보낼 주소
	
	    var hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "board_num");
	    hiddenField.setAttribute("value", board_num);
	    del.appendChild(hiddenField);
	    document.body.appendChild(del);
	    del.submit();
	}
	})
}

function goBack(board_category, pageNum) {
	var form2 = document.createElement("form");
    form2.setAttribute("charset", "UTF-8");
    form2.setAttribute("method", "Post");  //Post 방식
    form2.setAttribute("action", "category"); //요청 보낼 주소

    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "board_category");
    hiddenField.setAttribute("value", board_category);
    form2.appendChild(hiddenField);

    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "pageNum");
    hiddenField.setAttribute("value", pageNum);
    form2.appendChild(hiddenField);
    document.body.appendChild(form2);
    form2.submit();	
}

function commentCheck() {
	Swal.fire({
		  title: '댓글을 등록하시겠습니까?',
		  icon: 'info',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '확인',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.isConfirmed) {
			  $("#commentRegist").submit();
		  }
		})
}
	

</script>
</body>
</html>