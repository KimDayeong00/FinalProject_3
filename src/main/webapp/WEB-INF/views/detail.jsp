<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
	var startcheckin = '<c:out value="${vo.po_startcheckin}"/>';
	var endcheckin = '<c:out value="${vo.po_endcheckin}"/>';
	var careprice = '<c:out value="${vo4.ps_careprice}"/>';
	var price = '<c:out value="${vo4.ps_price}"/>';
	var over = '<c:out value="${vo4.ps_overprice}"/>';
	var totalover = 0;
	var disdayList = new Array();
	var disdateList = new Array();
	var disableBook = '${startdate}';
	
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
			
			//if(interval==1){
				console.log("?");
				over2 = parseInt($(".basicprice").text())+over2; 	
					//	}
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
			disable : ["2018-05-16"],
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
		            
		            	var ss = disableBook.split(",");
		            	for(var f=0;f<ss.length-1;f++){
		            		var diss = ss[f].split("-");
		            		console.log(diss[0]+","+diss[1]+","+diss[2]);
		            		var das = new Date(parseInt(diss[0]),parseInt(diss[1]),parseInt(diss[2]));
		            		console.log(das.getDate());
		            		if(date.getDate() === das.getDate() && date.getMonth() != das.getMonth()){
		            			checkTrue = true;
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
					var overtime = endDate-startDate; // 시간 계산
					var bookDay = 1;
					var standardtime = 86400000;
					var fPrice = price;
					
					if(overtime<86400000){
						totalover = 0;
						$("#day > span").html("1day");
						$(".basicprice").html(careprice);
						
						//예약 페이지로 넘길 값
						$("#ps_price").prop("value",careprice);
						$("#ps_day").prop("value","1day");
						
						//0으로 초기화
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
					}else if(overtime>86400000){
						totalover = 0;
						
						var calcTime = parseInt((overtime-standardtime)/standardtime);
						bookDay = calcTime+bookDay;
						
						fPrice = fPrice*bookDay;
						
						$("#day > span").html(bookDay+"박");
						$(".basicprice").html(fPrice);
						
						//예약 페이지로 넘길 값
						$("#ps_price").prop("value",price);
						$("#ps_day").prop("value",bookDay);
						
						//바뀔 때 초기화
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
		            
		            var ss = disableBook.split(",");
	            	for(var f=0;f<ss.length-1;f++){
	            		var diss = ss[f].split("-");
	            		console.log(diss[0]+","+diss[1]+","+diss[2]);
	            		var das = new Date(parseInt(diss[0]),parseInt(diss[1]),parseInt(diss[2]));
	            		console.log(das.getDate());
	            		if(date.getDate() === das.getDate() && date.getMonth() != das.getMonth()){
	            			checkTrue = true;
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
					var bookDay = 1;
					var standardtime = 86400000;
					var fPrice = price;
					
					
					if(overtime<86400000){
						totalover = 0;
						$("#day > span").html("1day");
						$(".basicprice").html(careprice);
						
						//예약 페이지로 넘기는 값
						$("#ps_price").prop("value",careprice);
						$("#ps_day").prop("value","1day");
						
						// 0으로 초기화
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
					}else if(overtime>86400000){
						totalover = 0;
						var calcTime = parseInt((overtime-standardtime)/standardtime);
						bookDay = calcTime+bookDay;
						fPrice = fPrice*bookDay;
						
						//예약 페이지로 넘기는 값
						$("#ps_price").prop("value",price); 
						$("#ps_day").prop("value",bookDay);
						
						$("#day > span").html(bookDay+"박");
						
						
						$("#overprice").remove();
						$(".basicprice").html(fPrice);
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

<script>
	function checkIt(){
		if($("#selector").val()==""||$("#selector2").val()==""){
			alert("예약할 날짜를 선택해주세요");
			
			return false;
		}
		if($("#spinner1").val()==0 && $("#spinner2").val()==0){
			alert("반려견을 추가해주세요");
			
			return false;
		}
		
	}

</script>
<c:forEach var="j" items="${disday }" begin="0" end="${disday.length }">
	${j }
</c:forEach>
<div id="content">
	<div class="imgSlide">
		<div class="slider">
			<c:forEach var="img" items="${imgList }">
				<div><img style="width: 100%; height: 100%;" src="<c:url value='/resources/upload/${img.pimg_savefilename}'/>"></div>
			</c:forEach>
		</div>
	</div>
	<form method="post" action="<c:url value='/reservation'/>" onsubmit="return checkIt();">
	<div class="book">
		<div class="book-font">
		<p><strong>예약을 원하는 날짜와 시간을 선택해주세요.</strong></p>
		</div>
		<div class="calendar">
			<input type="text" id="selector" name="bk_startdate" style="width: 150px" placeholder="시작 날짜 선택하기"> 
			<input type="text" id="selector2" name="bk_enddate" style="width: 150px" placeholder="끝 날짜 선택하기">
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
				  <input type="number" value="0" style="width: 4ch;" min="0" readonly="readonly" id="spinner1" name="smallPet">	 
				</div>
			</div>
			<div class="price"><span id="plusprice">0</span>원</div>
		</div>
		<div class="book_box3" id="petPlus">
			<div class="petspinner">
				<span>대형견 추가</span>
				<div class="nice-number2">
				  <button id="minusBtn2" type="button">-</button>
				  <input type="number" value="0" style="width: 4ch;" id="spinner2" min="0" readonly="readonly" name="bigPet">
				  <button id="plusBtn2" type="button">+</button>
				</div>
			</div>
			<div class="price"><span id="plusprice2">0</span>원</div>
		</div>
		<div class="book_box2">
			<div><span>부가세</span></div>
			<div class="price"><span class="tax">0</span>원</div>
		</div>
		<div class="book_box2" style="border-bottom:1px solid #BABABA;height:30px;">
			
			<div><span>총 합계</span></div>
			<div class="price"><span class="totalprice">0</span>원</div>
		</div><br>
		<!-- 예약 페이지로 넘길 값 -->
		<input type="hidden" name="ps_price" id="ps_price">
		<input type="hidden" name="ps_day" id="ps_day">
		<input type="hidden" name="ps_email" value="${ps_email }">
		<button id="bookBtn" type="submit">
			<label>예약하기</label>
		</button>
	</div>
	</form>
	<div class="petsitterInfo">
	<div class="ps-content">
		<div class="petsitterProfile">
			<div class="petsitterImg">
				<img src="<c:url value='resources/images/noprofile.png'/>">
			</div>
			<div class="profile">
				<span class="petsitterName">${vo2.ps_name }</span>&nbsp;&nbsp;&nbsp;<span class="addr">${vo2.ps_addr1 }</span><br><br>
				<div class="filterList">
					<c:forEach var="filter" items="${filterList }">
						<div class="filter"><span>${filter.f_type}</span></div>
					</c:forEach>
					<!-- <span>필터1</span><span>필터2</span><span>필터3</span> -->
				</div>
			</div>
		</div>
		<div class="petsitterOption">
			<!-- <div class="petSize">
				<span>돌봄 가능한 강아지 크기 & 나이</span><br>
				<span></span><br>
				<span></span><br>
			</div> -->
			<div class="petSize">
				<img src="<c:url value='resources/images/Watch-icon.png'/>">
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
			<div class="homeState">
			<p><strong>돌봄 환경</strong></p>
				<div class="left">
					<div style="background-color:#f0efe8;"><span>돌봄 공간</span><span class="right-span">${vo.po_space }</span></div>
					<div><span>인근 지하철 역</span><span class="right-span">${vo.po_subway }</span></div>
					<div style="background-color:#f0efe8;"><span>마당 유무</span>
					<c:choose>
						<c:when test="${vo.po_yard eq 0}">
							<span class="right-span">없습니다</span>									
						</c:when>
						<c:otherwise>
							<span class="right-span">있습니다</span>
						</c:otherwise>
					</c:choose>
					</div>				
				</div>
				<div class="right">
					<div style="background-color:#f0efe8;"><span>14세 미만 아동</span>
					<c:choose>
						<c:when test="${vo.po_child eq 0}">
							<span class="right-span">없습니다</span>										
						</c:when>
						<c:otherwise>
							<span class="right-span">${vo.po_child }명 있습니다</span>
						</c:otherwise>
					</c:choose>	
					</div>	
					<div><span>가족 동거 유무</span>
					<c:choose>
						<c:when test="${vo.po_family eq 0}">
							<span class="right-span">혼자 살고 있어요</span>										
						</c:when>
						<c:otherwise>
							<span class="right-span">${vo.po_family }명과 같이 살아요</span>
						</c:otherwise>
					</c:choose>
					</div>
					<div style="background-color:#f0efe8;"><span>다른 동물 유무</span>
					<c:choose>
						<c:when test="${vo.po_otherpet eq 0}">
							<span class="right-span">혼자 살고 있어요</span>							
						</c:when>
						<c:otherwise>
							<span class="right-span">${vo.po_otherpet }마리와 같이 살아요</span>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</div><br>
		<div class="introduction">
			<div class="introBox">
				<div class="petIntro">
				<p><strong>돌보미 소개</strong></p>
					<c:set var="loop" value="0"/>
					<c:forEach var="gubun" items="${petList }" varStatus="status">
						<c:if test="${gubun.pi_gubun eq 0}">
							<c:set var="loop" value="${loop+1 }"/>
						</c:if>
						<c:if test="${loop eq fn:length(petList) }">
							<span>${vo2.ps_name } 돌보미는 강아지를 키운 적이 있으며, 현재는 키우고 있지 않습니다.</span>
						</c:if>
					</c:forEach>
					<br><br>
					<c:forEach var="vo3" items="${petList }">
						<div class="petImg"><img src="<c:url value='/resources/upload/${vo3.pi_savefilename }'/>">
						<span class="petName">${vo3.pi_name }</span>
						<span class="petInfo">(${vo3.pi_type }, ${vo3.pi_sex }, ${vo3.pi_age }살)</span>
						</div>
					</c:forEach>
				</div>
				<div class="introContent">
				<div class="selfIntroduction">
					${vo2.ps_content }
				</div>
				<div class="hideIntroduction">
				</div>
				</div>
			</div>
		<div class="ps-review">
			<div><p><strong>후기 ${rvCnt }개</strong></p></div>
			<c:forEach var="rv" items="${rvList }">
				<div><span><strong>${rv.m_name }</strong></span></div>
				<div class="ps-rvContent">
					${rv.r_content }
				</div>
			</c:forEach>
			
			
			<!-- <div><p><strong>후기 1개</strong></p></div>
			<div><span><strong>이지영</strong></span></div>
			<div class="ps-rvContent">
			몽이를 키우는 동안 모르는 사람에게 맡긴 적이 없어<br>
			걱정이 많았는데 펫시터 분 첫인상부터 너무 좋으신 분이라 안심했어요. :) 
			</div> -->
		</div>
	</div>
	</div>
</div>
</div>