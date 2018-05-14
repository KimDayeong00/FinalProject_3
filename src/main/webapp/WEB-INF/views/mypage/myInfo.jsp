<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function checkIt(){
		if(!$("#agree").prop("checked")){
			alert("안내 사항에 동의해주세요");
			return false;
		}
	}
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
		document.getElementById("m_addr").value = 	roadAddrPart1+" "+addrDetail;
}
</script>
<script>
function sendIt() {
	   if (document.f.m_pwd.value.length<4 || document.f.m_pwd.value.length>12) {
		   document.getElementById("pwd").innerHTML = "비밀번호를 4~12자까지 입력해주세요.";	
           document.f.m_pwd.focus();
           document.f.m_pwd.select();
           return false;
       }

       //비밀번호와 비밀번호 확인 일치여부 체크
       if (document.f.m_pwd.value != document.f.confirmpassword.value) {
    	   document.getElementById("pwd_ok").innerHTML = "비밀번호가 일치하지 않습니다.";	
           document.f.confirmpassword.value = "";
           document.f.confirmpassword.focus();
           return false;
       }
 
}

</script>
<script>
$(function(){
	 
    $("#m_phone").on('keydown', function(e){
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
                    document.getElementById("phone").innerHTML = "";	
                }
                else
                {
                	document.getElementById("phone").innerHTML = "유효하지 않은 전화번호 입니다.";	
                    $(this).val("");
                    $(this).focus();
                }
            }
            else 
            {
            	document.getElementById("phone").innerHTML = "유효하지 않은 전화번호 입니다.";	
                      $(this).val("");
                $(this).focus();
            }
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
					<div class="menubarDivAcc"><span><a href="<c:url value='/my_account?page=account&dtld=accountUpdate'/>">계정 정보 수정</a></span></div>
					<div class="menubarDivAcc"><span><a href="<c:url value='/my_account?page=account&dtld=pwdUpdate'/>">비밀번호 변경</a></span></div>
					<div class="menubarDivAcc"><span><a href="<c:url value='/my_account?page=account&dtld=leave'/>">회원 탈퇴</a></span></div>
				</div>
					<div class="reservationInfo">
						<c:choose>
							<c:when test="${dtld eq 'accountUpdate' }">
								<div class="accountContent">
									<form method="post" action="<c:url value='my_account'/>">
										<div>
										<label>이메일</label><br>
										<input type="email" name="m_email" id="m_email" value="${memberVo.m_email }" style="width:100%" readonly="readonly">
										</div>
										<div>
										<label>이름</label><br>
										<input type="text" name="m_name" id="m_name" value="${memberVo.m_name }" required="required"><br>
										</div>
										<div>
										<label>휴대폰 번호</label><br>
										<input type="phone" name="m_phone" value="${memberVo.m_phone }" id="m_phone" required="required"><br><br>
										<span id="phone" style="color: red;"></span>
										</div>
										<div>
										<label>주소</label><br>
										<input type="text" name="m_addr" value="${memberVo.m_addr }" id="m_addr" onclick="goPopup();" style="width:100%" required="required"><br>
										</div>
										
	    								<button type="submit" class="modifyBtn">
										<label>수정하기</label>
									</button>
    								</form>
								</div>
							</c:when>
							<c:when test="${dtld eq 'pwdUpdate' }">
								<div class="accountContent">
									<form name="f" method="post" onsubmit="return sendIt();" action="<c:url value="/my_pwdUpdate" />">
									<div>
										<label>새 비밀번호</label><br>
									 	<input name='m_pwd' id="m_pwd" type='password' required="required" style="width:100%"><br>
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
									<form action="<c:url value='/mypageLeave'/>" method="post" onsubmit="return checkIt();">
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
	</div>
</div>