<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
//저장된 반려견 셀렉트 박스 값 불러오기
var pi_sex = '<c:out value="${mpetInfo.pi_sex}"/>';
var pi_year = '<c:out value="${pi_year}"/>';
var pi_month = '<c:out value="${pi_month}"/>';

//저장된 펫시터 반려견 라디오 값 불러오기
var pi_gubun = '<c:out value="${mpetInfo.pi_gubun}"/>';

$(document).ready(function(){
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
					//$("#pi_gubun").prop("value",this.value);
				}
		});
});
</script>
<script>
	$(document).ready(function(){
		$('input:radio[name="gubun"]').click(function(){
			 $("#pi_gubun").prop("value",this.value);
		});
	});
</script>
<script>
$(document).ready(function(){
	//이미지 hover 효과
	$('.ppetImgBox img').hover(function(){
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
	$('.ppetImgBox img').click(function(){
		var img = $(this);
		var input = img.next('input[name=my_imgUpload]');
		//var submit = input.next('.ps_imgSubmit');
		input.trigger("click");
		if(input.val()!==""){
			var fd = new FormData();
			fd.append("file",input.prop("files")[0]);
			$.ajax({
				url:"<c:url value='/myPetImgUpload'/>",
				data:fd,
				processData:false,
				contentType:false,
				type:'post',
				dataType:"json",
				success:function(data){
					alert(data.msg);
					img.prop("src","<c:url value='/resources/upload/"+data.pi_savefilename+"'/>");
					$("#pi_savefilename").prop("value",data.pi_savefilename);
					$("#pi_orgfilename").prop("value",data.pi_orgfilename);
					//input.next(".pimg_num").prop("value",data.pimg_num);
				}
			});
		}
	});
});

</script>

<div class="sitterPageContent">
	<div class="petsitterPageMenu">
		<div class="sitterImg">
			<form class="sitterImgForm">
			<c:choose>
				<c:when test="${sessionScope.ps_saveimage eq null }">
					<img src="<c:url value='/resources/images/noprofile.png'/>">
				</c:when>
				<c:otherwise>
					<img src="<c:url value='/resources/petimage/${sessionScope.ps_saveimage }'/>">	
				</c:otherwise>
			</c:choose>
			<input type="file" name="sitterImgFile" style="display: none;">
			</form>
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
						<c:if test="${null ne mpetList}">
								<c:forEach var="vo3" items="${mpetList }">
								<div class="ppetInfo">
									<div class="ppetImg"><img src="${vo3.pi_img }"></div>
									<div class="ppetInfoName">
										<span><a href="<c:url value='/myPetDetail?page=petInfo&dtld=petDetail&pi_num=${vo3.pi_num }'/>">${vo3.pi_name }</a></span><br>
										<span>(${vo3.pi_type },${vo3.pi_sex },${vo3.pi_age }살)</span><br>
										<span><a href="<c:url value='/myPetInfoUpdate?page=petInfo&dtld=petUpdate&pi_num=${vo3.pi_num }'/>">수정하기</a></span>
									</div>
								</div>
								</c:forEach>
						</c:if>
					</div>
					<div>
						<a href="<c:url value='/myPetInfo?page=petInfo&dtld=petInsert'/>">+반려견 추가하기</a>
					</div>
					</c:when>
					<c:when test="${dtld eq 'petInsert' }">
						<div class="petInsert">
							<div class="petInsertContent">
								<form method="post" action="<c:url value='myPetInfo'/>">
								<div class="queBox">
									<span class="que">Q.현재 반려동물을 키우고 있습니까?</span><br>
									<input type="radio" name="gubun" value="1">현재 키우고 있음<br>
									<input type="radio" name="gubun" value="0">현재 키우고 있지 않지만 키운 적이 있음<br>
								</div>
								<div class="queBox">
									<div class="ppetImgBox"><img id="ppetImg" name="pi_img" onclick="tensor();"></div>
									<div class="ppetInsertInput"></div>		
									<div class="ppetInputLeft"><input type="text" placeholder="이름" name="pi_name" ></div>
									<div class="ppetInputRight"><select name="pi_sex">
										<option>성별</option>
										<option value="남">수컷</option>
										<option value="여">암컷</option>
									</select></div>	
									<div class="ppetInputLeft"><input type="text" placeholder="품종" id="ipi_type" name="pi_type"></div>
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
									<label>관리 지침 및 요청 사항</label><br>
									<textarea rows="10" cols="50" name="pi_content"></textarea>
									</div>
									
									<input type="file" name="my_imgUpload" style="display:none;">
									<input type="hidden" name="pi_gubun" id="pi_gubun">
									<input type="hidden" name="pi_savefilename" id="pi_savefilename">
									<input type="hidden" name="pi_orgfilename" id="pi_orgfilename">
									<div class="modifyBtnBox">
									<button type="submit" class="modifyBtn2">
										<label>설정하기</label>
									</button>
									</div>
									<input type="hidden" id="hpi_savefilename" name="hpi_savefilename" value="" />
									</form>
								</div>
							</div>
					</c:when>
					<c:when test="${dtld eq 'petUpdate' }">
						<div class="petInsert">
							<div class="petInsertContent">
								<form method="post" action="<c:url value='/myPetInfoUpdate'/>">
								<div class="queBox">
									<span class="que">Q.현재 반려동물을 키우고 있습니까?</span><br>
									<input type="radio" name="pi_gubun" value="1">현재 키우고 있음<br>
									<input type="radio" name="pi_gubun" value="0">현재 키우고 있지 않지만 키운 적이 있음<br>
								</div>
								<div class="queBox">
									<div class="ppetImgBox"><img id="ppetImg2" onclick="tensor2();"></div>
									<div class="ppetInsertInput">
									<div class="ppetInputLeft"><input type="text" placeholder="이름" name="pi_name" value="${mpetInfo.pi_name }"></div>
									<div class="ppetInputRight"><select name="pi_sex" id="pi_sex">
										<option>성별</option>
										<option value="남">수컷</option>
										<option value="여">암컷</option>
									</select></div>
									<div class="ppetInputLeft"><input type="text" placeholder="품종" name="pi_type" id="ipi_type2" value="${mpetInfo.pi_type }"></div>
									<div class="ppetInputRight"><input type="text" placeholder="무게" name="pi_weight" value="${mpetInfo.pi_weight }"></div>
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
									<textarea rows="10" cols="50" name="pi_content">${mpetInfo.pi_content }</textarea>
									</div>
									<input type="hidden" name="pi_num" value="${mpetInfo.pi_num }">
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
									<img src="<c:url value='/resources/upload/${mpetInfo.pi_savefilename }'/>">
									<div class="queBox" style="border-bottom:1px solid gray;">
									<span>${mpetInfo.pi_name }</span>&nbsp;<span>${mpetInfo.pi_sex }, ${pi_year }년 ${pi_month }월 생, ${mpetInfo.pi_type }, ${mpetInfo.pi_weight }kg</span><br>
									</div><br>
									<div>
									<label>관리 지침 및 요청 사항</label><br>
									<textarea rows="10" cols="50" style="width: 100%;" readonly="readonly">${mpetInfo.pi_content }</textarea>
									</div>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
	</div>
</div>



<script>
var openWin;
function tensor(){
	
	var pop = window.open("<c:url value='/tensor?gubun=1' />","pop","width=570,height=800, scrollbars=yes, resizable=yes"); 
	
}

function CallBack(dog_name, nsrc){
	$("#ipi_type").prop("value",dog_name);
	$("#ppetImg").prop("src", nsrc);
	alert(nsrc);
	$("#hpi_savefilename").prop("value",nsrc)
	console.log($("#hpi_savefilename").val());
}


function tensor2(){
	
	var pop = window.open("<c:url value='/tensor?gubun=2' />","pop","width=570,height=800, scrollbars=yes, resizable=yes"); 
	
}

function CallBack2(dog_name, nsrc){
	$("#ipi_type2").prop("value",dog_name);
	$("#ppetImg2").prop("src", nsrc);
}


</script>