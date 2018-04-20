<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	var startcheckin = '<c:out value="${vo.po_startcheckin}"/>';
	var endcheckin = '<c:out value="${vo.po_endcheckin}"/>';
	$(document).ready(function() {
		var startDate = null;
		var endDate = null;
		
		//이미지 슬라이드 플러그인
		$('.slider').bxSlider();
		//달력 플러그인 (맡기는 날짜)
		flatpickr.localize(flatpickr.l10ns.ko); //언어 한글화
		flatpickr("#selector");
		var selector = $("#selector").flatpickr({
			enableTime : true,
			dateFormat : "Y-m-d H:i",
			defaultHour : "6",
			minDate : "today",
			minTime : startcheckin,
			maxTime : endcheckin,
			minuteIncrement : "30",
			onValueUpdate : function() { 
				//1분 단위 없애기
				var data = $("#selector").val();
				startDate = new Date(this.selectedDates[0]);
				var time = data.split(":");
				var minuteChk = parseInt(time[1] / 10) * 10;
				time[1] = minuteChk;
				if (minuteChk == 0) {
					time[1] = "00";
				}
				$("#selector").prop("value", time[0] + ":" + time[1]);
				
				if(endDate!=null){
					//시간 설정 오류 처리
					if(startDate>=endDate){
						alert("시간 설정이 올바르지 않습니다.");
						this.clear();
						console.log(startDate);
					}
					
				}
			}
		});
		//달력 플러그인2 (끝나는 날짜)
		flatpickr.localize(flatpickr.l10ns.ko); //언어 한글화
		flatpickr("#selector2");
		var selector2 = $("#selector2").flatpickr({
			enableTime : true,
			dateFormat : "Y-m-d H:i",
			defaultHour : "23",
			minDate : "today",
			minTime : "6:00",
			maxTime : "23:00",
			minuteIncrement : "30",
			onValueUpdate : function() {
				//1분 단위 없애기
				var data = $("#selector2").val();
				endDate = new Date(this.selectedDates[0]);
				var time = data.split(":");
				var minuteChk = parseInt(time[1] / 10) * 10;
				time[1] = minuteChk;
				if (minuteChk == 0) {
					time[1] = "00";
				}
				$("#selector2").prop("value", time[0] + ":" + time[1]);
				
				if(startDate!=null){
					//시간 설정 오류 처리
					if(startDate>=endDate){
						alert("시간 설정이 올바르지 않습니다.");
						this.clear();
						//this.set(hourIncrement,"2");
					}
					
					var overtime = endDate-startDate;
					//if(overtime<)
					
					
					if(overtime>28800000){
						$("#day > span").html("1days");
						
						//this.clear();
					}
				}
			}
		});
	});
</script>
<div id="content">
	<div class="imgSlide">
		<div class="slider">
			<div>I am a slide.</div>
			<div>I am another slide.</div>
	
		</div>
	</div>
	<form method="post" action="#">
	<div class="book">
		<p>예약을 원하는 날짜와 시간을 선택해주세요.</p>
		<div class="calendar">
			<input type="text" id="selector" style="width: 150px" placeholder="시작 날짜 선택하기"> 
			<input type="text" id="selector2" style="width: 150px" placeholder="끝 날짜 선택하기">
		</div><br>
		<span>30000원</span>
		<span>
			<select>
				<option>15kg 미만</option>
				<option>15kg 이상</option>
		</select>
		</span>
		<div class="book_box1">
			<span>반려견 추가 당 원</span>
		</div>
		<div class="book_box2">
			<div id="day"><span>1박</span></div>
			<div class="price"><span>원</span></div>
		</div>
		<div class="book_box2">
			<div><span>반려견 추가</span></div>
			<div class="price"><span>원</span></div>
		</div>
		<div class="book_box2">
			<div><span>부가세</span></div>
			<div class="price"><span>원</span></div>
		</div>
		<div class="book_box2" style="border-bottom:1px solid gray;height:30px;">
			<div><span>총 합계</span></div>
			<div class="price"><span>원</span></div>
		</div><br>
		<button id="bookBtn" type="submit">
			<label>예약하기</label>
		</button>
	</div>
	</form>
	<div class="petsitterInfo">
		<div class="petsitterProfile">
			<div class="petsitterImg">
			</div>
			<div class="profile">
				<span>이름</span><span>주소</span>
				<div class="filter">
					<span>필터1</span><span>필터2</span><span>필터3</span>
				</div>
			</div>
		</div>
		<div class="petsitterOption">
			<div class="petSize">
				<span>돌봄 가능한 강아지 크기 & 나이</span><br>
				<span></span><br>
				<span></span><br>
			</div>
			<div class="time">
				<div style="text-align: left;">
					<span>체크인, 체크아웃 시간</span><br>
					<span>체크인 : ${vo.po_startcheckin }~${vo.po_endcheckin } </span><br>
					<span>체크아웃 : ${vo.po_startcheckout }~${vo.po_endcheckout }</span><br>
				</div>
			</div>
		</div>
		<div class="homeStateWrap">
		<span>돌봄 환경</span><br>
			<div class="homeState">
				<div class="left">
					<span>돌봄 공간</span><span>${vo.po_space }</span><br>
					<span>인근 지하철 역</span><span>${vo.po_subway }</span><br>
					<span>마당 유무</span><span>${vo.po_yard }</span><br>
				</div>
				<div class="right">
					<span>14세 미만 아동</span>${vo.po_child }<span></span><br>
					<span>가족 동거 유무</span>${vo.po_family }<span></span><br>
					<span>다른 동물 유무</span><span></span><br>
				</div>
			</div>
	</div>
	</div>
</div>