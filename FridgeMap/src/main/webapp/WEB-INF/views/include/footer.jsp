<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"> </script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"> </script>
<title>Home</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script defer
	src="http://use.fontawesome.com/releases/v5.15.3/js/all.js">
     </script>
<script src="https://kit.fontawesome.com/2592a58b49.js"
	crossorigin="anonymous">   </script>
<script type="text/javascript"
	src="/node_modules/bulma-quickview/dist/bulma-quickview.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=display=swap"
	rel="stylesheet">
<title>Insert title here</title>
<style>
body {
	margin: 0;
}

.title {
	font-family: 'Gaegu', cursive;
	font-size: 40px;
	
}

.subtitle {
	font-family: 'Gaegu', cursive;
	font-size: 20px;
}

.hero {
	text-align: center;
}

input[id="menu"] {
	display: none;
}

input[id="menu"]+label {
	display: block;
	margin: 30px;
	width: 60px;
	height: 50px;
	position: relative;
	left: 0;
	top: calc(50% -25px);
	cursor: pointer;
	transition: all .35s;
}

input[id="menu"]+label span {
	display: block;
	border-radius: 30px;
	background: #000;
	width: 100%;
	height: 5px;
	position: absolute;
	top: calc(50% -25px);
	transition: all .35s;
}

input[id="menu"]+label span:nth-chilsd(1) {
	top: 0;
}

input[id="menu"]+label span:nth-chilsd(2) {
	top: 50%;
	transform: translateY(-50%);
}

input[id="menu"]+label span:nth-chilsd(3) {
	bottom: 0;
}

input[id="menu"]:checked+label {
	z-index: 0;
}

input[id="menu"]:checked+label span {
	background: #fff;
}

input[id="menu"]:checked+label span:nth-chilsd(1) {
	top: 50%;
	transform: translateY(-50%) rotate(45deg);
}

input[id="menu"]:checked+label span:nth-chilsd(2) {
	opacity: 0;
}

input[id="menu"]:checked+label span:nth-chilsd(3) {
	bottom: 50%;
	transform: translateY(50%) rotate(-45deg);
}

div[class="sidebar"] {
	width: 500px;
	height: 100%;
	background-color: rgba(0, 0, 0, 0);
	position: fixed;
	top: 0;
	left: -500px;
	z-index: 1;
	transition: all .35s;
}

input[id="menu"]:checked+label+div {
	left: 0;
}

.sidebar {
	color: black;
}

.sidebar_menu {
	font-family: 'Gaegu', cursive;
	font-size: 43px;
	height: 100%;
	text-align:center;
	display: flex;
	justify-content: center; 
	align-items: center;
	bold:700px;
}


tr {
	height:150px;

}
table a {
	color:black;
}


</style>
</head>
<body>


	<div style="position: fixed; bottom: 0; height:150px; width:100%; ">
		<div style="height:80px; width:100%;">	
			<div style="width:20%; float:left;">
				<input type="checkbox" id="menu">
				 <label for="menu">
				 <span></span>
				 <span></span>
				 <span></span>
			</label>
				<div class="sidebar">
				<div
					style="background-color: white; width: 450px; height: 100%; float: left;">
					<table class="sidebar_menu">
						<tr>
							<td style="width:225px;"><a href="/fridge/myPage">마이페이지</a></td>
							<td style="width:225px;"><a href="/fridge/myFridge">마이냉장고</a></td>
							

						</tr>
						<tr>
							<td><a href="/board/##">게시판</a></td>
							<td><a href="/budget/##">가계부</a></td>
						</tr>
						<tr>
							<td><a href="/user/##">내정보</a></td>
							<td>
							<a href="/">로그아웃</a>
						
							</td>
						</tr>

					</table>

				</div>
				<div
					style="background-color: rgba(0, 0, 0, 0); height: 100%; display: flex; justify-content: center; align-items: center;">
					<button class="button is-ghost" onclick="unchecked()">
						<i class="far fa-times-circle fa-2x" style="color: black;"></i>
					</button>
				</div>
			</div>
			</div>
			<div style="width:60%; float:left; text-align:center;">
				<p class="title" style="font-size: 60px;">FridgeMap</p>
			</div>
			
			<div style="width:20%; float:left;">
				
			</div>
		</div>
		<div style="height:70px; width:100%; clear:both; ">
			<div style="width:20%; float:left; color:white;">ddddddd</div>
			
			<div style="width:60%; float:left; text-align:center;">
				 <p> 
      <strong>FridgeMap</strong> by <a href="https://jgthms.com">codingKing</a>. The source code is licensed
      <a href="http://opensource.org/licenses/mit-license.php">MIT</a>. The website content
      is licensed <a href="http://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY NC SA 4.0</a>.
    </p>
			</div>
			
			<div style="width:20%; float:left;"></div>
		</div>
	</div>

 
	<script>
	var quickviews = bulmaQuickview.attach(); // quickviews now contains an array of all Quickview instances
		
	function unchecked() {
		$("#menu").removeAttr("checked");
		
	}
	</script>
</body>

</html>