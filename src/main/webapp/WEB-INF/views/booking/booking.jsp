<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var petCount = "${petCount}";
	var bigPet = "${bigPet}";
	var smallPet = "${smallPet}";
	var count = 0;
	var sc = 0;
	var bc = 0;
	
	var petArray = new Array();
	
	$(document).ready(function(){
		$(".selectPetList").hover(function(){
			if($(this).find(".check").val()==0){
			$(this).find(".checkBtn").prop("src","<c:url value='/resources/images/bookcheck.png'/>");
			$(this).css({"cursor":"pointer"})
			}
		},function(){
			if($(this).find(".check").val()==0){
			$(this).find(".checkBtn").prop("src","<c:url value='/resources/images/bookuncheck.png'/>");
			//$(this).css("border","");
			}
		});
		
		$(".selectPetList").click(function(){
			var selectPetBox = $(this);
			var check = selectPetBox.find(".check");
			var pCount = parseInt(petCount);
			var sCount = parseInt(smallPet);
			var bCount = parseInt(bigPet);
			var pi_weight = selectPetBox.find("#pi_weight").val();
			
				if(check.val()==0){
					if(pCount==count){
						alert("선택한 반려견의 수보다 많이 선택할 수 없습니다.");
					}else{					
						if(pi_weight<15){
							sc++;
							if(sCount<sc||sCount==0){
								alert("선택한 일반견의 수보다 많이 선택할 수 없습니다.");
								sc--;
							}else{
								check.prop("value",1);
								console.log(check.val());
								selectPetBox.find("#checkImg").prop("src","<c:url value='/resources/images/bookcheck.png'/>");
								var pi_num = selectPetBox.find("#pi_num").val();
								petArray.push(pi_num);
								$("#selectPet").prop("value",petArray);
								
								//$("#selectPet").prop("value",pi_num);
								count++;
							}
						}else{
							bc++;
							if(bCount<bc||bCount==0){
								alert("선택한 대형견의 수보다 많이 선택할 수 없습니다.");
								bc--;
							}else{
								check.prop("value",1);
								console.log(check.val());
								selectPetBox.find("#checkImg").prop("src","<c:url value='/resources/images/bookcheck.png'/>");
								var pi_num = selectPetBox.find("#pi_num").val();
								petArray.push(pi_num);
								$("#selectPet").prop("value",petArray);
								count++;
							}
						}
						//console.log("sc"+sc);
						//console.log("sCount"+sCount);
						//console.log("bc"+bc);
						//console.log("bCount"+bCount);
					}
				}else{
					if(pi_weight<15){
						sc--;
					}else{
						bc--;
					}
					check.prop("value",0);
					console.log(check.val());
					selectPetBox.find("#checkImg").prop("src","<c:url value='/resources/images/bookuncheck.png'/>");
					var index = petArray.indexOf(pi_num);
					petArray.splice(index,1);
					$("#selectPet").prop("value",petArray);
					count--;
				}
				
			
		});
	});
	
</script>
<script>
	function checkIt(){
		var a=1;
		$(".check").each(function(){
			if($(this).val()==0){
				
			}else{
				a=0;
			}
		})
		if(a==1){
			alert("반려견을 선택해주세요");
			return false;
		}else{
			//alert("아");
			return true;
		}
	}

</script>
<div id="content">
	<div class="reservationWrap">
		<h2>예약하기</h2>
		<div class="bookingDetail">
			<form action="<c:url value='/reservation_p'/>" method="post" onsubmit="return checkIt();">
				<div class="bookingWrap">
					<div class="checkTimeWrap" style="vertical-align: middle; margin: 0 auto;">
						<div class="startdateBox"><span class="left">체크인</span> <span class="right">${bk_startdate }</span></div>
						<div class="enddateBox"><span class="left">체크아웃</span> <span class="right">${bk_enddate }</span></div>
						<div class="selectPetBox"><span class="left">반려견 </span> <span class="right">${petCount }마리</span></div>
						<input type="hidden" name="bk_startdate" value="${bk_startdate }">
						<input type="hidden" name="bk_enddate" value="${bk_enddate }">
					</div>
					<div class="selectPetWrap">
						<p><strong>반려견 선택하기</strong></p>
						<div class="petListWrap">
							예약 설정한 반려견 : 일반견 ${smallPet }마리, 대형견 ${bigPet }마리<br><br>
							<c:forEach var="pet" items="${petList }">
								<div class="selectPetList">
									<div class="petImg"><img src="<c:url value='/resources/petimage/${pet.pi_savefilename }'/>"></div>
									<span>${pet.pi_name }</span><br>
									<img src="<c:url value='/resources/images/bookuncheck.png'/>" class="checkBtn" id="checkImg">			
									<input type="hidden" class="check" value="0">
									<input type="hidden" id="pi_num" name="pi_num" value="${pet.pi_num }">
									<input type="hidden" id="pi_weight" value="${pet.pi_weight }">
								</div>
							</c:forEach>
						</div>
						<input type="hidden" id="selectPet" name="selectPet" value="0">
					</div>
					<div class="priceWrap">
						<div class="priceBox">
							<span class="priceLeft">${ps_price }원 x ${ps_day }박</span><span class="priceRight"><strong>${price }원</strong></span>
						</div>
						<div class="priceBox">
							<span class="priceLeft">부가세 10%</span><span class="priceRight"><strong>${tax }원</strong></span>
							<input type="hidden" name="comn" value="${tax }">
						</div>
						<div class="priceBox" style="font-size: 25px;">
							<span class="priceLeft" style="color: #FFB200;">최종 금액</span><span class="priceRight"><strong style="color: #FFB200;">${allPrice }원</strong></span>
							<input type="hidden" name="pay_price" value="${allPrice }">
							<input type="hidden" name="petsitter_price" value="${price }">
						</div>
					</div>
				</div>
				<div class="bookNotice">
					<div>
						<br>
						<strong>예약요청 전 꼭 확인해주세요!</strong><br>
* 예약을 위해 강아지에 대한 내용을 돌보미에게 상세히 적어주세요.<br>
* 메시지 내용은 안전거래 등의 목적으로 회사가 열람, 수집할 수 있습니다.<br>
					</div>
				</div>
				<div class="bookTextArea">
					<div>
					<textarea rows="5" cols="50" name="bk_content" placeholder="돌보미에게 전달할 요청 사항을 입력해주세요."></textarea>
					</div>
				</div>
				<div class="modifyBtnBox">
				<input type="hidden" name="ps_email" value="${ps_email }">
					<button type="submit" class="modifyBtn2">
						<label>예약하기</label>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>