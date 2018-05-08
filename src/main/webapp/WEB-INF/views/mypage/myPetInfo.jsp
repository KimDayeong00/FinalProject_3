<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<c:choose>
			<c:when test="${page eq 'petInfo' }">
				<c:choose>
					<c:when test="${dtld eq 'petList' }">
					<div style="border-top:1px solid gray;">
						<c:if test="${null ne ppetList}">
								<c:forEach var="vo3" items="${petList }">
								<div class="ppetInfo">
									<div class="ppetImg"><img src="<c:url value='/resources/images/${vo3.pi_savefilename }'/>"></div>
									<div class="ppetInfoName">
										<span>${vo3.pi_name }</span><br>
										<span>(${vo3.pi_type },${vo3.pi_sex },${vo3.pi_age }살)</span><br>
										<span><a href="<c:url value='/petInfoUpdate?page=petInfo&dtld=petUpdate&pi_num=${vo3.pi_num }'/>">수정하기</a></span>
									</div>
								</div>
								</c:forEach>
						</c:if>
					</div>
					<div>
						<a href="<c:url value='/petInfo?page=petInfo&dtld=petInsert'/>">+반려견 추가하기</a>
					</div>
					</c:when>
					<c:when test="${dtld eq 'petInsert' }">
						<div class="petInsert">
							<div class="petInsertContent">
								<form method="post" action="<c:url value='petInfo'/>">
								<div class="queBox">
									<span class="que">Q.현재 반려동물을 키우고 있습니까?</span><br>
									<input type="radio" name="pi_gubun" value="1" checked="checked">현재 키우고 있음<br>
									<input type="radio" name="pi_gubun" value="0">현재 키우고 있지 않지만 키운 적이 있음<br>
								</div>
								<div class="queBox">
									<div class="ppetImgBox"><img id="ppetImg"></div>
									<div><input type="text" placeholder="이름" name="pi_name"></div>
									<div><select name="pi_sex">
										<option>성별</option>
										<option value="남">수컷</option>
										<option value="여">암컷</option>
									</select></div>
									<div><input type="text" placeholder="품종" name="pi_type"></div>
									<div><input type="text" placeholder="무게" name="pi_weight"></div>
									<div>
									<select name="pi_year">
										<c:forEach var="i" begin="1980" end="${year }">
											<option value="${i}">${i }</option>
										</c:forEach>
									</select></div>
									<div>
										<select name="pi_month">
											<c:forEach var="i" begin="1" end="12">
												<option value="${i}">${i }</option>
											</c:forEach>
										</select>
									</div>
									<div>
									<textarea rows="10" cols="50" name="pi_content"></textarea>
									</div>
									<button type="submit" class="modifyBtn">
										<label>설정하기</label>
									</button>
								</div>
								</form>
							</div>
						</div>
					</c:when>
					<c:when test="${dtld eq 'petUpdate' }">
						<div class="petInsert">
							<div class="petInsertContent">
								<form method="post" action="<c:url value='petInfoUpdate'/>">
								<div class="queBox">
									<span class="que">Q.현재 반려동물을 키우고 있습니까?</span><br>
									<input type="radio" name="pi_gubun" value="1">현재 키우고 있음<br>
									<input type="radio" name="pi_gubun" value="0">현재 키우고 있지 않지만 키운 적이 있음<br>
								</div>
								<div class="queBox">
									<div class="ppetImgBox"><img id="ppetImg"></div>
									<div><input type="text" placeholder="이름" name="pi_name" value="${ppetInfo.pi_name }"></div>
									<div><select name="pi_sex" id="pi_sex">
										<option>성별</option>
										<option value="남">수컷</option>
										<option value="여">암컷</option>
									</select></div>
									<div><input type="text" placeholder="품종" name="pi_type" value="${ppetInfo.pi_type }"></div>
									<div><input type="text" placeholder="무게" name="pi_weight" value="${ppetInfo.pi_weight }"></div>
									<div>
									<select name="pi_year" id="pi_year">
										<c:forEach var="i" begin="1980" end="${year }">
											<option value="${i}">${i }</option>
										</c:forEach>
									</select></div>
									<div>
										<select name="pi_month" id="pi_month">
											<c:forEach var="i" begin="1" end="12">
												<option value="${i}">${i }</option>
											</c:forEach>
										</select>
									</div>
									<div>
									<textarea rows="10" cols="50" name="pi_content">${ppetInfo.pi_content }</textarea>
									</div>
									<input type="hidden" name="pi_num" value="${ppetInfo.pi_num }">
									<button type="submit" class="modifyBtn">
										<label>설정하기</label>
									</button>
								</div>
								</form>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
	</div>
</div>