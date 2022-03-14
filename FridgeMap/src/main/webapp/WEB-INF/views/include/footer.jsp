<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link href="https://cdn.staticaly.com/gh/hung1001/font-awesome-pro/4cac1a6/css/all.css" rel="stylesheet"
    type="text/css" />
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<style>
    .sidenav {
        height: 100%;
        width: 0;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        background-color: white;
        overflow-x: hidden;
        transition: 0.5s;
        padding-top: 60px;
        color: black;
        font-size: 20px; 
   		font-family: 'Gaegu', cursive;
    }

    .sidenav a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 25px;
        color: #818181;
        transition: 0.3s;
    }

    .sidenav a:hover {
        color: #f1f1f1;
    }

    .sidenav .closebtn {
        position: absolute;
        top: 0;
        right: 10px;
        font-size: 36px;
        margin-left: 50px;
    }

    @media screen and (max-height: 450px) {
        .sidenav {
            padding-top: 15px;
        }

        .sidenav a {
            font-size: 18px;
        }
    }

    .float {
        position: fixed;
        width: 60px;
        height: 60px;
        bottom: 40px;
        left: 40px;
        border-radius: 50px;
        text-align: center;
        box-shadow: 2px 2px 3px #999;
        display: table;
        background-color: black;
        text-decoration: none;
        cursor: pointer;
    }

    .floatIcon {
        display: table-cell;
        vertical-align: middle;
        text-decoration: none;
        color: white;
    }
</style>

<a href="#" class="float" onclick="openNav();">
    <i class="fas fa-bars fa-2x floatIcon"></i>
</a>

<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">
        <i class="fas fa-times"></i>
    </a>
    <div style="height: 10%;">
        <table align="center">
            <tr>
                <td style="text-align: center;">
                    <a href="/user/home" style="text-align: center;">
                        <i class="fas fa-home fa-2x"></i>
                    </a>
                </td>
            </tr>
        </table>
        
    </div>
    <hr>
    <div style="height: 50%;">
        
        <table align="center">
            <tr>
                <td style="height: 120px;">
                    <a href="/fridge/myPage">마이페이지</a>
                </td>
            </tr>
            <tr>
                <td style="height: 120px;">
                    <a href="/fridge/fridgeMode">마이냉장고</a>
                </td>
            </tr>
            <tr>
                <td style="height: 120px;">
                    <a href="/board/main">게시판</a>
                </td>
            </tr>
            <tr>
                <td style="height: 120px;">
                    <a href="/budget/main">가계부</a>
                </td>
            </tr>
        </table>
        
    </div>
    <hr>
    <div>
        <table align="center">
            <tr>
                <td>
                    <a href="/user/info">내정보</a>
                </td>
                <td>
                    <a href="/user/logout">로그아웃</a>
                </td>
            </tr>
        </table>
        <hr>
    </div>
</div>

<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "400px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }
</script>