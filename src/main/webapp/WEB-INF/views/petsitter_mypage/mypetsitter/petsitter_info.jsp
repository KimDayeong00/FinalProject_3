<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	//불가능한 날짜 설정 불러오기
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
	
	//저장된 체크인,아웃 시간 불러오기
	var startCheckin = '<c:out value="${optionVo.po_startcheckin}"/>';
	var endCheckin ='<c:out value="${optionVo.po_endcheckin}"/>';
	var startCheckout ='<c:out value="${optionVo.po_startcheckout}"/>';
	var endCheckout = '<c:out value="${optionVo.po_endcheckout}"/>';
	
	//저장된 셀렉트 박스 값 불러오기
	var house = '<c:out value="${optionVo.po_space}"/>';
	var yard = '<c:out value="${optionVo.po_yard}"/>';
	var child ='<c:out value="${optionVo.po_child}"/>';
	var family = '<c:out value="${optionVo.po_family}"/>';
	var otherpet = '<c:out value="${optionVo.po_otherpet}"/>';
	
	$(document).ready(function(){
		
		//셀렉트 박스 값 설정
		if(house=='빌라'){
			$("#houseSelect").prop("value","1");
		}else if(house=='아파트'){
			$("#houseSelect").prop("value","2");
		}else if(house=='단독주택'){
			$("#houseSelect").prop("value","3");
		}else if(house!="1" && house!="0"){
			$("#houseSelect").prop("value","4");
			$("#houseType").prop({"type":"text","value":house});
		}
		
		if(yard=='1'){
			$("#yardSelect").prop("value","1");
		}
		
		if(child!='0'){
			$("#childSelect").prop("value","1");
			$("#childNum").prop({"type":"text","value":child});
		}
		
		if(family!='0'){
			$("#familySelect").prop("value","1");
			$("#familyNum").prop({"type":"text","value":family});
		}
		if(otherpet!='0'){
			$("#otherpetSelect").prop("value","1");
			$("#otherpetNum").prop({"type":"text","value":otherpet});
		}
		
		
		//이미지 hover 효과
		$('.ps_image img').hover(function(){
			$(this).css({"border":"5px solid #4d8638","cursor":"pointer"});
		},function(){
			$(this).css("border","");
		});
		
		
		
		//이미지 클릭하여 업로드
		$('.ps_image img').click(function(){
			var img = $(this);
			var input = img.next('input[name=ps_imgUpload]');
			var submit = input.next('.ps_imgSubmit');
			input.trigger("click");
			input.change(function(){
				//submit.trigger("click",function(){
					var fd = new FormData(input.parent(".ps_imgForm")[0]);
					//fd.append("file",input.prop("files")[0]);
					$.ajax({
						url:"<c:url value='/ps_imgTest'/>",
						data:fd,
						processData:false,
						contentType:false,
						type:'post',
						dataType:"json",
						success:function(data){
							alert(data.msg);
							img.prop("src","<c:url value='/resources/upload/"+data.pimg_savefilename+"'/>");
							input.next(".pimg_num").prop("value",data.pimg_num);
						}
					});
				//});
			});
		});
		
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
		
		//시계 플러그인1
		flatpickr("#checkinStart");
		var checkinStart = $("#checkinStart").flatpickr({
			enableTime: true,
		    noCalendar: true,
		    dateFormat: "H:i",
		    defaultDate: startCheckin,
		    minuteIncrement : "30",
		    time_24hr: true,
		    onValueUpdate : function() { 
				//1분 단위 없애기
				var data = $("#checkinStart").val();
				startDate = new Date(this.selectedDates[0]);
				var time = data.split(":");
				var minuteChk = parseInt(time[1] / 10) * 10;
				time[1] = minuteChk;
				if (minuteChk == 0) {
					time[1] = "00";
				}
				$("#checkinStart").prop("value", time[0] + ":" + time[1]);
		    }
		});
		
		//시계 플러그인2
		flatpickr("#checkinEnd");
		var checkinEnd = $("#checkinEnd").flatpickr({
			enableTime: true,
		    noCalendar: true,
		    dateFormat: "H:i",
		    defaultDate: endCheckin,
		    minuteIncrement : "30",
		    time_24hr: true,
		    onValueUpdate : function() { 
				//1분 단위 없애기
				var data = $("#checkinEnd").val();
				startDate = new Date(this.selectedDates[0]);
				var time = data.split(":");
				var minuteChk = parseInt(time[1] / 10) * 10;
				time[1] = minuteChk;
				if (minuteChk == 0) {
					time[1] = "00";
				}
				$("#checkinEnd").prop("value", time[0] + ":" + time[1]);
		    }
		});
		
		//시계 플러그인3
		flatpickr("#checkoutStart");
		var checkoutStart = $("#checkoutStart").flatpickr({
			enableTime: true,
		    noCalendar: true,
		    dateFormat: "H:i",
		    defaultDate: startCheckout,
		    minuteIncrement : "30",
		    time_24hr: true,
		    onValueUpdate : function() { 
				//1분 단위 없애기
				var data = $("#checkoutStart").val();
				startDate = new Date(this.selectedDates[0]);
				var time = data.split(":");
				var minuteChk = parseInt(time[1] / 10) * 10;
				time[1] = minuteChk;
				if (minuteChk == 0) {
					time[1] = "00";
				}
				$("#checkoutStart").prop("value", time[0] + ":" + time[1]);
		    }
		});
		
		//시계 플러그인4
		flatpickr("#checkoutEnd");
		var checkoutStart = $("#checkoutEnd").flatpickr({
			enableTime: true,
		    noCalendar: true,
		    dateFormat: "H:i",
		    defaultDate: endCheckout,
		    minuteIncrement : "30",
		    time_24hr: true,
		    onValueUpdate : function() { 
				//1분 단위 없애기
				var data = $("#checkoutEnd").val();
				startDate = new Date(this.selectedDates[0]);
				var time = data.split(":");
				var minuteChk = parseInt(time[1] / 10) * 10;
				time[1] = minuteChk;
				if (minuteChk == 0) {
					time[1] = "00";
				}
				$("#checkoutEnd").prop("value", time[0] + ":" + time[1]);
		    }
		});
		
		// select 박스
		$("#houseSelect").change(function(){
			if($("#houseSelect option:selected").text()=='기타'){
				$("#houseType").prop("type","text");
			}else{
				$("#houseType").prop("type","hidden");
			}
		});
		
		$("#childSelect").change(function(){
			if($("#childSelect option:selected").text()=='있음'){
				$("#childNum").prop("type","text");
			}else{
				$("#childNum").prop("type","hidden");
			}
		});
		
		$("#familySelect").change(function(){
			if($("#familySelect option:selected").text()=='있음'){
				$("#familyNum").prop("type","text");
			}else{
				$("#familyNum").prop("type","hidden");
			}
		});	
		$("#otherpetSelect").change(function(){
			if($("#otherpetSelect option:selected").text()=='있음'){
				$("#otherpetNum").prop("type","text");
			}else{
				$("#otherpetNum").prop("type","hidden");
			}
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
			<span><a href="<c:url value='/psinfoSet?page=sitterInfo&dtld=psInfoSet'/>">펫시터 정보 관리</a></span>
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
								<input type="checkbox" name="dayCheck" value="0">일
								<input type="checkbox" name="dayCheck" value="1">월
								<input type="checkbox" name="dayCheck" value="2">화
								<input type="checkbox" name="dayCheck" value="3">수
								<input type="checkbox" name="dayCheck" value="4">목
								<input type="checkbox" name="dayCheck" value="5">금
								<input type="checkbox" name="dayCheck" value="6">토<br>
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
					<div class="menubarDiv"><span><a href="<c:url value='/psinfoSet?page=sitterInfo&dtld=psInfoSet'/>">펫시터 환경 정보 설정</a></span></div>
					<div class="menubarDiv"><span><a href="<c:url value='/mypetsitter?page=sitterInfo&dtld=filterSet'/>">검색 필터 정보 설정</a></span></div>
				</div>
					<div class="reservationInfo">
						<c:choose>
							<c:when test="${dtld eq 'psInfoSet' }">
								<div class="checkTime">
								<form method="post" action="<c:url value='/psinfoSet'/>">
									<div class="checkTimeBox">
										<label>체크인 시작 시간</label>
										<input type="text" id="checkinStart" name="checkinStart" value="${optionVo.po_startcheckin }">
									</div>
									<div class="checkTimeBox">
										<label>체크인 끝 시간</label>
										<input type="text" id="checkinEnd" name="checkinEnd" value="${optionVo.po_endcheckin }">
									</div>
									<div class="checkTimeBox">
										<label>체크아웃 시작 시간</label>
										<input type="text" id="checkoutStart" name="checkoutStart" value="${optionVo.po_startcheckout }">
									</div>
									<div class="checkTimeBox">
										<label>체크아웃 끝 시간</label>
										<input type="text" id="checkoutEnd" name="checkoutEnd" value="${optionVo.po_endcheckout }">
									</div>
									<div class="houseSet">
										<label>돌볼 공간 설정</label><br>
										<div class="houseSetBox">
										<span>거주지 형태</span>
										<select id="houseSelect" name="houseSelect">
											<option value="1">빌라</option>
											<option value="2">아파트</option>
											<option value="3">단독주택</option>
											<option value="4">기타</option>
										</select>
										<input type="hidden" id="houseType" style="width:140px" name="houseType">
										</div>
										<div class="houseSetBox">
										<span>마당 유무</span>
										<select id="yardSelect" name="yardSelect">
											<option value="0">없음</option>
											<option value="1">있음</option>
										</select>
										</div>
										<div class="houseSetBox">
										<span>동거인 유무</span>
										<select id="familySelect" name="familySelect">
											<option value="0">없음</option>
											<option value="1">있음</option>
										</select>
										<input type="hidden" id="familyNum" style="width:140px" name="familyNum">
										</div>
										<div class="houseSetBox">
										<span>아동 유무</span>
										<select id="childSelect" name="childSelect">
											<option value="0">없음</option>
											<option value="1">있음</option>
										</select>
										<input type="hidden" id="childNum" style="width:140px" name="childNum">
										</div>
										<div class="houseSetBox">
										<span>다른 동물 유무</span>
										<select id="otherpetSelect" name="otherpetSelect">
											<option value="0">없음</option>
											<option value="1">있음</option>
										</select>
										<input type="hidden" id="otherpetNum" style="width:140px" name="otherpetNum">
										</div>
									</div>
										<div class="subwaySet">
											<label>인근 지하철역</label><br>
											<input type="text" name="subway" value="${optionVo.po_subway }">
										</div>
									<button type="submit" class="modifyBtn">
										<label>설정하기</label>
									</button>
								</form>
								<label>보여질 대표 이미지 설정</label>
								
								<div class="ps_image">
									<c:forEach var="img" items="${ps_imgVo }">
										<form method="post" enctype="multipart/form-data" class="ps_imgForm" action="<c:url value='/ps_imgTest'/>">
											<img src="<c:url value='/resources/upload/${img.pimg_savefilename}'/>">
											<input type="file" name="ps_imgUpload">
											<input type="hidden" name="pimg_num" value="${img.pimg_num }" id="pimg_num">
											<!-- <input type="submit" class="ps_imgSubmit"> -->
										</form>
									</c:forEach>
								</div>	
								
								</div>
							</c:when>
							<c:when test="${dtld eq 'filterSet' }">
								<div>ㅁㅁ</div>
							</c:when>
						</c:choose>
					</div>
			</c:when>
		</c:choose>
	</div>
</div>