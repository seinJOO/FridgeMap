<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container is-widescreen" style="margin: 20px auto;">
    <%@include file="fridgeHeader.jsp" %>
    <%@ include file="../include/footer.jsp" %>
        <div class="tile is-ancestor">
            <div class="tile is-8 is-vertical is-parent">
            
            	<!--------------------------------------- 냉동 --------------------------------------->
                <div class="tile is-child box notification is-success is-light frozen">
                    <p class="title gg"><i class="fas fa-igloo" style="color:skyblue;"></i> 냉동 - ${frozenListCount}개
                        보관중!</p>
                    <div class="box">
                        <div class="columns is-multiline">
                            <!-- 반복문 들어갈 자리 한줄에 7개 그다음 br 2개-->
                            <c:forEach var="FridgeVO" items="${frozenList}" varStatus="status">
                                <c:forEach var="FoodVO" items="${foodList}">
                                    <c:if test="${FridgeVO.food_id eq FoodVO.food_id}">
                                        <c:set var="frozenIcon" value="${FoodVO.food_class}" scope="page" />
                                    </c:if>
                                </c:forEach>
                                <div class="column is-2">
                                    <span style="position: relative; padding: 0 20px;">
                                        <button class="button is-large" id="launchModal"
                                            onclick="viewDetailModal(${FridgeVO.fridge_num})"
                                            data-tooltip="${FridgeVO.fridge_name}">
                                            <span class="icon">
                                                <i class="${frozenIcon} fa-2x"></i>
                                            </span>
                                        </button>
                                        <c:choose>
                                            <c:when test="${util.d_day(FridgeVO.fridge_expdate) < 0}">
                                                <span class="tag is-black dDay" id="dDay">꾀꼬닥</span>
                                            </c:when>
                                            <c:when test="${util.d_day(FridgeVO.fridge_expdate) == 0}">
                                                <span class="tag is-danger dDay" id="dDay">D-Day</span>
                                            </c:when>
                                            <c:when test="${util.d_day(FridgeVO.fridge_expdate) <= 3}">
                                                <span class="tag is-warning dDay"
                                                    id="dDay">D-${util.d_day(FridgeVO.fridge_expdate)}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="tag is-success dDay"
                                                    id="dDay">D-${util.d_day(FridgeVO.fridge_expdate)}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="modal" id="detailModal${FridgeVO.fridge_num}">
                                    <div class="modal-background"></div>
                                    <div class="modal-card">
                                        <header class="modal-card-head">
                                            <p class="modal-card-title"><i class="${frozenIcon} fa-lg"></i> 상세정보</p>
                                            <button class="delete" id="closedetailtop${FridgeVO.fridge_num}"
                                                aria-label="close"></button>
                                        </header>
                                        <section class="modal-card-body">
                                            <form class="box">
                                                <div class="field">
                                                    <label class="label">카테고리</label>
                                                    <span class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_category}" readonly>
                                                    </span>
                                                </div>
                                                <div class="field">
                                                    <label class="label">이름</label>
                                                    <div class="control">
                                                        <input class="input" type="text" value="${FridgeVO.fridge_name}"
                                                            readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">수량</label>
                                                    <div class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_quantity}" readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">보관장소</label>
                                                    <div class="control">
                                                        <input class="input" type="text" value="${FridgeVO.fridge_keep}"
                                                            readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">구매일</label>
                                                    <div class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_purchase}" readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">소비기한</label>
                                                    <div class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_expdate}" readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">가격</label>
                                                    <div class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_price}" readonly>
                                                    </div>
                                                </div>
                                            </form>
                                        </section>
                                        <footer class="modal-card-foot">
                                            <button class="button is-info"
                                                onclick="viewUpdateModal(${FridgeVO.fridge_num})" data-tooltip="수정">
                                                <i class="fas fa-edit fa-lg"></i>
                                            </button>
                                            <button class="button is-warning"
                                                onclick="deleteItem(${FridgeVO.fridge_num})" data-tooltip="삭제">
                                                <i class="fas fa-trash fa-lg"></i>
                                            </button>
                                            <button class="button is-danger" id="closedetailbtn${FridgeVO.fridge_num}"
                                                data-tooltip="닫기">
                                                <i class="fas fa-times fa-lg"></i>
                                            </button>
                                        </footer>
                                    </div>
                                </div>
                                <div class="modal" id="updateModal${FridgeVO.fridge_num}">
                                    <div class="modal-background"></div>
                                    <div class="modal-card">
                                        <header class="modal-card-head">
                                            <p class="modal-card-title"><i class="${frozenIcon} fa-lg"></i> 수정</p>
                                            <button class="delete" id="closeupdatetop${FridgeVO.fridge_num}"
                                                aria-label="close"></button>
                                        </header>
                                        <section class="modal-card-body">
                                            <form class="box" action="updateItem" id="updateForm${FridgeVO.fridge_num}"
                                                method="post">
                                                <input type="hidden" name="fridge_num" value="${FridgeVO.fridge_num}">
                                                <div class="field">
                                                    <label class="label">카테고리</label>
                                                    <span class="control">
                                                        <input class="input is-danger" name="fridge_category"
                                                            type="text" value="${FridgeVO.fridge_category}" readonly>
                                                    </span>
                                                </div>
                                                <div class="field">
                                                    <label class="label">이름</label>
                                                    <div class="control">
                                                        <input class="input is-danger" name="fridge_name" type="text"
                                                            value="${FridgeVO.fridge_name}" readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">수량</label>
                                                    <div class="control">
                                                        <input class="input" type="text" name="fridge_quantity"
                                                            value="${FridgeVO.fridge_quantity}">
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">보관장소</label>
                                                    <div class="control">
                                                        <input class="input" type="text" name="fridge_keep"
                                                            value="${FridgeVO.fridge_keep}">
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">구매일</label>
                                                    <div class="control">
                                                        <input class="input" type="text" name="fridge_purchase"
                                                            value="${FridgeVO.fridge_purchase}">
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">소비기한</label>
                                                    <div class="control">
                                                        <input class="input" id="fridge_expdate${FridgeVO.fridge_num}" type="text" name="fridge_expdate"
                                                            value="${FridgeVO.fridge_expdate}">
                                                    </div>
                                                    <p class="help">오늘날짜 이후로 입력해주세요</p>
                                                </div>
                                                <div class="field">
                                                    <label class="label">가격</label>
                                                    <div class="control">
                                                        <input class="input" type="text" name="fridge_price"
                                                            value="${FridgeVO.fridge_price}">
                                                    </div>
                                                </div>
                                            </form>
                                        </section>
                                        <footer class="modal-card-foot">
                                            <button class="button is-info" onclick="updateItem(${FridgeVO.fridge_num})"
                                                data-tooltip="확인">
                                                <i class="fas fa-check fa-lg"></i>
                                            </button>
                                            <button class="button is-danger" id="closeupdatebtn${FridgeVO.fridge_num}"
                                                data-tooltip="닫기">
                                                <i class="fas fa-times fa-lg"></i>
                                            </button>
                                        </footer>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                
                <!--------------------------------------- 냉장 --------------------------------------->
                
                <div class="tile is-child box notification is-success is-light refri">
                    <p class="title gg"><i class="fas fa-wind" style="color:grey;"></i> 냉장 - ${refriListCount}개 보관중!</p>
                    <div class="box">
                        <div class="columns is-multiline">
                            <!-- 반복문 들어갈 자리 한줄에 7개 그다음 br 2개-->
                            <c:forEach var="FridgeVO" items="${refriList}" varStatus="status">
                                <c:forEach var="FoodVO" items="${foodList}">
                                    <c:if test="${FridgeVO.food_id eq FoodVO.food_id}">
                                        <c:set var="refriIcon" value="${FoodVO.food_class}" scope="page" />
                                    </c:if>
                                </c:forEach>
                                <div class="column is-2">
                                    <span style="position: relative; padding: 0 20px;">
                                        <button class="button is-large" id="launchModal"
                                            onclick="viewDetailModal(${FridgeVO.fridge_num})"
                                            data-tooltip="${FridgeVO.fridge_name}">
                                            <span class="icon">
                                                <i class="${refriIcon} fa-2x"></i>
                                            </span>
                                        </button>
                                        <c:choose>
                                            <c:when test="${util.d_day(FridgeVO.fridge_expdate) < 0}">
                                                <span class="tag is-black dDay" id="dDay">꾀꼬닥</span>
                                            </c:when>
                                            <c:when test="${util.d_day(FridgeVO.fridge_expdate) == 0}">
                                                <span class="tag is-danger dDay" id="dDay">D-Day</span>
                                            </c:when>
                                            <c:when test="${util.d_day(FridgeVO.fridge_expdate) <= 3}">
                                                <span class="tag is-warning dDay"
                                                    id="dDay">D-${util.d_day(FridgeVO.fridge_expdate)}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="tag is-success dDay"
                                                    id="dDay">D-${util.d_day(FridgeVO.fridge_expdate)}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="modal" id="detailModal${FridgeVO.fridge_num}">
                                    <div class="modal-background"></div>
                                    <div class="modal-card">
                                        <header class="modal-card-head">
                                            <p class="modal-card-title"><i class="${refriIcon} fa-lg"></i> 상세정보</p>
                                            <button class="delete" id="closedetailtop${FridgeVO.fridge_num}"
                                                aria-label="close"></button>
                                        </header>
                                        <section class="modal-card-body">
                                            <form class="box">
                                                <div class="field">
                                                    <label class="label">카테고리</label>
                                                    <span class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_category}" readonly>
                                                    </span>
                                                </div>
                                                <div class="field">
                                                    <label class="label">이름</label>
                                                    <div class="control">
                                                        <input class="input" type="text" value="${FridgeVO.fridge_name}"
                                                            readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">수량</label>
                                                    <div class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_quantity}" readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">보관장소</label>
                                                    <div class="control">
                                                        <input class="input" type="text" value="${FridgeVO.fridge_keep}"
                                                            readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">구매일</label>
                                                    <div class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_purchase}" readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">소비기한</label>
                                                    <div class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_expdate}" readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">가격</label>
                                                    <div class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_price}" readonly>
                                                    </div>
                                                </div>
                                            </form>
                                        </section>
                                        <footer class="modal-card-foot">
                                            <button class="button is-info"
                                                onclick="viewUpdateModal(${FridgeVO.fridge_num})" data-tooltip="수정">
                                                <i class="fas fa-edit fa-lg"></i>
                                            </button>
                                            <button class="button is-warning"
                                                onclick="deleteItem(${FridgeVO.fridge_num})" data-tooltip="삭제">
                                                <i class="fas fa-trash fa-lg"></i>
                                            </button>
                                            <button class="button is-danger" id="closedetailbtn${FridgeVO.fridge_num}"
                                                data-tooltip="닫기">
                                                <i class="fas fa-times fa-lg"></i>
                                            </button>
                                        </footer>
                                    </div>
                                </div>
                                <div class="modal" id="updateModal${FridgeVO.fridge_num}">
                                    <div class="modal-background"></div>
                                    <div class="modal-card">
                                        <header class="modal-card-head">
                                            <p class="modal-card-title"><i class="${refriIcon} fa-lg"></i> 수정</p>
                                            <button class="delete" id="closeupdatetop${FridgeVO.fridge_num}"
                                                aria-label="close"></button>
                                        </header>
                                        <section class="modal-card-body">
                                            <form class="box" action="updateItem" id="updateForm${FridgeVO.fridge_num}"
                                                method="post">
                                                <input type="hidden" name="fridge_num" value="${FridgeVO.fridge_num}">
                                                <div class="field">
                                                    <label class="label">카테고리</label>
                                                    <span class="control">
                                                        <input class="input is-danger" name="fridge_category"
                                                            type="text" value="${FridgeVO.fridge_category}" readonly>
                                                    </span>
                                                </div>
                                                <div class="field">
                                                    <label class="label">이름</label>
                                                    <div class="control">
                                                        <input class="input is-danger" name="fridge_name" type="text"
                                                            value="${FridgeVO.fridge_name}" readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">수량</label>
                                                    <div class="control">
                                                        <input class="input" type="text" name="fridge_quantity"
                                                            value="${FridgeVO.fridge_quantity}">
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">보관장소</label>
                                                    <div class="control">
                                                        <input class="input" type="text" name="fridge_keep"
                                                            value="${FridgeVO.fridge_keep}">
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">구매일</label>
                                                    <div class="control">
                                                        <input class="input" type="text" name="fridge_purchase"
                                                            value="${FridgeVO.fridge_purchase}">
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">소비기한</label>
                                                    <div class="control">
                                                        <input class="input" id="fridge_expdate${FridgeVO.fridge_num}" type="text" name="fridge_expdate"
                                                            value="${FridgeVO.fridge_expdate}">
                                                    </div>
                                                    <p class="help">오늘날짜 이후로 입력해주세요</p>
                                                </div>
                                                <div class="field">
                                                    <label class="label">가격</label>
                                                    <div class="control">
                                                        <input class="input" type="text" name="fridge_price"
                                                            value="${FridgeVO.fridge_price}">
                                                    </div>
                                                </div>
                                            </form>
                                        </section>
                                        <footer class="modal-card-foot">
                                            <button class="button is-info" onclick="updateItem(${FridgeVO.fridge_num})"
                                                data-tooltip="확인">
                                                <i class="fas fa-check fa-lg"></i>
                                            </button>
                                            <button class="button is-danger" id="closeupdatebtn${FridgeVO.fridge_num}"
                                                data-tooltip="닫기">
                                                <i class="fas fa-times fa-lg"></i>
                                            </button>
                                        </footer>
                                    </div>
                                </div>
                                <c:if test="${status.count == 7 or status.count == 14}">
                                    <br><br>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            
            <!--------------------------------------- 실온 --------------------------------------->
            
            <div class="tile is-parent">
                <div class="tile is-child box notification room">
                    <p class="title gg"><i class="fas fa-thermometer-half" style="color:red;"></i> 실온 -
                        ${roomListCount}개 보관중!</p>
                    <div class="box">
                        <div class="columns is-multiline">
                            <!-- 반복문 들어갈 자리 한줄에 3개 그다음 br 2개-->
                            <c:forEach var="FridgeVO" items="${roomList}" varStatus="status">
                                <c:forEach var="FoodVO" items="${foodList}">
                                    <c:if test="${FridgeVO.food_id eq FoodVO.food_id}">
                                        <c:set var="roomIcon" value="${FoodVO.food_class}" scope="page" />
                                    </c:if>
                                </c:forEach>
                                <div class="column is-4">
                                    <span style="position: relative; padding: 0 20px;">
                                        <button class="button is-large" id="launchModal"
                                            onclick="viewDetailModal(${FridgeVO.fridge_num})"
                                            data-tooltip="${FridgeVO.fridge_name}">
                                            <span class="icon">
                                                <i class="${roomIcon} fa-2x"></i>
                                            </span>
                                        </button>
                                        <c:choose>
                                            <c:when test="${util.d_day(FridgeVO.fridge_expdate) < 0}">
                                                <span class="tag is-black dDay" id="dDay">꾀꼬닥</span>
                                            </c:when>
                                            <c:when test="${util.d_day(FridgeVO.fridge_expdate) == 0}">
                                                <span class="tag is-danger dDay" id="dDay">D-Day</span>
                                            </c:when>
                                            <c:when test="${util.d_day(FridgeVO.fridge_expdate) <= 3}">
                                                <span class="tag is-warning dDay"
                                                    id="dDay">D-${util.d_day(FridgeVO.fridge_expdate)}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="tag is-success dDay"
                                                    id="dDay">D-${util.d_day(FridgeVO.fridge_expdate)}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="modal" id="detailModal${FridgeVO.fridge_num}">
                                    <div class="modal-background"></div>
                                    <div class="modal-card">
                                        <header class="modal-card-head">
                                            <p class="modal-card-title"><i class="${roomIcon} fa-lg"></i> 상세정보</p>
                                            <button class="delete" id="closedetailtop${FridgeVO.fridge_num}"
                                                aria-label="close"></button>
                                        </header>
                                        <section class="modal-card-body">
                                            <form class="box">
                                                <div class="field">
                                                    <label class="label">카테고리</label>
                                                    <span class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_category}" readonly>
                                                    </span>
                                                </div>
                                                <div class="field">
                                                    <label class="label">이름</label>
                                                    <div class="control">
                                                        <input class="input" type="text" value="${FridgeVO.fridge_name}"
                                                            readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">수량</label>
                                                    <div class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_quantity}" readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">보관장소</label>
                                                    <div class="control">
                                                        <input class="input" type="text" value="${FridgeVO.fridge_keep}"
                                                            readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">구매일</label>
                                                    <div class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_purchase}" readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">소비기한</label>
                                                    <div class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_expdate}" readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">가격</label>
                                                    <div class="control">
                                                        <input class="input" type="text"
                                                            value="${FridgeVO.fridge_price}" readonly>
                                                    </div>
                                                </div>
                                            </form>
                                        </section>
                                        <footer class="modal-card-foot">
                                            <button class="button is-info"
                                                onclick="viewUpdateModal(${FridgeVO.fridge_num})" data-tooltip="수정">
                                                <i class="fas fa-edit fa-lg"></i>
                                            </button>
                                            <button class="button is-warning"
                                                onclick="deleteItem(${FridgeVO.fridge_num})" data-tooltip="삭제">
                                                <i class="fas fa-trash fa-lg"></i>
                                            </button>
                                            <button class="button is-danger" id="closedetailbtn${FridgeVO.fridge_num}"
                                                data-tooltip="닫기">
                                                <i class="fas fa-times fa-lg"></i>
                                            </button>
                                        </footer>
                                    </div>
                                </div>
                                <div class="modal" id="updateModal${FridgeVO.fridge_num}">
                                    <div class="modal-background"></div>
                                    <div class="modal-card">
                                        <header class="modal-card-head">
                                            <p class="modal-card-title"><i class="${roomIcon} fa-lg"></i> 수정</p>
                                            <button class="delete" id="closeupdatetop${FridgeVO.fridge_num}"
                                                aria-label="close"></button>
                                        </header>
                                        <section class="modal-card-body">
                                            <form class="box" action="updateItem" id="updateForm${FridgeVO.fridge_num}"
                                                method="post">
                                                <input type="hidden" name="fridge_num" value="${FridgeVO.fridge_num}">
                                                <div class="field">
                                                    <label class="label">카테고리</label>
                                                    <span class="control">
                                                        <input class="input is-danger" name="fridge_category"
                                                            type="text" value="${FridgeVO.fridge_category}" readonly>
                                                    </span>
                                                </div>
                                                <div class="field">
                                                    <label class="label">이름</label>
                                                    <div class="control">
                                                        <input class="input is-danger" name="fridge_name" type="text"
                                                            value="${FridgeVO.fridge_name}" readonly>
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">수량</label>
                                                    <div class="control">
                                                        <input class="input" type="text" name="fridge_quantity"
                                                            value="${FridgeVO.fridge_quantity}">
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">보관장소</label>
                                                    <div class="control">
                                                        <input class="input" type="text" name="fridge_keep"
                                                            value="${FridgeVO.fridge_keep}">
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">구매일</label>
                                                    <div class="control">
                                                        <input class="input" type="text" name="fridge_purchase"
                                                            value="${FridgeVO.fridge_purchase}">
                                                    </div>
                                                </div>
                                                <div class="field">
                                                    <label class="label">소비기한</label>
                                                    <div class="control">
                                                        <input class="input" id="fridge_expdate${FridgeVO.fridge_num}" type="text" name="fridge_expdate"
                                                            value="${FridgeVO.fridge_expdate}">
                                                    </div>
                                                    <p class="help">오늘날짜 이후로 입력해주세요</p>
                                                </div>
                                                <div class="field">
                                                    <label class="label">가격</label>
                                                    <div class="control">
                                                        <input class="input" type="text" name="fridge_price"
                                                            value="${FridgeVO.fridge_price}">
                                                    </div>
                                                </div>
                                            </form>
                                        </section>
                                        <footer class="modal-card-foot">
                                            <button class="button is-info" onclick="updateItem(${FridgeVO.fridge_num})"
                                                data-tooltip="확인">
                                                <i class="fas fa-check fa-lg"></i>
                                            </button>
                                            <button class="button is-danger" id="closeupdatebtn${FridgeVO.fridge_num}"
                                                data-tooltip="닫기">
                                                <i class="fas fa-times fa-lg"></i>
                                            </button>
                                        </footer>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<script>
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
            location.href = "fridgeMode";
        });

        $("#closeupdatetop" + num).click(function () {
            $("#updateModal" + num).removeClass("is-active");
            location.href = "fridgeMode";
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