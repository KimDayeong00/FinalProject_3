<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
var aaa;
function reviewInsert(ps_email,bk_num){
	//var email = ps_email;
	//var num = bk_num;
	aaa = window.open("<c:url value='/reviewInsert?ps_email=" + ps_email +"&bk_num="+ bk_num +"'/>","_blank","width=600px,height=500px");
	
}

</script>
<div class="sitterPageContent">
	<div class="petsitterPageMenu">
		<div class="sitterImg">
			<img>
		</div>
		<div class="reservationList">
			<span><a href="<c:url value='/mypage?page=top&dtld=reservation'/>">예약 관리</a></span>
		</div>	
		<div class="petsitterInfoManage">
			<span><a href="<c:url value='/mypageShop'/>">구매 관리</a></span>
		</div>
		<div class="petInfoManage">
			<span><a href="<c:url value='/myPetInfo?page=petInfo&dtld=petList'/>">반려견 정보 관리</a></span>
		</div>
		<div class="accountManage">
			<span><a href="<c:url value='/my_account?page=account&dtld=accountUpdate'/>">계정 정보 수정</a></span>
		</div>
	</div>
	<div class='mypetsitterContent'>
		<div class='mypageMenubar'>
			<div class="menubarDiv"><span><a href="<c:url value='/mypage?page=top&dtld=reservation'/>">예약 중인 내역</a></span></div>
			<div class="menubarDiv"><span><a href="<c:url value='/mypagePrevlist?page=top&dtld=prevReservation'/>">이전 예약 내역</a></span></div>
		</div>
		
		<div class="reservationInfo">
			<c:choose>
				<c:when test="${dtld eq 'reservation'}">
					<div class="">
						<table class="bookTable">
							<tr style="border-bottom:1px solid gray;">
								<th>돌봄 시작 날짜</th><th>돌봄 끝 날짜</th><th>돌보미 상세</th><th>맡기는 반려견</th>
							</tr>
							
								<c:forEach var="mlist" items="${mbookList }">
									<tr>
										<td>${mlist.bk_startdate }</td>
										<td>${mlist.bk_enddate }</td>
										<td><a href="<c:url value='/detail?ps_email=${mlist.ps_email }'/>">${mlist.ps_name }</a></td>
										<c:choose>
											<c:when test="${mlist.count>1 }">
												<td>${mlist.pi_name } 외 ${mlist.count-1 }마리</td>
											</c:when>
											<c:otherwise>
												<td>${mlist.pi_name }</td>	
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
						</table>
					</div>
				</c:when>
				<c:when test="${dtld eq 'prevReservation' }">
					<div class="">
						<table class="bookTable">
							<tr style="border-bottom:1px solid gray;">
								<th>돌봄 시작 날짜</th><th>돌봄 끝 날짜</th><th>돌보미 상세</th><th>맡긴 반려견</th><th>리뷰</th>
							</tr>
								<c:forEach var="plist" items="${prevList }">
									<tr>
										<td>${plist.bk_startdate }</td>
										<td>${plist.bk_enddate }</td>
										<td><a href="<c:url value='/detail?ps_email=${plist.ps_email }'/>">${plist.ps_name }</a></td>
										<c:choose>
											<c:when test="${plist.count>1 }">
												<td>${plist.pi_name } 외 ${plist.count-1 }마리</td>
											</c:when>
											<c:otherwise>
												<td>${plist.pi_name }</td>	
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${plist.bk_review eq 0}">
												<td>
													<a href="javascript:void(0);" onclick="reviewInsert('${plist.ps_email}','${plist.bk_num }');">리뷰 작성하기</a>
												</td>
											</c:when>
											<c:otherwise>
												<td>
													리뷰 작성 완료
												</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
						</table>
					</div>
				</c:when>
			</c:choose>
			
		</div>
	</div>
</div>