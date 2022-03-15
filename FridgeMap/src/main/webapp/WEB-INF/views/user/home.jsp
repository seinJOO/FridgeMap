<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" ></script>
 <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bungee+Shade&display=swap" rel="stylesheet">
<title>냉장고일지도</title>


<style>
   .* {margin:0; padding:0; box-sizing: border-box;}
   .body {
     font-family: 'Bungee Shade', cursive;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-image: url("/resources/img/main_img.png");
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
      text-align: center;
      
   }
    @keyframes anime_textup { 0% { top: 0; } 15% { top: -0.5rem; } 30% { top: 0 } 45% { top: 0 } 60% { top: 0 } 75% { top: 0 }  90% { top: 0 } }
 	
 	
 	.test_obj {
 		font-family: 'Bungee Shade', cursive;
 		
 	}

    .test_obj span {
    	
        position: relative;
        animation: anime_textup 1.5s infinite;
        font-family: 'Bungee Shade', cursive;
        font-size: 120px;
    }
 
    .test_obj span:nth-of-type(1) {
        animation-delay: .2s;
    }
 
    .test_obj span:nth-of-type(2) {
        animation-delay: .4s;
    }
 
    .test_obj span:nth-of-type(3) {
        animation-delay: .6s;
    }
 
    .test_obj span:nth-of-type(4) {
        animation-delay: .8s;
    }
 
    .test_obj span:nth-of-type(5) {
        animation-delay: 1.0s;
    }
    
        .test_obj span:nth-of-type(6) {
        animation-delay: 1.2s;
    }
    
    
        .test_obj span:nth-of-type(2) {
        animation-delay: .4s;
    }
    
    
        .test_obj span:nth-of-type(3) {
        animation-delay: .6s;
    }
    

</style>

</head>
<body class="body">
<%@include file="../include/header.jsp" %>
 
<div class="test_obj">
    <span style="color:green;">F</span>
    <span>R</span>
    <span>I</span>
    <span>D</span>
    <span>G</span>
    <span>E</span>
     <br>
    <span style="color:red;">M</span>
    <span>A</span>
    <span>P</span>
</div>

<%@include file="../include/footer.jsp" %>
</body>
</html>