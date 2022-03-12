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
	color: white;
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
			<form action="joinForm" method="post" id="regForm" name="regForm">
				<div class="int-area2">
					<input type="text" class="check1" name="user_id" id="user_id"
						autocomplete="off"> <label for="user_id">ID</label> <input
						type="button" class="check2" value="CHECK" id="check"
						onclick="IdCheck();">
				</div>
				<div class="int-area2">
					<input type="text" class="check1" name="user_nick" id="user_nick"
						autocomplete="off"> <label for="user_nick">NICKNAME</label>
					<input type="button" class="check2" value="CHECK" id="check"
						onclick="NickCheck();">
				</div>
				<div class="int-area">
					<input type="password" name="user_pw" id="user_pw"
						autocomplete="off"> <label for="user_pw">PASSWORD</label>
				</div>
				<div class="int-area">
					<input type="password" name="user_pwCheck" id="user_pwCheck"
						autocomplete="off"> <label for="user_pwCheck">PASSWORD
						CHECK</label>
				</div>
				<div class="int-area">
					<input type="email" name="user_email" id="user_email"
						autocomplete="off"> <label for="user_email">EMAIL</label>
				</div>
				<div class="btn-area">
					<button onclick="joinCheck(); return false;">가입하기</button>
				</div>
			</form>
			<div class="caption">
				<a href="/">취소</a>
			</div>
		</section>
	</div>

	<script>
   
   function IdCheck() {
		var user_id = $("#user_id").val(); 
		var userId = {"user_id" : user_id};
		
		if(user_id.length < 4) {
			Swal.fire({text:"아이디는 2글자 이상 입력하세요"});
		} else {
			$.ajax({
				type : "post",
				url : "checkId",
				data : userId,
				error : function(request, error) {
					Swal.fire(error + "\n" + request.status);
				},
				success : function(result) { 			
					console.log("성공?실패?" + result);	
					if (result == 1) {
						Swal.fire({
						title: "이미 존재하는 아이디입니다",
						icon: "warning",
						});
					} else {
						Swal.fire({
							   title: "사용가능한 아이디 입니다",
							   icon: "success",
							 });
						 $("#user_id").attr("readonly", true);
					}			
				}
			}) 
		}
	}
   
   function NickCheck() {
		var user_nick = $("#user_nick").val();  
		var userNick = {"user_nick" : user_nick}; 
		
		if(user_nick.length < 2) {
			Swal.fire({text:"닉네임은 2글자 이상 입력하세요"});
		} else {
			$.ajax({
				type : "post",
				url : "checkNick",
				data : userNick,	
				error : function(request, error) {
					Swal.fire(error + "\n" + request.status); 
				},
				success : function(result) { 			
					console.log("성공?실패?" + result);
					if (result == 1) {
						Swal.fire({
						title: "이미 존재하는 닉네임입니다",
						icon: "warning",
						});
					} else {
						Swal.fire({
							   title: "사용가능한 닉네임 입니다",
							   icon: "success",
							 });
						 $("#user_nick").attr("readonly", true);
					}			
				}
			}) 
		}
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


   function joinCheck() {
   			 if( $("#user_id").val()=="") {
   				Swal.fire("아이디를 입력하세요");
    			return;
	         }else if( !$("#user_id").attr("readonly")) {
	        	 Swal.fire({title:"아이디 중복체크를 해야 합니다"});
	         	return;

       		 }else if( $("#user_nick").val()=="") {
       			Swal.fire({title:"닉네임을 입력하세요"});
	         	return;
	         }else if( !$("#user_nick").attr("readonly")) {
	        	 Swal.fire({title:"닉네임 중복체크를 해야 합니다"});
	         	return;
	         }else if( $("#user_pw").val().length < 1) {
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
	     	 }else if(emailCheck()){
	     		 Swal.fire("이메일 형식을 확인해주세요");
	     		 return;
	     	 }
	     	 
	     	 else {
   			Swal.fire({
   			  title: '회원가입 하시겠습니까?',
   			  icon: 'question',
   			  showCancelButton: true,
   			  confirmButtonColor: '#3085d6',
   			  cancelButtonColor: '#d33',
   			  confirmButtonText: '네',
   			  cancelButtonText: '아니오',
   			}).then((result) => {
   			  if (result.isConfirmed) {
   				 $("#regForm").submit();
   			  }
   			})
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