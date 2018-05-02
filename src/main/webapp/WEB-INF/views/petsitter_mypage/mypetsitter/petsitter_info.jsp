<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var disdayList = new Array();
	var disdateList = new Array();
	<c:forEach items="${disableList}" var="list">
		disdayList.push("${list.disday}");
		disdateList.push("${list.disDate}");
	</c:forEach>
	
	var disdate = new Array();
	var disday = new Array();
	
	for(var i=0;i<disdateList.length;i++){
		disdate = disdateList[i].split(",");
		disday = disdayList[i].split(",");
	}
	$(document).ready(function(){
		
		//요일 설정 불러오기
		$('input:checkbox[name="dayCheck"]').each(function(){
			for(var k=0;k<disday.length;k++){
				if(disday[k]==this.value){
					this.checked=true;
				}
			}
		});
		

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
			defaultDate: disdate
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
							<c:when test="${dtld eq 'reservationSet' }">
								<form action="<c:url value='/disableSet'/>" method="post">
								<p>날짜 설정</p>
								<input type="hidden" id="calendar" name="disdate"><br>
								<p>요일 설정</p>
								<input type="checkbox" name="dayCheck" id="sun" value="0">일
								<input type="checkbox" name="dayCheck" id="mon" value="1">월
								<input type="checkbox" name="dayCheck" id="tue" value="2">화
								<input type="checkbox" name="dayCheck" id="wed" value="3">수
								<input type="checkbox" name="dayCheck" id="thu" value="4">목
								<input type="checkbox" name="dayCheck" id="fri" value="5">금
								<input type="checkbox" name="dayCheck" id="sat" value="6">토<br>
								<button type="submit" class="modifyBtn">
									<label>설정하기</label>
								</button>
								</form>
							</c:when>
						</c:choose>
					</div>
			</c:when>
		</c:choose>
		<!-- 펫시터 정보 관리 -->
			<c:choose>
			<c:when test="${page eq 'sitterInfo' }">
				<div class='mypageMenubar'>
					<div class="menubarDiv"><span><a href="<c:url value='/mypetsitter?page=sitterInfo&dtld=psInfoSet'/>">펫시터 환경 정보 설정</a></span></div>
					<div class="menubarDiv"><span><a href="<c:url value='/mypetsitter?page=sitterInfo&dtld=filterSet'/>">검색 필터 정보 설정</a></span></div>
				</div>
					<div class="reservationInfo">
						<c:choose>
							<c:when test="${dtld eq 'reservation' }">
								<div>??</div>
							</c:when>
							<c:when test="${dtld eq 'reservationSet' }">
								<form action="<c:url value='/disableSet'/>" method="post">
								<p>날짜 설정</p>
								<input type="hidden" id="calendar" name="disdate"><br>
								<p>요일 설정</p>
								<input type="checkbox" name="dayCheck" id="sun" value="0">일
								<input type="checkbox" name="dayCheck" id="mon" value="1">월
								<input type="checkbox" name="dayCheck" id="tue" value="2">화
								<input type="checkbox" name="dayCheck" id="wed" value="3">수
								<input type="checkbox" name="dayCheck" id="thu" value="4">목
								<input type="checkbox" name="dayCheck" id="fri" value="5">금
								<input type="checkbox" name="dayCheck" id="sat" value="6">토<br>
								<button type="submit" class="modifyBtn">
									<label>설정하기</label>
								</button>
								</form>
							</c:when>
						</c:choose>
					</div>
			</c:when>
		</c:choose>
		</c:if>
	</div>
</div>