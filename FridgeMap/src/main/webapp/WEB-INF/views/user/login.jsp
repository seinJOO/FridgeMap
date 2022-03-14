<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&display=swap" rel="stylesheet">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" ></script>
   <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	

   <title>냉장고일지도</title>
   
<style>
   .* {margin:0; padding:0; box-sizing: border-box;}
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
      content:"";
      position: absolute; z-index: 1;
      top: 0; right: 0; bottom: 0; left: 0;
      background-color: rgba(0,0,0,.7);
   }
   .login-form {position: relative; z-index: 2;}
   .login-form h1 {
      font-size: 50px; color: white;
      text-align: center;
      font-family: 'Gaegu', cursive;
   }
   .int-area {
      width: 400px;
      position: relative;
      margin-top: 20px;
   }
   .int-area:first-child {margin-top: 0;}
   .int-area input {
      width: 100%;
      padding: 20px 10px 10px;
      background-color: transparent;
      border: none;
      border-bottom: 2px solid white;
      font-size: 18px; color: white;
      outline: none;
      font-family: 'Gaegu', cursive;
   }
   .int-area label {
      position: absolute; left: 10px; top: 15px;
      font-size: 18px; color:#999;
      transition: all .5s ease;
      font-family: 'Gaegu', cursive;
   }
   
   .int-area input:focus + label,
   .int-area input:valid + label {
      top: 0;    
      font-size: 13px; color: white;
      font-family: 'Gaegu', cursive;
   
   }
   .btn-area {margin-top: 30px;}
   .btn-area button {
      width: 100%; height: 50px;
      background: black;
      color: #fff;
      font-size: 20px;
      border: none;
      border-radius: 25px; 
      font-family: 'Gaegu', cursive;
      cursor: pointer;
   }
   
   .caption {
      margin-top: 20px;
      text-align: center;
      font-family: 'Gaegu', cursive;
   }
   .caption a {
      font-size: 20px; color: white;
      text-decoration: none;
      font-family: 'Gaegu', cursive;
   }
</style>
</head>
<body class="body">

<%@include file="../include/header.jsp" %>

   <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<div class="main">
   <section class="login-form">
      <h1>냉장고일지도</h1>
      <form action="/user/loginForm" method="post" name="loginForm" id="loginForm"> 
         <div class="int-area">
            <input type="text" name="user_id" id="user_id"
            autocomplete="off">
            <label for="id">ID</label>
         </div>
         <div class="int-area">
            <input type="password" name="user_pw" id="user_pw"
            autocomplete="off">
            <label for="pw">PASSWORD</label>
         </div>
         <div class="btn-area">
            <button onclick="loginCheck(); return false;">로그인</button>
         </div>
      </form>
      <div class="caption">
         <a href="user/join">회원가입</a>
      </div>
   </section>
</div>

<script>
function loginCheck() {
	if( $("#user_id").val().length < 1) {
		Swal.fire({title:"아이디를 입력하세요"});
		return;
	}else if( $("#user_pw").val().length < 1) {
		Swal.fire({title:"비밀번호를 입력하세요"});
		return;
	}else {
		$("#loginForm").submit();
		return;
	}
}
</script>

<script>
$(document).ready(function(){
   var msg = '${msg}';
   
   if(msg != '') {
	   Swal.fire(msg);
   }
});
</script>
</body>
</html>