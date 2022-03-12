<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<title>냉장고일지도</title>

<style>
.
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.main {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-image: url("/resources/img/main_img.png");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}

body::before {
	content: "";
	position: absolute;
	z-index: 1;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-color: rgba(0, 0, 0, .7);
}

.login-form {
	position: relative;
	z-index: 2;
}

.login-form h1 {
	font-size: 50px;
	color: white;
	text-align: center;
	font-family: 'Gaegu', cursive;
}

.int-area {
	width: 400px;
	position: relative;
	margin-top: 10px;
}

.int-area2 {
	width: 400px;
	position: relative;
	display: flex;
	margin-top: 10px;
}

#check {
	width: 70px;
}

.int-area:first-child {
	margin-top: 0;
}

.int-area input {
	width: 100%;
	padding: 20px 10px 10px;
	background-color: transparent;
	border: none;
	border-bottom: 2px solid white;
	font-size: 18px;
	color: white;
	outline: none;
	font-family: 'Gaegu', cursive;
}

.int-area label {
	position: absolute;
	left: 10px;
	top: 15px;
	font-size: 18px;
	color: #999;
	transition: all .5s ease;
	font-family: 'Gaegu', cursive;
	top: -2px;
	font-size: 13px;
	color: white;
	font-family: 'Gaegu', cursive;
}

.int-area2 input {
	width: 100%;
	padding: 20px 10px 10px;
	background-color: transparent;
	border: none;
	border-bottom: 2px solid white;
	font-size: 18px;
	color: #999;
	outline: none;
	font-family: 'Gaegu', cursive;
}

.int-area2 label {
	position: absolute;
	left: 10px;
	top: 15px;
	font-size: 18px;
	color: #999;
	transition: all .5s ease;
	font-family: 'Gaegu', cursive;
	top: -2px;
	font-size: 13px;
	color: white;
	font-family: 'Gaegu', cursive;
}

.int-area input:focus+label, .int-area input:valid+label {
	top: -2;
	font-size: 13px;
	color: white;
	font-family: 'Gaegu', cursive;
}

.int-area2 input:focus+label, .int-area2 input:valid+label {
	top: -2;
	font-size: 13px;
	color: white;
	font-family: 'Gaegu', cursive;
}

.btn-area {
	margin-top: 30px;
}

.btn-area button {
	width: 100%;
	height: 50px;
	background: black;
	color: #fff;
	font-size: 20px;
	border: none;
	border-radius: 25px;
	cursor: pointer;
	font-family: 'Gaegu', cursive;
	cursor: pointer;
}

.btn-area2 {
	margin-top: 10px;
}

.btn-area2 button {
	width: 100%;
	height: 50px;
	background-color: #999;
	color: white;
	font-size: 20px;
	border: none;
	border-radius: 25px;
	cursor: pointer;
	font-family: 'Gaegu', cursive;
	cursor: pointer;
}

.caption {
	margin-top: 20px;
	text-align: center;
	font-family: 'Gaegu', cursive;
}

.caption a {
	font-size: 20px;
	color: white;
	text-decoration: none;
	font-family: 'Gaegu', cursive;
}
</style>
</head>
<body class="body">
	<%@include file="../include/header.jsp"%>
	<div class="main">
		<section class="login-form">
			<h1>냉장고일지도</h1>
			<form action="updateInfoForm" method="post" id="updateInfoForm"
				name="updateInfoForm">
				<div class="int-area2">
					<input type="text" class="check1" id="user_id" name="user_id"
						value="${vo.user_id }" autocomplete="off" readonly> <label
						for="user_id">ID</label>
				</div>
				<div class="int-area2">
					<input type="text" class="check1" id="user_nick" name="user_nick"
						value="${vo.user_nick }" autocomplete="off" readonly> <label
						for="user_nick">NICKNAME</label>
				</div>
				<div class="int-area">
					<input type="password" id="user_pw" name="user_pw"
						value="${vo.user_pw }" autocomplete="off"> <label
						for="user_pw">PASSWORD</label>
				</div>
				<div class="int-area">
					<input type="password" id="user_pwCheck" name="user_pwCheck"
						value="${vo.user_pw }" autocomplete="off"> <label
						for="user_pwCheck">PASSWORD CHECK</label>
				</div>
				<div class="int-area">
					<input type="email" id="user_email" name="user_email"
						value="${vo.user_email }" autocomplete="off"> <label
						for="user_email">EMAIL</label>
				</div>
				<div class="btn-area">
					<button onclick="updateCheck(); return false;">수정하기</button>
				</div>
				<div class="btn-area2">
					<button onclick="deleteCheck(); return false;">회원탈퇴</button>
				</div>
			</form>
			<div class="caption">
				<a href="/user/info">취소</a>
			</div>
		</section>
	</div>
	<script>
function updateCheck() {
     if( $("#user_pw").val().length < 1) {
  	 	 Swal.fire({title:"비밀번호를 입력하세요"});
    	return;
    }else if( $("#user_pwCheck").val().length < 1) {
   		 Swal.fire("비밀번호를 입력하세요");
    	   return;	
    }else if( $("#user_pw").val() != $("#user_pwCheck").val()) {
   		 Swal.fire("비밀번호가 일치하지 않습니다");
     	$("#user_pwCheck").focus();
     	return;
	 }else if( $("#user_email").val().length < 1 ) {
		Swal.fire("이메일을 입력하세요");
	 	return;
	 } else if(emailCheck()){
		 Swal.fire("이메일 형식을 확인해주세요");
		 return;
	 }
		 
		 else {
		 Swal.fire({
			  title: '회원정보를 수정 하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네',
			  cancelButtonText: '아니오',
			}).then((result) => {
			  if (result.isConfirmed) {
				 document.updateInfoForm.submit();
			  }
			})
	 }
		
}
	
	
function deleteCheck() {
			Swal.fire({
			  title: '회원탈퇴 하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네',
			  cancelButtonText: '아니오',
			}).then((result) => {
			  if (result.isConfirmed) {
				 location.href="delete";
			  }
			})
	 }
			
function emailCheck() {		
	var user_email = document.getElementById("user_email").value;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(exptext.test(user_email)==false){
		return true;
	} else {
		return false;
	}
}


</script>

	<script>
	$(document).ready(
	function() {
		var msg = '${msg}';
		
		if (msg != '') {
			alert('${msg}');
		}		
	}
	)
	</script>



</body>
</html>