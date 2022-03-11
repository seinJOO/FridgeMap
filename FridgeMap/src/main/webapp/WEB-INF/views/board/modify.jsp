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
<link rel="stylesheet" href="/resources/css/board.css">
<link href="https://cdn.staticaly.com/gh/hung1001/font-awesome-pro/4cac1a6/css/all.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-latest.js"></script> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
	<h1 class="title has-text-centered has-text-success 700">글 수정하기</h1>
	<h2 class="subtitle has-text-centered 400">	자유롭게 이야기를 나눠보세요 ! </h2>
	
<form action="modiForm" id="modiForm" name="modiForm" method="post">	  
<div class="field is-horizontal">
  <div class="field-label is-normal"> <label class="label">카테고리</label></div>
  	<div class="field-body">
    <div class="field is-narrow">
      <div class="control">
        <div class="select is-fullwidth 400">
          <select id="board_category" name="board_category">
            <option value="vers" ${board.board_category eq 'vers' ? 'selected' : ''} >자랑매치</option>
            <option value="tips" ${board.board_category eq 'tips' ? 'selected' : ''}>꿀팁줍줍</option>
            <option value="qna" ${board.board_category eq 'qna' ? 'selected' : ''}>우리끼리Q&amp;A</option>
          </select>
        </div>
      </div>
    </div>
  </div>
</div>
  <div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label 700">닉네임</label>
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
    <label class="label">제목</label>
  </div>
  <div class="field-body">
    <div class="field">
      <div class="control">
        <input class="input" type="text" id="board_title" name="board_title" value="${board.board_title }">
      </div>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">내용</label>
  </div>
  <div class="field-body">
    <div class="field">
     <div class="control">
    <textarea id="summernote" name="board_content">${board.board_content }</textarea>
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
      <input type="hidden" value="${cri.pageNum }" id="pageNum" name="pageNum">
      <input type="hidden" value="${board.board_num}" id="board_num" name="board_num">
        <button type="button" class="button is-success is-outlined" onclick="modifyCheck()">
        <span class="icon is-small"><i class="fas fa-check"></i></span><span>수정하기</span></button>
        <button type="button" class="button is-danger is-outlined" onclick="deleteCheck('${board.board_num}')">
        <span class="icon is-small"><i class="fas fa-trash-alt"></i></span><span>삭제하기</span></button>
         <button type="button" class="button is-outlined" onclick="cancel()">취소</button>
      </div>
    </div>
  </div>
</div>
</form>
</div>
<c:set var="paging" value="${cri.board_category }" />
<script>
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 500,                 // 에디터 높이
		  minHeight: 150,             // 최소 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",				// 한글 설정
        	callbacks: {	//여기 부분이 이미지를 첨부하는 부분
    		onImageUpload : function(files,editor, welEditable) {
    			for (var i = 0; i < files.length; i++) {
    				sendFile(files[i], this);
    			}
          	}
	}
	});	
});

function sendFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	console.log(file);
	$.ajax({
		data : data,
		type : "post",
		url : "uploadImageFile",
		contentType : false,
		processData : false,
		enctype : 'multipart/form-data',
		success : function(data) {
			console.log(data);
			console.log(editor);
        	//항상 업로드된 파일의 url이 있어야 한다.
			$(editor).summernote('editor.insertImage', data.url);
        	console.log(data.url);
        	
		}
	});
}

function modifyCheck() {
		
	if($("#board_title").val().length < 1) {
		Swal.fire("제목을 입력해주세요!","","warning");
		return;
	} else {		
		Swal.fire({
			  title: '글을 수정하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '확인',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.isConfirmed) {
				  $("#modiForm").submit();
			  }
			})
	}
}

function cancel() {
	var paging = '<c:out value="${paging}"/>';
	var form = document.createElement("form");
    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post");  //Post 방식
    form.setAttribute("action", "viewContent"); //요청 보낼 주소

    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "board_category");
    hiddenField.setAttribute("value", paging);
    form.appendChild(hiddenField);

    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "pageNum");
    hiddenField.setAttribute("value", $("#pageNum").val());
    form.appendChild(hiddenField);
    
    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "board_num");
    hiddenField.setAttribute("value", $("#board_num").val());
    form.appendChild(hiddenField);
    document.body.appendChild(form);
    form.submit();
}


function deleteCheck(board_num) {
	
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

</script>
</body>
</html>