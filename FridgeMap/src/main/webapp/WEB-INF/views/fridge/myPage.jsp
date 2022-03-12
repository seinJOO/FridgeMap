<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/header.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <jsp:useBean id="today" class="java.util.Date" />

<!DOCTYPE html>
<html lang="ko">
<head>
 <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"> </script>
   <title>Home</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <link href="https://cdn.staticaly.com/gh/hung1001/font-awesome-pro/4cac1a6/css/all.css" rel="stylesheet"
        type="text/css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
   <style>
        .is-parent > .box {
            box-shadow: none;
           
        }
        .tile_footer {
        	box-shadow: none;
        }
     
        body{
            height: 864px;
            background-repeat: no-repeat;
            align-items:center;
           
        }
        
        }
        .title {
           	font-family: 'Gaegu', cursive;
            font-size: 40px;
        }
        .content {
         	font-family: 'Gaegu', cursive;
            font-size: 18px;

        }
        h1 {
        font-family: 'Gaegu', cursive;
            font-size: 40px;
        }
       
        li { 
            list-style: none;
           

        }
        @keyframes move{
        	0%{ transform:translate(0); }
        	20%{ transform:translate(-2px, 2px);}
        	40%{ transform:translate(-2px,-2px);}
        	60%{ transform:translate(2px,2px);}
        	80%{ transform:translate(2px,-2px);}
        	100%{ transform:translate(0);}
        }
        .fridge{
       		width:100px;
       		height:100px;
       		background:url("/resources/img/burgundy-fridge.png") center center / 100% no-repeat;
       		animation:move 0.3s linear infinite both;
       		border-radius: 10%;
        	
        }
        .fridge:hover{animation-play-state : paused;}
        
        .link {
        	color:red;
        }
        
   
    </style>
</head>
<body>

    <div class="container is-widescreen" style="margin: 30px auto;">
        <div class="tile is-ancestor" style="height: auto;" >
             <div class="tile is-8 is-vertical is-parent" style="width: 650px;">
                 <div class="tile is-child box "> 
                   <a href="fridgeMode"><img class="fridge" src="/resources/img/burgundy-fridge.png" alt="fridgeImage" style="height: 550px; width: 250px; margin-left: 290px; margin-top: 30px;"></a>     
                    <form action="fridgeDelete" name="delete" id="delete" method="post">
                   <button type="button" class="button is-ghost" onclick="deleteCheck('delete')"><i class="fa-solid fa-trash-can" style="font-size: 100px; color: black; margin-left: 130px; display: inline-block;"></i> </button>
                 </form>
                  </div>
                  <div class="tile is-child box" style="padding-top:0px;">
                   
                  </div>
                  
                </div>
                 <div class="tile" style="width:500px;">    	
                 <div class="tile_right is-horizon">     
                <div class="tile is-parent is-vertical" style="width: 300px;">
                      
                  <div class="tile is-child box" style="display: inline-block; height: 200px; padding-top:0px;">
                  
                    <h1 class="title" style="margin-bottom: 0px; ">소비기한 Top5</h1>
                    <div class="content">
                        <ul style="margin: 0px;">
                        	<c:forEach var="good" items= "${fridge_expdate}">
                        	 	<c:forEach var="food" items="${foodList}">
                        	 	 	<c:if test="${food.food_id eq good.food_id}">
                        	 	 		<c:set var="icon" value="${food.food_class}"></c:set>	
                        	 	 	</c:if>	
                        	 	</c:forEach> 
          								<fmt:parseNumber value="${today.getTime()/(1000*60*60*24)}" integerOnly="true" var="endDate" scope="request"/>
										<fmt:parseNumber value="${good.fridge_expdate.getTime()/(1000*60*60*24)}" integerOnly="true" var="strDate" scope="request"/>
                                        <c:set var="dday" value="${strDate - endDate}"></c:set>
                           			<li> 
		                           		<i class="${icon}"></i> 
		                           		${good.fridge_name} 
		                           		<c:choose> 
		                           			<c:when test="${dday == -1}"> D-Day!</c:when> 
		                           			<c:otherwise> D-${dday} </c:otherwise>
		                           		</c:choose> 
		                           		</li>
                          	</c:forEach>     
                        </ul>
                        <div class="expCheck" style="margin-left:55px;"> <a href="myFridge" class="link">소비기한 확인하러 하기&#8640;</a> </div>  
                    </div>
                  </div>
                  <div class="tile is-child box" style="margin-bottom: 0px; height: 200px; padding-top:0px;">
                    <h1 class="title" style="margin-bottom: 0px;">최근 지출</h1>
                    <div class="content">
                        <ul style="margin: 0px;">
                         <c:forEach var="good" items="${priceList}">
           	 				<li>
               	 	 		<c:set var="budget" value="${good.fridge_price}"></c:set> 
               	 	 		<c:set var="buydate" value="${good.fridge_purchase}"></c:set>
                       	 	<fmt:formatDate value="${good.fridge_purchase}" pattern="MM-dd"/>에 ${budget} 지출                     
                            </li>
                      	 	</c:forEach>
                        </ul> 
                         <div class="budgetCheck" style="margin-left:70px;"> <a href="##" class="link">가계부 확인하러 하기&#8640;</a> </div> 
                    </div>
                </div>
                  <div class="tile is-child box" style="padding-top:0px;">
                    <h1 class="title" style="margin-bottom: 0px;">게시판 활동</h1>
                    <div class="content">
                        <ul style="margin: 0px;">
                            <c:forEach var="good" items= "${alertList}">
                        	   <c:choose>
                        	   		<c:when test="${good.alert_type eq 'like' }">
                        	   			<li> 새로운 좋아요 알림이 있습니다. </li>          
                        	   		</c:when>
                        	   		<c:otherwise>
                        	   			<li> 새로운 댓글 알림이 있습니다. </li>   
                        	   		</c:otherwise>
                        	   </c:choose>    
                                          
                          	</c:forEach> 
                        </ul>  
                         <div class="boardCheck" style="margin-left:70px; color:red;"> <a href="##" class="link">게시판 확인하러 하기&#8640;</a> </div>
                    </div>
                  </div>
                </div>
                
                </div><img src="https://www.notion.so/cdn-cgi/image/format=auto,width=828,quality=100/front-static/pages/personal/people/swapna.png" alt="checkImage" style="width:180px; height: 390px; margin-top: 125px; margin-left:50px;">
                </div>
                
               </div>
             </div> 
         
       <%@include file="../include/footer.jsp" %> 
      
   <script type="text/javascript">
   		function deleteCheck() {
   			if (confirm("냉장고를 버리실껀가요?ㅠㅠ")){
   				$("#delete").attr("action","fridgeDelete");
   			 	$("#delete").submit();
   			}
   		}
   
   </script>   
</body>
</html>