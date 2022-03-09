<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="../include/header.jsp"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js "></script>
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
	<div class="container box p-6 has-background-light" style="margin-top:5%;">
	<h1 class="title has-text-centered has-text-success 700">글쓰기</h1>
	<h2 class="subtitle has-text-centered 400">	자유롭게 이야기를 나눠보세요 ! </h2>
	
<form action="writeForm" id="writeForm" name="writeForm" method="post">	
  
<div class="field is-horizontal">
  <div class="field-label is-normal"> <label class="label">카테고리</label></div>
  	<div class="field-body">
    <div class="field is-narrow">
      <div class="control">
        <div class="select is-fullwidth 400">
          <select id="board_category" name="board_category">
          	<option value="">카테고리</option>
            <option value="vers">자랑매치</option>
            <option value="tips">정보줍줍</option>
            <option value="qna">우리끼리Q&amp;A</option>
          </select>
        </div>
      </div>
    </div>
  </div>
</div>
  <div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">닉네임</label>
  </div>
  <div class="field-body">
    <div class="field">
      <p class="control is-expanded has-icons-left">
        <input class="input" type="text" id="user_nick" name="user_nick" value="${sessionScope.user_nick}" readonly>
        <span class="icon is-small is-left">
          <i class="fas fa-user"></i>
        </span>
      </p>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label 700">제목</label>
  </div>
  <div class="field-body">
    <div class="field">
      <div class="control">
        <input class="input" type="text" id="board_title" name="board_title">
      </div>
    </div>
  </div>
</div>
<div class="field is-horizontal">
	<div class="field-label is-normal">
    <label class="label 700">파일 첨부</label>
  </div>
   <div class="field-body">
  <div class="file is-info has-name">
    <label class="file-label">
      <input class="file-input" type="file" name="board_file" id="board_file" onchange="readURL(this);">
      <span class="file-cta">
        <span class="file-icon"><i class="fas fa-upload"></i></span>
        <span class="file-label 700">파일 업로드</span>
      </span>
      <span class="file-name 400">Screen Shot 2017-07-29 at 15.54.25.png</span>
    </label>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label 700">내용</label>
  </div>
  <div class="field-body">
    <div class="field">
      <div class="control">
        <textarea class="textarea 400" rows="14" id="board_content" name="board_content"></textarea>
      </div>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label">
    <!-- Left empty for spacing -->
  </div>
  <div class="field-body">
    <div class="field">
      <div class="control">
      <input type="hidden" value="${sessionScope.user_id }" id="user_id" name="user_id">
      <input type="hidden" value="${cri.pageNum }" id="pageNum">
      <input type="hidden" value="${cri.board_category }" id="board_category">
        <button type="button" class="button is-success is-outlined" onclick="regCheck()">
        <span class="icon is-small"><i class="fas fa-check"></i></span><span>등록하기</span></button>
         <button type="button" class="button is-danger is-outlined" onclick="location.href='category?board_category=${cri.board_category}&pageNum=${cri.pageNum }'">취소</button>
      </div>
    </div>
  </div>
</div>
</form>
</div>

<script type="text/javascript"> 
	function regCheck() {
			var s = document.getElementById("board_category");
			
			if (s.options[s.selectedIndex].value == '') {
				Swal.fire("게시판 카테고리를 선택해주세요","","warning");
				return;
			}else if($("#board_title").val().length < 1) {
				Swal.fire("제목을 입력해주세요","","warning");
				return;
			}else if ($("#board_content").val().length < 1) {
				Swal.fire("내용을 한 글자 이상 입력해주세요","","warning")
				return;
			} else  {
				Swal.fire({
					  title: '글을 등록하시겠습니까?',
					  icon: 'info',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '확인',
					  cancelButtonText: '취소'
					}).then((result) => {
					  if (result.isConfirmed) {
						  $("#writeForm").submit();
					  }
					})
				
			}	
	}
	
//if (confirm("게시물을 등록하시겠습니까?"))
</script>
</body>
</html>
