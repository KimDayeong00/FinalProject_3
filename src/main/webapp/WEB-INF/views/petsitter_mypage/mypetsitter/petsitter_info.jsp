<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDlHuO4oLlpV9W3ENFiqWJI_MjY1Il0cB8">
</script>
<script>
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("<c:url value="/jusoPopup" />","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.getElementById("ps_addr1").value =roadAddrPart1;
		var address = document.getElementById("ps_addr1").value =roadAddrPart1;
		console.log(address);
		codeAddress(address);
		document.getElementById("ps_addr2").value = addrDetail;
		
		
}
function codeAddress(address) {
	var geocoder = new google.maps.Geocoder();
    geocoder.geocode( { 'address': address}, function(results, status) {
        /* console.log("lat : "+results[0].geometry.location.lat(),"lng : "+results[0].geometry.location.lng()) */
    	$("#ps_lat").val(results[0].geometry.location.lat());
    	$("#ps_lng").val(results[0].geometry.location.lng());
    });
}
</script>
<script>
function sendIt() {
	   if (document.f.ps_pwd.value.length<4 || document.f.ps_pwd.value.length>12) {
        alert("비밀번호를 4~12자까지 입력해주세요.");
        document.f.ps_pwd.focus();
        document.f.ps_pwd.select();
        return false;
    }

    //비밀번호와 비밀번호 확인 일치여부 체크
    if (document.f.ps_pwd.value != document.f.confirmpassword.value) {
        alert("비밀번호가 일치하지 않습니다");
        document.f.confirmpassword.value = "";
        document.f.confirmpassword.focus();
        return false;
    }
    
}
</script>
<script>
function checkIt(){
	if(!$("#agree").prop("checked")){
		alert("안내 사항에 동의해주세요");
		return false;
	}
}

</script>
<script>
$(function(){
	 
    $("#ps_phone").on('keydown', function(e){
       // 숫자만 입력받기
        var trans_num = $(this).val().replace(/-/gi,'');
	var k = e.keyCode;
				
	if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
	{
  	    e.preventDefault();
	}
    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
        if($(this).val() == '') return;
 
        // 기존 번호에서 - 를 삭제합니다.
        var trans_num = $(this).val().replace(/-/gi,'');
      
        // 입력값이 있을때만 실행합니다.
        if(trans_num != null && trans_num != '')
        {
            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
            if(trans_num.length==11 || trans_num.length==10) 
            {   
                // 유효성 체크
                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                if(regExp_ctn.test(trans_num))
                {
                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-z?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                    $(this).val(trans_num);
                }
                else
                {
                    alert("유효하지 않은 전화번호 입니다.");
                    $(this).val("");
                    $(this).focus();
                }
            }
            else 
            {
                alert("유효하지 않은 전화번호 입니다.");
                $(this).val("");
                $(this).focus();
            }
      }
  });  
});

</script>
<script>
	function complete(bk_num){
		console.log(bk_num);
		location.href="<c:url value='/ps_complete?bk_num="+bk_num+"'/>";
	}

</script>
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
	
	//저장된 펫시터 집 환경 셀렉트 박스 값 불러오기
	var house = '<c:out value="${optionVo.po_space}"/>';
	var yard = '<c:out value="${optionVo.po_yard}"/>';
	var child ='<c:out value="${optionVo.po_child}"/>';
	var family = '<c:out value="${optionVo.po_family}"/>';
	var otherpet = '<c:out value="${optionVo.po_otherpet}"/>';
	
	//저장된 펫시터 반려견 셀렉트 박스 값 불러오기
	var pi_sex = '<c:out value="${ppetInfo.pi_sex}"/>';
	var pi_year = '<c:out value="${pi_year}"/>';
	var pi_month = '<c:out value="${pi_month}"/>';
	
	//저장된 펫시터 반려견 라디오 값 불러오기
	var pi_gubun = '<c:out value="${ppetInfo.pi_gubun}"/>';
	
	//저장된 필터 체크박스 값 불러오기
	var chfilter = new Array();
	
	<c:forEach items="${filterList}" var="filter">
		chfilter.push("${filter.fl_name}");
	</c:forEach>
	
	$(document).ready(function(){
		
		//집 환경 셀렉트 박스 값 설정
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
		
		//반려견 셀렉트 박스 값 설정
		if(pi_sex=='남'){
			$("#pi_sex").prop("value","남");
		}else if(pi_sex=='여'){
			$("#pi_sex").prop("value","여");
		}
		
		$("#pi_year").prop("value",pi_year);
		$("#pi_month").prop("value",pi_month);
		
		
		//반려견 라디오 값 설정
		$('input:radio[name="pi_gubun"]').each(function(){
					if(pi_gubun==this.value){		
						this.checked=true;
					}
			});
		
		
		//이미지 hover 효과
		$('.ps_image img').hover(function(){
			$(this).css({"border":"5px solid #4d8638","cursor":"pointer"});
		},function(){
			$(this).css("border","");
		});
		
		$('#ppetImg').hover(function(){
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
		
		$('#ppetImg').click(function(){
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
		
		//필터 체크박스 설정
		$('input:checkbox[name="chFilter"]').each(function(){
			console.log(this.value);
				for(var f=0;f<chfilter.length;f++){
					
					if(chfilter[f]==this.value){		
						this.checked=true;
					}
				}
			});
	});
</script>
<div class="sitterPageContent">
	<div class="petsitterPageMenu">
		<div class="sitterImg">
			<img src="<c:url value='resources/images/noprofile.png'/>">
		</div>
		<div class="reservationList">
			<span><a href="<c:url value='/mypetsitter?page=list&dtld=reservation'/>">예약 관리</a></span>
		</div>	
		
		<div class="order">
			<span><a href="<c:url value='/mypage/order'/>">주문목록/배송조회</a></span>
		</div>	
		
		<div class="petsitterInfoManage">
			<span><a href="<c:url value='/psinfoSet?page=sitterInfo&dtld=psInfoSet'/>">펫시터 정보 관리</a></span>
		</div>
		<div class="petInfoManage">
			<span><a href="<c:url value='/petInfo?page=petInfo&dtld=ppetList'/>">반려견 정보 관리</a></span>
		</div>
		<div class="accountManage">
			<span><a href="<c:url value='/ps_account?page=account&dtld=accountUpdate'/>">계정 정보 수정</a></span>
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
								<div>
									<table class="bookTable">
										<tr style="border-bottom:1px solid gray;">
											<th>돌봄 시작 날짜</th><th>돌봄 끝 날짜</th><th>예약 회원 이름</th><th>맡기는 반려견</th><th>요청사항</th><th>완료</th>
										</tr>
											<c:forEach var="plist" items="${pbookList }">
												<tr>
													<td>${plist.bk_startdate }</td>
													<td>${plist.bk_enddate }</td>
													<td>${plist.m_name }</td>
													<c:choose>
														<c:when test="${plist.count>1 }">
															<td>${plist.pi_name } 외 ${plist.count-1 }마리</td>
														</c:when>
														<c:otherwise>
															<td>${plist.pi_name }</td>
														</c:otherwise>
													</c:choose>
													<td>
														<textarea rows="5" cols="10" readonly="readonly">
															${plist.bk_content }
														</textarea>
													</td>
													<td>
														<c:choose>
															<c:when test="${plist.bk_situation == '예약중' }">
																<input type="button" value="완료" onclick="complete('${plist.bk_num}');">		
															</c:when>
															<c:otherwise>
																완료
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
									</table>
									<!-- 페이징 -->
									<div class="paging">
									<ul class="pagination">
									<c:choose>
										<c:when test="${pu.startPageNum>9 }">
											 <li><a aria-label="Previous" href="<c:url value='/mypetsitter?pageNum=${pu.startPageNum-1 }&page=list&dtld=reservation'/>"><span aria-hidden="true">&laquo;</span></a></li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a aria-label="Previous" href="#"><span aria-hidden="true">&laquo;</span></a> </li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
										<c:choose>
											<c:when test="${i==pu.pageNum }">
												<!-- 현재페이지 색상 다르게 표시하기 -->
												 <li class="active"><a href="<c:url value='/mypetsitter?pageNum=${i }&page=list&dtld=reservation'/>">${i }</a></li>
											</c:when>
											<c:otherwise>
												 <li><a href="<c:url value='/mypetsitter?pageNum=${i }&page=list&dtld=reservation'/>">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

								<c:choose>
									<c:when test="${pu.endPageNum<pu.totalPageCount }">
										  <li class="disabled"><a href="<c:url value='/mypetsitter?pageNum=${pu.endPageNum+1 }&page=list&dtld=reservation'/>" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
									</c:when>
									<c:otherwise>
								 		 <li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
									</c:otherwise>
								</c:choose>
								</ul>
								</div>
								</div>
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
					<div class="menubarDiv"><span><a href="<c:url value='/filterSet?page=sitterInfo&dtld=filterSet'/>">검색 필터 정보 설정</a></span></div>
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
										<input type="hidden" id="houseType" style="width:100px" name="houseType">
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
										<input type="hidden" id="familyNum" style="width:100px" name="familyNum">
										</div>
										<div class="houseSetBox">
										<span>아동 유무</span>
										<select id="childSelect" name="childSelect">
											<option value="0">없음</option>
											<option value="1">있음</option>
										</select>
										<input type="hidden" id="childNum" style="width:100px" name="childNum">
										</div>
										<div class="houseSetBox">
										<span>다른 동물 유무</span>
										<select id="otherpetSelect" name="otherpetSelect">
											<option value="0">없음</option>
											<option value="1">있음</option>
										</select>
										<input type="hidden" id="otherpetNum" style="width:100px" name="otherpetNum">
										</div>
									</div>
									<label>이용 가격 설정</label>
									<div class="priceSet">
										
										<div class="houseSetBox">
										<label style="margin-right:59px;">1박 요금</label>
										<input type="text" name="ps_price" value="${priceVo.ps_price }">원
										</div>
										<div class="houseSetBox">
										<label>1day 요금</label>
										<input type="text" name="ps_careprice" value="${priceVo.ps_careprice }">원
										</div>
										<div class="houseSetBox">
										<label>대형견 추가 가격</label>
										<input type="text" name="ps_overprice" value="${priceVo.ps_overprice }">원
										</div>
										
									</div>
										<div class="subwaySet">
											<label>인근 지하철역</label><br>
											<input type="text" name="subway" value="${optionVo.po_subway }">
										</div>
									<div class="modifyBtnBox">
									<button type="submit" class="modifyBtn2">
										<label>설정하기</label>
									</button>
									</div>
								</form>
								<label>보여질 대표 이미지 설정</label>
								<div style="overflow: hidden;width: 100%;">
									<c:forEach var="img" items="${ps_imgVo }">
									<div class="ps_image">
										<form method="post" enctype="multipart/form-data" class="ps_imgForm" action="<c:url value='/ps_imgTest'/>">
											<img src="<c:url value='/resources/upload/${img.pimg_savefilename}'/>">
											<input type="file" name="ps_imgUpload">
											<input type="hidden" name="pimg_num" value="${img.pimg_num }" id="pimg_num">
											<!-- <input type="submit" class="ps_imgSubmit"> -->
										</form>
									</div>
									</c:forEach>
								</div>
								</div>
							</c:when>
							<c:when test="${dtld eq 'filterSet' }">
								<div class="checkFilter">
									<div style="margin-top: 20px;">
									<span><label>필터 설정하기</label></span>
										<form method="post" action="<c:url value='/filterSet'/>">
											<div>
												<span><label>나이</label></span>
												<input type="checkbox" name="chFilter" value="YOUNGAGE">강아지 1살 이하
												<input type="checkbox" name="chFilter" value="OLDAGE">노령견
											</div>
											<div>
												<span><label>무게</label></span>
												<input type="checkbox" name="chFilter" value="SMALLSIZE">소형견 5kg 이하
												<input type="checkbox" name="chFilter" value="MIDDLESIZE">중형견 5~15kg 이하
												<input type="checkbox" name="chFilter" value="BIGSIZE">대형견 15kg 이상
											</div>
											<div>
												<span><label>공간</label></span>
												<input type="checkbox" name="chFilter" value="APART">아파트
												<input type="checkbox" name="chFilter" value="YARD">마당
												<input type="checkbox" name="chFilter" value="OTHERPET">반려견 없는 곳
											</div>
											<div>
												<span><label>전문지식</label></span>
												<input type="checkbox" name="chFilter" value="THESICK">환자견 케어
												<input type="checkbox" name="chFilter" value="LICENSE">자격증
												<input type="checkbox" name="chFilter" value="DOSE">투약 가능
												<input type="checkbox" name="chFilter" value="FIRSTAID">응급 처치
											</div>
											<div>
												<span><label>기타 편의</label></span>
												<input type="checkbox" name="chFilter" value="STROLL">산책
												<input type="checkbox" name="chFilter" value="PICKUP">픽업
												<input type="checkbox" name="chFilter" value="COOKIE">수제간식
											</div><br>		
											<div class="modifyBtnBox">
											<button type="submit" class="modifyBtn2">
												<label>설정하기</label>
											</button>
											</div>
										</form>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>
			</c:when>
		</c:choose>
		<!-- 반려견 정보 관리 -->
		<c:choose>
			<c:when test="${page eq 'petInfo' }">
				<c:choose>
					<c:when test="${dtld eq 'ppetList' }">
					<div style="border-top:1px solid gray;">
						<c:if test="${null ne ppetList}">
								<c:forEach var="vo3" items="${ppetList }">
								<div class="ppetInfo">
									<div class="ppetImg"><img src="<c:url value='/resources/images/${vo3.pi_savefilename }'/>"></div>
									<div class="ppetInfoName">
										<span><a href="<c:url value='/PpetDetail?page=petInfo&dtld=petDetail&pi_num=${vo3.pi_num }'/>">${vo3.pi_name }</a></span><br>
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
									<div class="ppetInsertInput">
									<div class="ppetInputLeft"><input type="text" placeholder="이름" name="pi_name"></div>
									<div class="ppetInputRight"><select name="pi_sex">
										<option>성별</option>
										<option value="남">수컷</option>
										<option value="여">암컷</option>
									</select></div>
									<div class="ppetInputLeft"><input type="text" placeholder="품종" name="pi_type"></div>
									<div class="ppetInputRight"><input type="text" placeholder="무게" name="pi_weight"></div>
									<div class="ppetInputLeft">
									<select name="pi_month" style="width:70px">
										<c:forEach var="i" begin="1" end="12">
											<option value="${i}">${i }</option>
										</c:forEach>
									</select>
									<select name="pi_year" style="width:104px">
										<c:forEach var="i" begin="1980" end="${year }">
											<option value="${i}">${i }</option>
										</c:forEach>
									</select>
									</div>
									</div>
									<div class="PtextArea">
									<textarea rows="10" cols="50" name="pi_content"></textarea>
									</div>
									<div class="modifyBtnBox">
									<button type="submit" class="modifyBtn2">
										<label>설정하기</label>
									</button>
									</div>
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
									<div class="ppetInsertInput">
									<div class="ppetInputLeft"><input type="text" placeholder="이름" name="pi_name" value="${ppetInfo.pi_name }"></div>
									<div class="ppetInputRight"><select name="pi_sex" id="pi_sex">
										<option>성별</option>
										<option value="남">수컷</option>
										<option value="여">암컷</option>
									</select></div>
									<div class="ppetInputLeft"><input type="text" placeholder="품종" name="pi_type" value="${ppetInfo.pi_type }"></div>
									<div class="ppetInputRight"><input type="text" placeholder="무게" name="pi_weight" value="${ppetInfo.pi_weight }"></div>
									<div class="ppetInputLeft">
									<select name="pi_month" id="pi_month">
										<c:forEach var="i" begin="1" end="12">
											<option value="${i}">${i }</option>
										</c:forEach>
									</select>
									<select name="pi_year" id="pi_year">
										<c:forEach var="i" begin="1980" end="${year }">
											<option value="${i}">${i }</option>
										</c:forEach>
									</select>
									</div>
									</div>
									<div class="PtextArea">
									<textarea rows="10" cols="50" name="pi_content">${ppetInfo.pi_content }</textarea>
									</div>
									<input type="hidden" name="pi_num" value="${ppetInfo.pi_num }">
									<div class="modifyBtnBox">
									<button type="submit" class="modifyBtn2">
										<label>설정하기</label>
									</button>
									</div>
								</div>
								</form>
							</div>
						</div>
					</c:when>
					<c:when test="${dtld eq 'petDetail' }">
						<div class="petInsert">
							<div class="petInsertContent">
								<div>
									<img src="<c:url value='/resources/upload/${ppetInfo.pi_savefilename }'/>">
									<div class="queBox" style="border-bottom:1px solid gray;">
									<span>${ppetInfo.pi_name }</span>&nbsp;<span>${ppetInfo.pi_sex }, ${pi_year }년 ${pi_month }월 생, ${ppetInfo.pi_type }, ${ppetInfo.pi_weight }kg</span><br>
									</div><br>
									<div>
									<label>관리 지침 및 요청 사항</label><br>
									<textarea rows="10" cols="50" style="width: 100%;" readonly="readonly">${ppetInfo.pi_content }</textarea>
									</div>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
		<!-- 계정 관리 -->
		<c:choose>
			<c:when test="${page eq 'account' }">
				<div class='mypageMenubar'>
					<div class="menubarDivAcc"><span><a href="<c:url value='/ps_account?page=account&dtld=accountUpdate'/>">계정 정보 수정</a></span></div>
					<div class="menubarDivAcc"><span><a href="<c:url value='/ps_account?page=account&dtld=pwdUpdate'/>">비밀번호 변경</a></span></div>
					<div class="menubarDivAcc"><span><a href="<c:url value='/ps_account?page=account&dtld=leave'/>">회원 탈퇴</a></span></div>
				</div>
					<div class="reservationInfo">
						<c:choose>
							<c:when test="${dtld eq 'accountUpdate' }">
								<div class="accountContent">
									<form method="post" action="<c:url value='ps_account'/>">
										<div>
										<label>이메일</label><br>
										<input type="email" name="ps_email" value="${sitterVo.ps_email }" style="width:100%" readonly="readonly">
										</div>
										<div>
										<label>이름</label><br>
										<input type="text" name="ps_name" value="${sitterVo.ps_name }" required="required"><br><br>
										<label>주소</label><br>
										<input type="text" name="ps_addr1" value="${sitterVo.ps_addr1 }" id="ps_addr1" onclick="goPopup();" style="width:100%" required="required"><br>
										<input type="text" name="ps_addr2" value="${sitterVo.ps_addr2 }" id="ps_addr2" style="width:100%" required="required">
										</div>
										<div>
										<label>휴대폰 번호</label><br>
										<input type="phone" name="ps_phone" value="${sitterVo.ps_phone }" id="ps_phone" required="required">
										</div>
										<div>
										<label>자기 소개</label><br>
										 <input name='ps_content' id="ps_content" type='text' value="${sitterVo.ps_content }" required="required">
										</div>
										<input type="hidden" id="ps_lat" name="ps_lat" value="${sitterVo.ps_lat }"/>
	    								<input type="hidden" id="ps_lng" name="ps_lng" value="${sitterVo.ps_lng }"/>
	    								<button type="submit" class="modifyBtn">
										<label>수정하기</label>
									</button>
    								</form>
								</div>
							</c:when>
							<c:when test="${dtld eq 'pwdUpdate' }">
								<div class="accountContent">
									<form name="f" method="post" onsubmit="return sendIt();" action="<c:url value="/ps_pwdUpdate" />">
									<div>
										<label>새 비밀번호</label><br>
									 	<input name='ps_pwd' id="ps_pwd" type='password' required="required" style="width:100%"><br>
									</div>
									<div>
										<label>비밀번호 확인</label><br>
										<input name='confirmpassword' id="confirmpassword" type='password' required="required" style="width:100%">
									</div>
									<button type="submit" class="modifyBtn">
										<label>변경하기</label>
									</button>
									</form>
								</div>
							</c:when>
							<c:when test="${dtld eq 'leave' }">
								<div>
									<form action="<c:url value='/petsitterLeave'/>" method="post" onsubmit="return checkIt();">
										<div>
											회원 탈퇴 시 해당 아이디로의 재가입이 불가합니다. 돌보미의 경우 보유하고 계신 수익금과 관련된 이력이 모두 삭제되며 진행중인 의뢰에 대해서는 취소 또는 완료가 된 후에 탈퇴해야 합니다. 
	이를 지키지 않아 발생하는 문제에 대한 책임은 회원 본인에게 있으니 신중하게 결정해 주시기 바랍니다. 
	
	탈퇴 후에도 서비스에 등록한 후기는 자동으로 삭제되지 않으며 그대로 남아 있습니다. 삭제를 원하시는 게시글이 있다면 반드시 탈퇴 전에 삭제를 요청해 주시기 바랍니다. 탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 후기글을 임의로 삭제해 드릴 수 없습니다.
											<br><br>
											<input type="checkbox" id="agree">안내 사항을 모두 확인하였으며, 이에 동의합니다.<br>
										 <div class="modifyBtnBox">
										<button type="submit" class="modifyBtn2">
											<label>탈퇴하기</label>
										</button>
										</div>
										</div>
									</form>
								</div>
							</c:when>
						</c:choose>
					</div>
			</c:when>
		</c:choose>
	</div>
</div>