<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sitterPageContent">
	<div class="petsitterPageMenu">
		<div class="sitterImg">
			<img>
		</div>
		<div class="reservationList">
			<span><a href="<c:url value='/mypetsitter?page=list'/>">받은 예약 내역</a></span>
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
	
	<!-- 받은 예약 내역 -->
	<c:if test="${page eq 'list' }">
		<div>
			예약 리스트
		</div>
	</c:if>
	
	<!-- 펫시터 정보 관리 -->
	<c:if test="${page eq 'sitterInfo' }">
		<div>
			
		</div>
	</c:if>
</div>