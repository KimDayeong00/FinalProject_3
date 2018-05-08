<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var array = ["2018-05-20", "2018-05-26"];
	$(document).ready(function(){
		//달력 플러그인
		flatpickr.localize(flatpickr.l10ns.ko); //언어 한글화
		flatpickr("#calendar");
		var selector = $("#calendar").flatpickr({
			dateFormat : "Y-m-d",
			inline : true,
			mode : "multiple",
			conjunction : ",",
			minDate : "today",
			maxDate : new Date().fp_incr(90),
			defaultDate: array
		});
	});
</script>
<div class="sitterPageContent">
	<div class="petsitterPageMenu">
		<div class="sitterImg">
			<img>
		</div>
		<div class="reservationList">
			<span><a href="<c:url value='/mypetsitter?page=list&dtld=reservation'/>">예약 관리</a></span>
		</div>	
		
		<div class="order">
			<span><a href="<c:url value='/mypage/order'/>">주문목록/배송조회</a></span>
		</div>	
		
		<div class="petsitterInfoManage">
			<span><a href="<c:url value='/mypetsitter?page=sitterInfo'/>">펫시터 정보 관리</a></span>
		</div>
		<div class="petInfoManage">
			<span><a href="<c:url value='/mypetsitter?page=sitterInfo'/>">반려견 정보 관리</a></span>
		</div>
		<div class="accountManage">
			<span><a href="<c:url value='/mypetsitter?page=sitterInfo'/>">계정 정보 수정</a></span>
		</div>
	</div>
	<div class='mypetsitterContent'>
	<!-- 예약관리 -->
		<c:choose>
			<c:when test="${page eq 'list' }">
				<div class='mypageMenubar'>
					<div class="menubarDiv"><span><a href="<c:url value='/mypetsitter?page=list&dtld=reservation'/>">받은 예약 내역</a></span></div>
					<div class="menubarDiv"><span><a href="<c:url value='/mypetsitter?page=list&dtld=reservationSet'/>">예약 불가 날짜 설정</a></span></div>
				</div>
					<div class="reservationInfo">
						<c:choose>
							<c:when test="${dtld eq 'reservation' }">
								<div>??</div>
							</c:when>
							<c:otherwise>
								<p>날짜 설정</p>
								<input type="hidden" id="calendar">
							</c:otherwise>
						</c:choose>
					</div>
			</c:when>
		</c:choose>
		<!-- 펫시터 정보 관리 -->
		<c:if test="${page eq 'sitterInfo' }">
			<div>
				
			</div>
		</c:if>
	</div>
</div>