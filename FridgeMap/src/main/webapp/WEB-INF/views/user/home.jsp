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
   .body {
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
     .button is-large {
      width: 400px;
      position: relative;
      margin-top: 20px;
   }
   .button is-large input {
      width: 100%;
      padding: 20px 10px 10px;
      background-color: transparent;
      border: none;
      border-bottom: 2px solid white;
      font-size: 18px; color: white;
      outline: none;
      font-family: 'Gaegu', cursive;
   }

</style>
</head>
<body class="body">
<%@include file="../include/header.jsp" %>

	<div class="tile is-parent">
		<article class="tile is-child box">

			<h3>${sessionScope.user_id }님 로그인을 환영합니다</h3>
	        <button class="button is-large" value="정보보기" onclick="location.href='info'">정보보기</button>
			<button class="button is-large" value="로그아웃" onclick="location.href='logout'">로그아웃</button>
			<button class="button is-large" value="냉장고 포럼" onclick="location.href=''">냉장고 포럼</button>
			<button class="button is-large" value="마이냉장고" onclick="location.href=''">마이냉장고</button>
			<button class="button is-large" value="게시판" onclick="location.href=''">게시판</button>
			<button class="button is-large" value="가계부" onclick="location.href=''">가계부</button>
        </article>
	</div>




</body>
</html>