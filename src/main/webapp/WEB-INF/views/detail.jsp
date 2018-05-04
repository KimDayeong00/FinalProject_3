<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	var startcheckin = '<c:out value="${vo.po_startcheckin}"/>';
	var endcheckin = '<c:out value="${vo.po_endcheckin}"/>';
	var careprice = '<c:out value="${vo4.ps_careprice}"/>';
	var price = '<c:out value="${vo4.ps_price}"/>';
	var over = '<c:out value="${vo4.ps_overprice}"/>';
	var totalover = 0;
	var disdayList = new Array();
	var disdateList = new Array();
	<c:forEach items="${disableList}" var="list">
		disdayList.push("${list.disday}");
		disdateList.push("${list.disDate}")
	</c:forEach>
	
	$(document).ready(function() {
		var startDate = null;
		var endDate = null;
		//반려견 추가 +- 플러그인
		$(function(){

		  //$('input[type="number"]').niceNumber();
			$('#spinner1').niceNumber({
				autoSize:false
			});
		});
		
		//대형견 추가 +- 코드
		$("#plusBtn2").click(function(){
			//number 증가
			var interval = parseInt($("#spinner2").val());
			interval++;
			$("#spinner2").prop('value',interval);
			//span에 금액 표시
			var over2 = parseInt(over);
			if(interval==1){
				console.log("?");
				over2 = parseInt($(".basicprice").text())+over2; 	
						}
			totalover += over2;
			$("#plusprice2").html(totalover);
			
			//부가세 계산
            var overprice = 0;
          	  if($("#overpriceSpan").text()!=""){
          		  overprice = parseInt($("#overpriceSpan").text());
          	  }
            var plusprice1 = parseInt($("#plusprice").text());
            var plusprice2 = parseInt($("#plusprice2").text());
            var allprice = parseInt(overprice+plusprice1+plusprice2);
            var tax = parseInt(allprice*0.1);
            $(".tax").text(tax);
            
            //총합계 계산
            var finalprice = allprice+tax;
            $(".totalprice").text(finalprice);
            
		});
		$("#minusBtn2").click(function(){
			//number 감소
			var interval = parseInt($("#spinner2").val());
			interval--;
			if(interval<=0) interval=0;
			$("#spinner2").prop('value',interval);
			
			//span에 표시
			var over2 = parseInt(over);
			totalover -= over2;
			if(totalover<=0 || interval == 0) totalover=0;
			$("#plusprice2").html(totalover);
			
			//부가세 계산
            var overprice = 0;
          	  if($("#overpriceSpan").text()!=""){
          		  overprice = parseInt($("#overpriceSpan").text());
          	  }
            var plusprice1 = parseInt($("#plusprice").text());
            var plusprice2 = parseInt($("#plusprice2").text());
            var allprice = parseInt(overprice+plusprice1+plusprice2);
            var tax = parseInt(allprice*0.1);
            $(".tax").text(tax);
            
            //총합계 계산
            var finalprice = allprice+tax;
            $(".totalprice").text(finalprice);
		});

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
			maxDate : new Date().fp_incr(90),
			minTime : startcheckin,
			maxTime : "23:00",
			minuteIncrement : "30",
			disable : ["2018-05-06"],
			"disable": [
		        function(date) {
		        	var checkTrue = false;
		        	//var checkDateTrue = false;
		             //return true to disable
		             // 요일
		            for(var k=0;k<disdayList.length;k++){
		            	var disday = disdayList[k].split(",");
		            	for(var z=0;z<disday.length;z++){	
		            		if(date.getDay() === parseInt(disday[z])){
		            			checkTrue=true;	
		            		}
		            	}
		            }
		            // 날짜
		            for(var a=0;a<disdateList.length;a++){
		            	var dd = disdateList[a].split(",");
		            	for(var b=0;b<dd.length;b++){
		            		var disdate = dd[b].split("-");
		            		console.log(disdate[2]);
		            		var da = new Date(parseInt(disdate[0]),parseInt(disdate[1]),parseInt(disdate[2]));
		            		if(date.getDate() === da.getDate() && date.getMonth() != da.getMonth()){
		            			checkTrue = true;
		            		}
		            	}
		            }
		            return checkTrue;
		            //return checkDateTrue;
		        }
		    ],
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
						$("#selector").prop("value", "");
						this.selectedDates[0]=null;
					}
					var overtime = endDate-startDate;					
					
					if(overtime<86400000){
						totalover = 0;
						$("#day > span").html("1day");
						$(".basicprice").html(careprice);
						$("#plusprice").html("0");
						$("#plusprice2").html("0");
						$(".tax").html("0");
						$(".totalprice").html("0");
						$("#spinner1").prop('value',0);
						$("#spinner2").prop('value',0);
						if(overtime>43200000){
							$("#overprice").remove();
							$("#petPlus").before("<div class='book_box2' id='overprice'><div><span>초과금액</span></div>"
							+"<div class='price'><span id='overpriceSpan'>10000</span>원</div></div>");
						}else if(overtime<43200000){
							$("#overprice").remove();	
						}
					}else if(overtime>=86400000){
						totalover = 0;
						$("#day > span").html("1박");
						$(".basicprice").html(price);
						$("#plusprice").html("0");
						$("#plusprice2").html("0");
						$(".tax").html("0");
						$(".totalprice").html("0");
						$("#spinner1").prop('value',0);
						$("#spinner2").prop('value',0);
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
			maxDate : new Date().fp_incr(90),
			minTime : "6:00",
			maxTime : "23:00",
			minuteIncrement : "30",
			"disable": [
		        function(date) {
		        	var checkTrue = false;
		        	//var checkDateTrue = false;
		             //return true to disable
		             // 요일
		            for(var k=0;k<disdayList.length;k++){
		            	var disday = disdayList[k].split(",");
		            	for(var z=0;z<disday.length;z++){	
		            		if(date.getDay() === parseInt(disday[z])){
		            			checkTrue=true;	
		            		}
		            	}
		            }
		            // 날짜
		            for(var a=0;a<disdateList.length;a++){
		            	var dd = disdateList[a].split(",");
		            	for(var b=0;b<dd.length;b++){
		            		var disdate = dd[b].split("-");
		            		console.log(disdate[2]);
		            		var da = new Date(parseInt(disdate[0]),parseInt(disdate[1]),parseInt(disdate[2]));
		            		if(date.getDate() === da.getDate() && date.getMonth() != da.getMonth()){
		            			checkTrue = true;
		            		}
		            	}
		            }
		            return checkTrue;
		            //return checkDateTrue;
		        }
		    ],
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
						$("#selector2").prop("value", "");
						this.selectedDates[0]=null;
					}
					
					var overtime = endDate-startDate;
					//if(overtime<)
					
					
					if(overtime<86400000){
						totalover = 0;
						$("#day > span").html("1day");
						$(".basicprice").html(careprice);
						$("#plusprice").html("0");
						$("#plusprice2").html("0");
						$(".tax").html("0");
						$(".totalprice").html("0");
						$("#spinner1").prop('value',0);
						$("#spinner2").prop('value',0);
						if(overtime>43200000){
							$("#overprice").remove();
							$("#petPlus").before("<div class='book_box2' id='overprice'><div><span>초과금액</span></div>"
									+"<div class='price'><span id='overpriceSpan'>10000</span>원</div></div>");
						}else if(overtime<43200000){
							$("#overprice").remove();	
						}
					}else if(overtime>=86400000){
						totalover = 0;
						$("#overprice").remove();
						$("#day > span").html("1박");
						$(".basicprice").html(price);
						$("#plusprice").html("0");
						$("#plusprice2").html("0");
						$(".tax").html("0");
						$(".totalprice").html("0");
						$("#spinner1").prop('value',0);
						$("#spinner2").prop('value',0);
					}		
					
				}
			}
		});
	});
</script>
<c:forEach var="j" items="${disday }" begin="0" end="${disday.length }">
	${j }
</c:forEach>
<div id="content">
	<div class="imgSlide">
		<div class="slider">
			<c:forEach var="img" items="${imgList }">
				<div><img src="<c:url value='/resources/upload/${img.pimg_savefilename}'/>"></div>
			</c:forEach>
		</div>
	</div>
	<form method="post" action="#">
	<div class="book">
		<p>예약을 원하는 날짜와 시간을 선택해주세요.</p>
		<div class="calendar">
			<input type="text" id="selector" style="width: 150px" placeholder="시작 날짜 선택하기"> 
			<input type="text" id="selector2" style="width: 150px" placeholder="끝 날짜 선택하기">
		</div><br>
		<!--<c:set var="ps_price" value="${vo4.ps_price }" />
			<fmt:formatNumber value= "${ps_price}" type="number" maxIntegerDigits="15"/>
		-->
		<div id="day"><span>1박</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="basicprice">${vo4.ps_price }</span>원</div>
		<!-- <span>
			<select>
				<option>15kg 미만</option>
				<option>15kg 이상</option>
		</select>
		</span> -->
		<div class="book_box1">
			<span>대형견(15kg 이상) 추가 당 ${vo4.ps_overprice }원 </span>
		</div>
		<!-- <div class="book_box2" id="daybox">
			<div id="day"><span>1박</span></div>
			
			<div class="price"><span class="basicprice"><fmt:formatNumber value= "${ps_price}"
			 type="number" maxIntegerDigits="15"/>원</span></div>
		</div> -->
		<div class="book_box3" id="petPlus">
			<div class="petspinner">
				<span>일반견 추가</span>
				<div class="nice-number">			  
				  <input type="number" value="0" style="width: 4ch;" min="0" readonly="readonly" id="spinner1">	 
				</div>
			</div>
			<div class="price"><span id="plusprice">0</span>원</div>
		</div>
		<div class="book_box3" id="petPlus">
			<div class="petspinner">
				<span>대형견 추가</span>
				<div class="nice-number2">
				  <button id="minusBtn2" type="button">-</button>
				  <input type="number" value="0" style="width: 4ch;" id="spinner2" min="0" readonly="readonly">
				  <button id="plusBtn2" type="button">+</button>
				</div>
			</div>
			<div class="price"><span id="plusprice2">0</span>원</div>
		</div>
		<div class="book_box2">
			<div><span>부가세</span></div>
			<div class="price"><span class="tax">0</span>원</div>
		</div>
		<div class="book_box2" style="border-bottom:1px solid gray;height:30px;">
			
			<div><span>총 합계</span></div>
			<div class="price"><span class="totalprice">0</span>원</div>
		</div><br>
		<button id="bookBtn" type="submit">
			<label>예약하기</label>
		</button>
	</div>
	</form>
	<div class="petsitterInfo">
		<div class="petsitterProfile">
			<div class="petsitterImg">
				<img>
			</div>
			<div class="profile">
				<span class="petsitterName">${vo2.ps_name }</span><span class="addr">${vo2.ps_addr1 }</span>
				<div class="filterList">
					<c:forEach var="filter" items="${filterList }">
						<div class="filter"><span>${filter.f_type}</span></div>
					</c:forEach>
					<!-- <span>필터1</span><span>필터2</span><span>필터3</span> -->
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
			<p>돌봄 환경</p>
			<div class="homeState">
				<div class="left">
					<span>돌봄 공간</span>
					<span>${vo.po_space }</span><br>
					<span>인근 지하철 역</span>
					<span>${vo.po_subway }</span><br>
					<span>마당 유무</span>
					<c:choose>
						<c:when test="${vo.po_yard eq 0}">
							<span>없습니다.</span>									
						</c:when>
						<c:otherwise>
							<span>있습니다.</span>
						</c:otherwise>
					</c:choose>
					<br>				
				</div>
				<div class="right">
					<span>14세 미만 아동</span>
					<c:choose>
						<c:when test="${vo.po_child eq 0}">
							<span>없습니다.</span><br>										
						</c:when>
						<c:otherwise>
							<span>${vo.po_child }명 있습니다.</span>
						</c:otherwise>
					</c:choose>		
					<br>
					<span>가족 동거 유무</span>
					<c:choose>
						<c:when test="${vo.po_family eq 0}">
							<span>혼자 살고 있어요.</span><br>										
						</c:when>
						<c:otherwise>
							<span>${vo.po_family }명과 같이 살아요.</span>
						</c:otherwise>
					</c:choose>		
					<br>
					<span>다른 동물 유무</span>
					<c:choose>
						<c:when test="${vo.po_otherpet eq 0}">
							<span>혼자 살고 있어요.</span><br>										
						</c:when>
						<c:otherwise>
							<span>${vo.po_otherpet }마리와 같이 살아요.</span>
						</c:otherwise>
					</c:choose>		
					<br>
				</div>
			</div>
		</div>
		<div class="introduction">
			<p>돌보미 소개</p>
			<div>
				<!--<c:if test="${vo3.pi_gubun eq 0 }">
					<span>${vo2.ps_name } 돌보미는 강아지를 키운 적이 있으며, 현재는 키우고 있지 않습니다.</span><br>
				</c:if>--> 
				<c:forEach var="vo3" items="${petList }">
					<div class="petImg"><img src="<c:url value='/resources/images/${vo3.pi_savefilename }'/>"></div><br>
					<span class="petName">${vo3.pi_name }</span><br>
					<span class="petInfo">(${vo3.pi_type },${vo3.pi_sex },${vo3.pi_age }살)</span><br>
				</c:forEach>
			</div>
			<div class="selfIntroduction">
				${vo2.ps_content }
			</div>
			<div class="hideIntroduction">
			</div>
		</div>
		<div class="review">
			<div><img></div>
			<p>이름</p>
			<div></div>
		</div>
	</div>
	
</div>