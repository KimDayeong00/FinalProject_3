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
		$(".selectPetBox").hover(function(){
			$(this).css({"border":"1px solid #BABABA","cursor":"pointer"})
		},function(){
			$(this).css("border","");
		});
		
		$(".selectPetBox").click(function(){
			var selectPetBox = $(this);
			var check = selectPetBox.find(".check");
			var pCount = parseInt(petCount);
			var sCount = parseInt(smallPet);
			var bCount = parseInt(bigPet);
			var pi_weight = selectPetBox.find("#pi_weight").val();
			
				if(check.val()==0){
					if(pCount==count){
						alert("선택한 반려견의 수보다 많이 선택할 수 없습니다.")
					}else{					
						if(pi_weight<15){
							sc++;
							if(sCount<sc||sCount==0){
								alert("선택한 일반견의 수보다 많이 선택할 수 없습니다.");
								sc--;
							}else{
								check.prop("value","1");
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
								check.prop("value","1");
								selectPetBox.find("#checkImg").prop("src","<c:url value='/resources/images/bookcheck.png'/>");
								var pi_num = selectPetBox.find("#pi_num").val();
								petArray.push(pi_num);
								$("#selectPet").prop("value",petArray);
								count++;
							}
						}
						console.log("sc"+sc);
						console.log("sCount"+sCount);
						console.log("bc"+bc);
						console.log("bCount"+bCount);
					}
				}else{
					if(pi_weight<15){
						sc--;
					}else{
						bc--;
					}
					check.prop("value","0");
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
		if($(".check").val()==0){
			
			alert("반려견을 선택해주세요");
			
			return false;
		}

	}

</script>
<div id="content">
	<div class="reservationWrap">
		<h2>예약하기</h2>
		<div class="bookingDetail">
			<form action="<c:url value='/reservation_p'/>" method="post" onsubmit="return checkIt();">
				<div class="bookingWrap">
					<div class="checkTimeWrap">
						<div class="startdateBox">체크인 ${bk_startdate }</div>
						<div class="enddateBox">체크아웃 ${bk_enddate }</div>
						<div class="selectPetBox">일반견 ${smallPet }마리, 대형견${bigPet }마리 총 ${petCount }마리</div>
						<input type="hidden" name="bk_startdate" value="${bk_startdate }">
						<input type="hidden" name="bk_enddate" value="${bk_enddate }">
					</div>
					<div class="selectPetWrap">
						<p><strong>반려견 선택하기</strong></p>
						<div>
							<c:forEach var="pet" items="${petList }">
								<div class="selectPetBox">
									<div class="petImg"><img src="<c:url value='/resources/upload/${pet.pi_savefilename }'/>"><span>${pet.pi_name }</span></div>
									
									<img src="<c:url value='/resources/images/bookuncheck.png'/>" style="width:30px;height:30px;" id="checkImg">
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
							<span class="priceLeft">${ps_price }x${ps_day }박</span><span class="priceRight">${price }</span>
						</div>
						<div class="priceBox">
							<span class="priceLeft"></span><span class="priceRight"></span>
						</div>
						<div class="priceBox">
							<span class="priceLeft">부가세 10%</span><span class="priceRight">${tax }</span>
							<input type="hidden" name="comn" value="${tax }">
						</div>
						<div>
							<span class="priceLeft">최종 금액</span><span class="priceRight">${allPrice }</span>
							<input type="hidden" name="pay_price" value="${allPrice }">
							<input type="hidden" name="petsitter_price" value="${price }">
						</div>
					</div>
				</div>
				<div class="bookNotice">
					<div>
					
					</div>
				</div>
				<div class="bookTextArea">
					<textarea rows="5" cols="50" name="bk_content">
					
					</textarea>
				</div>
				<div>
				<input type="hidden" name="ps_email" value="${ps_email }">
					<button type="submit" class="modifyBtn2">
						<label>예약하기</label>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>