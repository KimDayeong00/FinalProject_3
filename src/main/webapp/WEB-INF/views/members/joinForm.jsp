<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/JavaScript" src="resources/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.sticky/1.0.4/jquery.sticky.js"></script>
<link rel="stylesheet" href="resources/css/jForm.css">
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

	/* 이메일 유효성 체크 */
    $("#m_email").on("blur",function(){
    	var inputed = $("#m_email").val();
    	$.ajax({
    		
    		data:{email : inputed},
    		url: "<c:url value='/emailC' />",
    		type:"post",
    		dataType:"json",
    		success:function(data){
    			if(data.result == true){
    				$("#email").css("color","white");
    				$("#email").html("사용 가능한 이메일 입니다.");
    				
    			}else{
    				$("#email").css("color","red");
    				$("#email").html("이미 사용중인 이메일 입니다.");
    			}
    		}
    	});
    });



});


</script>

<%

String email = "";
email = (String)session.getAttribute("email");


%>


<div class="wrap1">
	<div class='signup-modal'>
		<div class='heading'>
			<h3 style="color: white;">회원가입(일반회원용)</h3>
		</div>
		<form name="f" method="post" onsubmit="return sendIt();"
			action="<c:url value="/joinM" />">
			<div class='content'>
				<div class='field-group'>
					<input class='signup-form' name='m_email' id="m_email"
						placeholder='이메일' type='email' required="required"  value="<%=email  %>">
					<br> <span id="email"></span>
				</div>
				<div class='field-group'>
					<input class='signup-form' name='m_pwd' id="m_pwd"
						placeholder='비밀번호' type='password' required="required"><br>
					<span id="pwd" style="color: red;"></span>
				</div>
				<div class='field-group'>
					<input class='signup-form' name='confirmpassword'
						id="confirmpassword" placeholder='비밀번호 확인' type='password'
						required="required"><br> <span id="pwd_ok"
						style="color: red;"></span>
				</div>
				<div class='field-group'>
					<input class='signup-form' name='m_name' id="m_name"
						placeholder='이름' type='text' required="required">
				</div>
				<div class='field-group'>
					<input class='signup-form' name='m_phone' id="m_phone"
						placeholder='핸드폰번호' type='phone' required="required"> <br>
					<span id="phone" style="color: red;"></span>
				</div>
				<div class='field-group'>
					<input class='signup-form' name='m_addr' id="m_addr"
						placeholder='주소' onclick="goPopup();" type='text'
						required="required">

				</div>









				<input class='signup-button' type='submit' value='가입하기'>
			</div>
		</form>
		<div class='content'>
			<p>
				이미 회원이신가요? <span> <a class='link' href='#'> 로그인하기 </a>
				</span>
			</p>
		</div>
	</div>


</div>
