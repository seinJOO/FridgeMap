<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="util" class="com.zerock.fridge.util.MyFridgeUtil" scope="page" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <link href="https://cdn.staticaly.com/gh/hung1001/font-awesome-pro/4cac1a6/css/all.css" rel="stylesheet"
        type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/fridge.css?ver=1.3" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-tooltip@3.0.2/dist/css/bulma-tooltip.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
    <div class="tile is-ancestor">
        <div class="tile is-4 is-parent">
            <div class="tile is-child box notification">
                <p class="title gg">냉장Go 기상청</p>
                <div class="box" style="width: 380px;">
                    <span class="title gg">오늘의 냉장고 날씨는? </span>
                    <c:choose>
                        <c:when test="${expdateOverCount < 5}">
                            <span><i class="fas fa-sun fa-2x" style="color: yellow;"></i></span>
                        </c:when>
                        <c:when test="${expdateOverCount < 10}">
                            <span><i class="fas fa-cloud fa-2x" style="color: grey;"></i></span>
                        </c:when>
                        <c:otherwise>
                            <span><i class="fas fa-cloud-showers fa-2x"></i></span>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
        <div class="tile is-4 is-parent buttons">
            <button class="button is-link view" id="fridgeModeButton" onclick="location.href='/fridge/fridgeMode';"
                data-tooltip="냉장고뷰">
                <i class="fas fa-refrigerator fa-2x"></i>
            </button>
            <button class="button is-link view" id="listModeButton" onclick="location.href='listMode?val=all';"
                data-tooltip="리스트뷰">
                <i class="fas fa-table fa-2x"></i>
            </button>
            <button class="button is-success view" onclick="viewInsertModal();" data-tooltip="추가하기">
                <i class="fas fa-plus-circle fa-2x"></i>
            </button>
            <button class="button is-black view" id="deleteExpdateOverBTN" onclick="deleteExpdateOverItems();"
                data-tooltip="정리하기">
                <i class="fas fa-vacuum fa-2x"></i>
            </button>
        </div>
        <div class="tile is-parent">
            <table class="table is-bordered tableView" height="20px" align="center">
                <tr height="10px">
                    <td class="is-success" width="80px" style="text-align: center; font-weight: bold;">신선</td>
                    <td class="is-warning" width="80px" style="text-align: center; font-weight: bold;">보통</td>
                    <td class="is-danger" width="80px" style="text-align: center; font-weight: bold;">위험</td>
                    <td class="is-dark" width="80px" style="text-align: center; font-weight: bold;">꾀꼬닥</td>
                </tr>
                <tr height="10px">
                    <td style="text-align: center;">${expdateCount.green}</td>
                    <td style="text-align: center;">${expdateCount.yellow}</td>
                    <td style="text-align: center;">${expdateCount.red}</td>
                    <td style="text-align: center;">${expdateCount.black}</td>
                </tr>
            </table>
        </div>
    </div>

    <hr style="border: 1px solid #ccc;">

    <div class="modal" id="insertModal">
        <div class="modal-background"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">추가</p>
                <button class="delete" id="closeinserttop" aria-label="close"></button>
            </header>
            <section class="modal-card-body">
                <article class="message is-success">
                    <nav class="message-header breadcrumb is-centered">
                        <ul>
                            <li><a onclick="getCategory('과일')">과일</a></li>
                            <li><a onclick="getCategory('기타')">기타</a></li>
                            <li><a onclick="getCategory('수산물')">수산물</a></li>
                            <li><a onclick="getCategory('양념')">양념</a></li>
                            <li><a onclick="getCategory('유제품')">유제품</a></li>
                            <li><a onclick="getCategory('육류')">육류</a></li>
                            <li><a onclick="getCategory('인스턴트')">인스턴트</a></li>
                            <li><a onclick="getCategory('조미료')">조미료</a></li>
                            <li><a onclick="getCategory('채소')">채소</a></li>
                        </ul>
                    </nav>
                    <div class="message-body" id="categoryList" style="height: 200px; overflow-y: scroll;">
                        <!-- ajax return -->
                    </div>
                </article>
                <form class="box" action="insertItem" method="post" id="regForm">
                    <input type="hidden" id="fridge_id" name="food_id">
                    <div class="field">
                        <label class="label">카테고리</label> <span class="control"> <input class="input" type="text"
                                id="fridge_category" name="fridge_category" readonly>
                        </span>
                    </div>
                    <div class="field">
                        <label class="label">이름</label>
                        <div class="control">
                            <input class="input" type="text" id="fridge_name" name="fridge_name">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">수량</label>
                        <div class="control">
                            <input class="input" type="text" id="fridge_quantity" name="fridge_quantity">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">보관장소</label>
                        <div class="control">
                            <div class="select">
                                <select name="fridge_keep">
                                    <option value="냉동">냉동</option>
                                    <option value="냉장">냉장</option>
                                    <option value="실온">실온</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">구매일</label>
                        <div class="control">
                            <input class="input" type="text" id="fridge_purchase" name="fridge_purchase"
                                value="${util.now()}">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">소비기한</label>
                        <div class="control">
                            <input class="input" type="text" id="fridge_expdate" name="fridge_expdate">
                        </div>
                        <p class="help">오늘 날짜 이후로 입력해주세요</p>
                    </div>
                    <div class="field">
                        <label class="label">가격</label>
                        <div class="control">
                            <input class="input" type="text" id="fridge_price" name="fridge_price">
                        </div>
                    </div>
                </form>
            </section>
            <footer class="modal-card-foot">
                <button class="button is-info" onclick="insertItem();" data-tooltip="확인">
                    <i class="fas fa-check fa-lg"></i>
                </button>
                <button class="button is-danger" id="closeinsertbtn" data-tooltip="닫기">
                    <i class="fas fa-times fa-lg"></i>
                </button>
            </footer>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            var uri = window.location.pathname;
            var msg = "${msg}";
            var icon = "${icon}";
            var expdate = "${expdateOverCount}";

            if (uri == "/fridge/fridgeMode") {
                $("#fridgeModeButton").attr("disabled", "disabled");
            } else {
                $("#listModeButton").attr("disabled", "disabled");
            }

            if (msg != "") {
                Swal.fire({
                    title: msg,
                    icon: icon,
                    confirmButtonText: '확인'
                })
            }

            if (expdate == "0") {
                $("#deleteExpdateOverBTN").attr("disabled", "disabled");
            }
        });

        function viewInsertModal() {
            $("#insertModal").addClass("is-active");

            $(".modal-close").click(function () {
                $("#insertModal").removeClass("is-active");
            });

            $("#closeinsertbtn").click(function () {
                $("#insertModal").removeClass("is-active");
            });

            $("#closeinserttop").click(function () {
                $("#insertModal").removeClass("is-active");
            });
        }

        function getCategory(category) {
            $.ajax({
                type: "post",
                url: "getCategory",
                data: { "category": category },
                success: function (result) {
                    var html = jQuery("<div>").html(result);
                    var contents = html.find("div#indexListAjax").html();
                    $("#categoryList").html(contents);
                }
            });
        }

        function inputValue(id) {
            let date = new Date();
            $.ajax({
                type: "post",
                url: "getFoodItem",
                data: { "id": id },
                success: function (result) {
                    date.setDate(date.getDate() + result.food_expdate);
                    $("#fridge_id").attr("value", result.food_id);
                    if (result.food_id.split("_")[1] != "none") {
                        $("#fridge_name").attr("readonly", true);
                    } else {
                        $("#fridge_name").removeAttr("readonly");
                    }
                    $("#fridge_category").attr("value", result.food_category);
                    $("#fridge_name").attr("value", result.food_name);
                    $("#fridge_expdate").attr("value", date.toISOString().slice(0, 10));
                }
            });
        }

        function insertItem() {
            let today = new Date();

            if ($("#fridge_quantity").val() == "") {
                Swal.fire({
                    title: '수량을 입력해주세요!',
                    icon: 'warning',
                    confirmButtonText: '확인'
                })
                return;
            } else if ($("#fridge_purchase").val() == "") {
                Swal.fire({
                    title: '구매일을 입력해주세요!',
                    icon: 'warning',
                    confirmButtonText: '확인'
                })
                return;
            } else if ($("#fridge_expdate").val() == "") {
                Swal.fire({
                    title: '소비기한을 입력해주세요!',
                    icon: 'warning',
                    confirmButtonText: '확인'
                })
                return;
            } else if ($("#fridge_price").val() == "") {
                Swal.fire({
                    title: '가격을 입력해주세요!',
                    icon: 'warning',
                    confirmButtonText: '확인'
                })
                return;
            } else if (new Date($("#fridge_expdate").val()).toLocaleDateString() < today.toLocaleDateString()) {
                Swal.fire({
                    title: '소비기한을 확인해주세요!',
                    icon: 'warning',
                    confirmButtonText: '확인'
                })
                return;
            }
            $("#regForm").submit();
        }

        function deleteExpdateOverItems() {
            Swal.fire({
                title: '꾀꼬닥 정리하실 건가요?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '네!',
                cancelButtonText: '아뇨...'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "deleteExpdateOverItems";
                }
            })
        }
    </script>
</body>

</html>