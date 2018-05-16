<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
var aaa;
function reviewInsert(ps_email,bk_num){
	//var email = ps_email;
	//var num = bk_num;
	aaa = window.open("<c:url value='/reviewInsert?ps_email=" + ps_email +"&bk_num="+ bk_num +"'/>","_blank","width=600px,height=500px");
	
}

</script>
<script>
$(document).ready(function(){
	//이미지 hover 효과
	$('.sitterImg img').hover(function(){
		$(this).css({"border":"5px solid #4d8638","cursor":"pointer"});
		$(this).css("opacity","0.5");
		var left = $(this).offset().left;
		var top = $(this).offset().top;
		$('#delete').html("<div style='position:absolute; width:100px; height:50px;'><h1>삭제</h1></div>")
		$('#delete').css("left",left+65)
		$('#delete').css("top",top+70)
	},function(){
		$(this).css("opacity","1");
		$(this).css("border","");
		$("#delete").html("")
	});
	
	
 	$('.sitterImg img').click(function(){
		var img = $(this);
		var input = img.next('input[name=sitterImgFile]');
		//var submit = input.next('.ps_imgSubmit');
		input.trigger("click");
		input.change(function(){
				var fd = new FormData(input.parent(".sitterImgForm")[0]);
				$.ajax({
					url:"<c:url value='/myImgUpload'/>",
					data:fd,
					processData:false,
					contentType:false,
					type:'post',
					dataType:"json",
					success:function(data){
					$("#ps_image").html("");
						console.log(data)
						img.prop("src",data.ps_saveimage);
					}
				});
			//});
		});
	});
	
	
});


</script>
<div class="sitterPageContent">
	<div class="petsitterPageMenu">
		<div class="sitterImg">
			<form class="sitterImgForm">
			<c:choose>
				<c:when test="${sessionScope.m_saveimage eq null }">
					<img src="<c:url value='/resources/images/noprofile.png'/>">
				</c:when>
				<c:otherwise>
					<img src="<c:url value='/resources/upload/${sessionScope.m_saveimage }'/>">	
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
		<div class='mypageMenubar'>
			<div class="menubarDiv"><span><a href="<c:url value='/mypage?page=top&dtld=reservation'/>">예약 중인 내역</a></span></div>
			<div class="menubarDiv"><span><a href="<c:url value='/mypagePrevlist?page=top&dtld=prevReservation'/>">이전 예약 내역</a></span></div>
		</div>
		
		<div class="reservationInfo">
			<c:choose>
				<c:when test="${dtld eq 'reservation'}">
					<div class="">
						<table class="bookTable">
							<tr style="border-bottom:1px solid gray;">
								<th>돌봄 시작 날짜</th><th>돌봄 끝 날짜</th><th>돌보미 상세</th><th>맡기는 반려견</th>
							</tr>
							
								<c:forEach var="mlist" items="${mbookList }">
									<tr>
										<td>${mlist.bk_startdate }</td>
										<td>${mlist.bk_enddate }</td>
										<td><a href="<c:url value='/detail?ps_email=${mlist.ps_email }'/>">${mlist.ps_name }</a></td>
										<c:choose>
											<c:when test="${mlist.count>1 }">
												<td>${mlist.pi_name } 외 ${mlist.count-1 }마리</td>
											</c:when>
											<c:otherwise>
												<td>${mlist.pi_name }</td>	
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
						</table>
						<!-- 페이징 -->
								<div class="paging">
									<ul class="pagination">
									<c:choose>
										<c:when test="${pu.startPageNum>9 }">
											 <li><a aria-label="Previous" href="<c:url value='/mypage?pageNum=${pu.startPageNum-1 }&page=list&dtld=reservation'/>"><span aria-hidden="true">&laquo;</span></a></li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a aria-label="Previous" href="#"><span aria-hidden="true">&laquo;</span></a> </li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
										<c:choose>
											<c:when test="${i==pu.pageNum }">
												<!-- 현재페이지 색상 다르게 표시하기 -->
												 <li class="active"><a href="<c:url value='/mypage?pageNum=${i }&page=list&dtld=reservation'/>">${i }</a></li>
											</c:when>
											<c:otherwise>
												 <li><a href="<c:url value='/mypage?pageNum=${i }&page=list&dtld=reservation'/>">${i }</a></li>
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
				<c:when test="${dtld eq 'prevReservation' }">
					<div class="">
						<table class="bookTable">
							<tr style="border-bottom:1px solid gray;">
								<th>돌봄 시작 날짜</th><th>돌봄 끝 날짜</th><th>돌보미 상세</th><th>맡긴 반려견</th><th>리뷰</th>
							</tr>
								<c:forEach var="plist" items="${prevList }">
									<tr>
										<td>${plist.bk_startdate }</td>
										<td>${plist.bk_enddate }</td>
										<td><a href="<c:url value='/detail?ps_email=${plist.ps_email }'/>">${plist.ps_name }</a></td>
										<c:choose>
											<c:when test="${plist.count>1 }">
												<td>${plist.pi_name } 외 ${plist.count-1 }마리</td>
											</c:when>
											<c:otherwise>
												<td>${plist.pi_name }</td>	
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${plist.bk_review eq 0}">
												<td>
													<a href="javascript:void(0);" onclick="reviewInsert('${plist.ps_email}','${plist.bk_num }');">리뷰 작성하기</a>
												</td>
											</c:when>
											<c:otherwise>
												<td>
													리뷰 작성 완료
												</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
						</table>
						<!-- 페이징 -->
								<div class="paging">
									<ul class="pagination">
									<c:choose>
										<c:when test="${pu.startPageNum>9 }">
											 <li><a aria-label="Previous" href="<c:url value='/mypagePrevlist?pageNum=${pu.startPageNum-1 }&page=list&dtld=prevReservation'/>"><span aria-hidden="true">&laquo;</span></a></li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a aria-label="Previous" href="#"><span aria-hidden="true">&laquo;</span></a> </li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
										<c:choose>
											<c:when test="${i==pu.pageNum }">
												<!-- 현재페이지 색상 다르게 표시하기 -->
												 <li class="active"><a href="<c:url value='/mypagePrevlist?pageNum=${i }&page=list&dtld=prevReservation'/>">${i }</a></li>
											</c:when>
											<c:otherwise>
												 <li><a href="<c:url value='/mypagePrevlist?pageNum=${i }&page=list&dtld=prevReservation'/>">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

								<c:choose>
									<c:when test="${pu.endPageNum<pu.totalPageCount }">
										  <li class="disabled"><a href="<c:url value='/mypagePrevlist?pageNum=${pu.endPageNum+1 }&page=list&dtld=prevReservation'/>" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
									</c:when>
									<c:otherwise>
								 		 <li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
									</c:otherwise>
								</c:choose>
								</ul>
							</div>
					</div>
				</c:when>
			</c:choose>
			
		</div>
	</div>
</div>