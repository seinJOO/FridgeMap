<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
    <div class="container is-widescreen" style="margin: 20px auto;">
        <%@include file="fridgeHeader.jsp" %>
            <div class="tile is-ancestor" style="margin-top: 30px;">
                <div class="tile is-4 is-parent buttons">
                    <button class="button is-black" id="allList" onclick="changeTable('all')">
                        <span>전체</span>
                    </button>
                    <button class="button is-link" id="frozenList" onclick="changeTable('frozen')">
                        <span>냉동</span>
                    </button>
                    <button class="button is-info" id="refriList" onclick="changeTable('refri')">
                        <span>냉장</span>
                    </button>
                    <button class="button is-success" id="roomList" onclick="changeTable('room')">
                        <span>실온</span>
                    </button>
                </div>
                <div class="tile is-4 is-parent" style="text-align: center;">
                    <h2 class="title is-2 gg">
                        <c:choose>
                            <c:when test="${param.searchVal == null}">
                                <c:choose>
                                    <c:when test="${param.val == 'all'}">전체</c:when>
                                    <c:when test="${param.val == 'frozen'}">냉동</c:when>
                                    <c:when test="${param.val == 'refri'}">냉장</c:when>
                                    <c:when test="${param.val == 'room'}">실온</c:when>
                                </c:choose>
                                 - ${count}개 보관중!
                            </c:when>
                            <c:otherwise>검색결과 - ${count}개</c:otherwise>
                        </c:choose>
                    </h2>
                </div>
                <div class="tile is-3 is-parent">
                    <form action="searchItems" name="searchForm" method="get">
                        <input type="hidden" value="${param.val}" name="val">
                        <div class="field has-addons">
                            <div class="control select">
                                <select name="searchOption">
                                    <option value="category">카테고리</option>
                                    <option value="name">이름</option>
                                </select>
                            </div>
                            <div class="control">
                                <input class="input" type="text" name="searchVal">
                            </div>
                            <div class="control">
                                <input type="submit" class="button is-info" value="찾기">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div style="overflow-y:scroll; height : 550px">
                <table class="table is-hoverable is-fullwidth listViewTable">
                    <thead>
                        <tr>
                            <th>카테고리</th>
                            <th>이름</th>
                            <th>수량</th>
                            <th>보관방법</th>
                            <th>구매일</th>
                            <th>사용기한</th>
                            <th>가격</th>
                            <th>추천레시피</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 반복문!! -->
                        <c:forEach var="list" items="${list}">
                            <tr>
                                <td>${list.fridge_category}</td>
                                <td><a onclick="viewDetailModal(${list.fridge_num})">${list.fridge_name}</a></td>
                                <td>${list.fridge_quantity}</td>
                                <td>${list.fridge_keep}</td>
                                <td>${list.fridge_purchase}</td>
                                <td>${list.fridge_expdate}</td>
                                <td>${list.fridge_price}</td>
                                <td>
                                    <button class="button"
                                        onclick="window.open('https://www.youtube.com/results?search_query=${list.fridge_name}+레시피')">
                                        <span class="icon is-small"> <i class="fas fa-video"></i>
                                        </span> <span>냉장고뿌시기</span>
                                    </button>
                                </td>
                            </tr>
                            <div class="modal" id="detailModal${list.fridge_num}">
                                <div class="modal-background"></div>
                                <div class="modal-card">
                                    <header class="modal-card-head">
                                        <p class="modal-card-title">상세정보</p>
                                        <button class="delete" id="closedetailtop${list.fridge_num}"
                                            aria-label="close"></button>
                                    </header>
                                    <section class="modal-card-body">
                                        <div>
                                            <div class="field">
                                                <label class="label">카테고리</label> <span class="control">
                                                    <input class="input" type="text" value="${list.fridge_category}"
                                                        readonly>
                                                </span>
                                            </div>
                                            <div class="field">
                                                <label class="label">이름</label>
                                                <div class="control">
                                                    <input class="input" type="text" value="${list.fridge_name}"
                                                        readonly>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label class="label">수량</label>
                                                <div class="control">
                                                    <input class="input" type="text" value="${list.fridge_quantity}"
                                                        readonly>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label class="label">보관장소</label>
                                                <div class="control">
                                                    <input class="input" type="text" value="${list.fridge_keep}"
                                                        readonly>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label class="label">구매일</label>
                                                <div class="control">
                                                    <input class="input" type="text" value="${list.fridge_purchase}"
                                                        readonly>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label class="label">소비기한</label>
                                                <div class="control">
                                                    <input class="input" type="text" value="${list.fridge_expdate}"
                                                        readonly>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label class="label">가격</label>
                                                <div class="control">
                                                    <input class="input" type="text" value="${list.fridge_price}"
                                                        readonly>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <footer class="modal-card-foot">
                                        <button class="button is-info" onclick="viewUpdateModal(${list.fridge_num})"
                                            data-tooltip="수정">
                                            <i class="fas fa-edit fa-lg"></i>
                                        </button>
                                        <button class="button is-warning" onclick="deleteItem(${list.fridge_num})"
                                            data-tooltip="삭제">
                                            <i class="fas fa-trash fa-lg"></i>
                                        </button>
                                        <button class="button is-danger" id="closedetailbtn${list.fridge_num}"
                                            data-tooltip="닫기">
                                            <i class="fas fa-times fa-lg"></i>
                                        </button>
                                    </footer>
                                </div>
                            </div>
                            <div class="modal" id="updateModal${list.fridge_num}">
                                <div class="modal-background"></div>
                                <div class="modal-card">
                                    <header class="modal-card-head">
                                        <p class="modal-card-title">수정</p>
                                        <button class="delete" id="closeupdatetop${list.fridge_num}"
                                            aria-label="close"></button>
                                    </header>
                                    <section class="modal-card-body">
                                        <form action="updateItem" id="updateForm${list.fridge_num}" method="post">
                                        	<div class="field">
                                        		<div class="control">
                                        			<input type="hidden" name="fridge_num" value="${list.fridge_num}">
                                        		</div>
                                        	</div>
                                            <div class="field">
                                                <label class="label">카테고리</label> 
                                                <div class="control">
                                                    <input class="input is-danger" name="fridge_category" type="text"
                                                        value="${list.fridge_category}" readonly>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label class="label">이름</label>
                                                <div class="control">
                                                    <input class="input is-danger" name="fridge_name" type="text"
                                                        value="${list.fridge_name}" readonly>
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label class="label">수량</label>
                                                <div class="control">
                                                    <input class="input" type="text" name="fridge_quantity"
                                                        value="${list.fridge_quantity}">
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label class="label">보관장소</label>
                                                <div class="control">
                                                    <input class="input" type="text" name="fridge_keep"
                                                        value="${list.fridge_keep}">
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label class="label">구매일</label>
                                                <div class="control">
                                                    <input class="input" type="text" name="fridge_purchase"
                                                        value="${list.fridge_purchase}">
                                                </div>
                                            </div>
                                            <div class="field">
                                                <label class="label">소비기한</label>
                                                <div class="control">
                                                    <input class="input" type="text" name="fridge_expdate" id="fridge_expdate${list.fridge_num}" 
                                                    value="${list.fridge_expdate}">
                                                </div>
                                                <p class="help">오늘날짜 이후로 입력해주세요</p>
                                            </div>
                                            <div class="field">
                                                <label class="label">가격</label>
                                                <div class="control">
                                                    <input class="input" type="text" name="fridge_price"
                                                        value="${list.fridge_price}">
                                                </div>
                                            </div>
                                        </form>
                                    </section>
                                    <footer class="modal-card-foot">
                                        <button class="button is-info" onclick="updateItem(${list.fridge_num})"
                                            data-tooltip="확인">
                                            <i class="fas fa-check fa-lg"></i>
                                        </button>
                                        <button class="button is-danger" id="closeupdatebtn${list.fridge_num}"
                                            data-tooltip="닫기">
                                            <i class="fas fa-times fa-lg"></i>
                                        </button>
                                    </footer>
                                </div>
                            </div>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
    </div>
    <script type="text/javascript">
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
            return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        $(document).ready(function () {
            var val = getParameterByName("val");

            if (val == "all") {
                $("#allList").attr("disabled", "disabled");

            } else if (val == "frozen") {
                $("#frozenList").attr("disabled", "disabled");

            } else if (val == "refri") {
                $("#refriList").attr("disabled", "disabled");

            } else if (val == "room") {
                $("#roomList").attr("disabled", "disabled");
            }

        });

        function changeTable(value) {
            location.href = "listMode?val=" + value;
        }

        function viewDetailModal(num) {
            $("#detailModal" + num).addClass("is-active");

            $(".modal-close").click(function () {
                $("#detailModal" + num).removeClass("is-active");
            });

            $("#closedetailbtn" + num).click(function () {
                $("#detailModal" + num).removeClass("is-active");
            });

            $("#closedetailtop" + num).click(function () {
                $("#detailModal" + num).removeClass("is-active");
            });
        }

        function viewUpdateModal(num) {
            $("#detailModal" + num).removeClass("is-active");
            $("#updateModal" + num).addClass("is-active");

            $(".modal-close").click(function () {
                $("#updateModal" + num).removeClass("is-active");
            });

            $("#closeupdatebtn" + num).click(function () {
                $("#updateModal" + num).removeClass("is-active");
                location.href = "listMode?val=all";
            });

            $("#closeupdatetop" + num).click(function () {
                $("#updateModal" + num).removeClass("is-active");
                location.href = "listMode?val=all";
            });
        }

        function deleteItem(num) {
            Swal.fire({
                title: '정말로 삭제하실 건가요?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '네!',
                cancelButtonText: '아뇨...'
            }).then((result) => {
                if (result.isConfirmed) {
                    $("#detailModal" + num).removeClass("is-active");
                    $("#updateModal" + num).removeClass("is-active");

                    location.href = "deleteItem?num=" + num;
                }
            })
        }

        function updateItem(num) {
        	let today = new Date();
        	
        	if (new Date($("#fridge_expdate").val()).toLocaleDateString() < today.toLocaleDateString()) {
                Swal.fire({
                    title: '소비기한을 확인해주세요!',
                    icon: 'warning',
                    confirmButtonText: '확인'
                })
            } else {
            	Swal.fire({
                    title: '정말로 수정하실 건가요?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '네!',
                    cancelButtonText: '아뇨...'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $("#updateForm" + num).submit();
                    }
                })
            }
        }
    </script>
</body>

</html>