<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
	
	<style>


	<%-- 메인 이미지 --%>
	.main-img {
        width: 100%;
        height: 100vh;
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
    }
    .bulma-hamburger-mixin {
 		@include hamburger(2.5rem);
	}

      </style>
</head>
<body>
	<div class="main">
		<img class="main-img" src="/resources/img/background-image.jpg"> <!-- 메인 이미지 -->
	</div>
		<button class="bulma-hamburger-mixin">
  			<span></span>
  			<span></span>
 			<span></span>
 		</button>	


</body>
</html>

