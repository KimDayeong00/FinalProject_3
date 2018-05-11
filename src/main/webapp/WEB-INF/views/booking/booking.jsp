<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">
	<div class="reservationWrap">
		<h2>예약하기</h2>
		<div class="bookingDetail">
			<form action="">
				<div class="bookingWrap">
					<div class="checkTimeWrap">
						<div class="startdateBox">체크인 ${bk_startdate }</div>
						<div class="enddateBox">체크아웃 ${bk_enddate }</div>
						<div class="selectPetBox">반려견 ${petCount }마리</div>
					</div>
					<div class="selectPetWrap">
						<p><strong>반려견 선택하기</strong></p>
						
					</div>
					<div class="priceWrap">
						<div class="priceBox">
							<span class="priceLeft">${ps_price }x${ps_day }박</span><span class="priceRight">${price }</span>
						</div>
						<div class="priceBox">
							<span class="priceLeft"></span><span class="priceRight"></span>
						</div>
						<div class="priceBox">
							<span class="priceLeft">부가세 10%</span><span class="priceRight">${tax }</span>
						</div>
						<div>
							<span class="priceLeft">최종 금액</span><span class="priceRight">${allPrice }</span>
						</div>
					</div>
				</div>
				<div class="bookNotice">
					<div>
					
					</div>
				</div>
				<div class="bookTextArea">
					<textarea rows="5" cols="50">
					
					</textarea>
				</div>
				<div>
					<button type="submit" class="modifyBtn2">
						<label>예약하기</label>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>