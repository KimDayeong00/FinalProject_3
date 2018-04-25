<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <link rel="stylesheet" href="resources/css/jForm.css">
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




	<div class="wrap1" style='background:url("<c:url value="resources/images/dogback.jpg" />") no-repeat;'>
  <div class='signup-modal'>
  <div class='heading'>
    <h3 style="color: white;">회원가입(펫시터용)</h3>
  </div>
  	<form name="f" method="post" onsubmit="return sendIt();" action="<c:url value="/joinP" />">
  <div class='content'>
    <div class='field-group'>
      <input class='signup-form' name='ps_email' id="ps_email" placeholder='이메일' type='email' required="required">
    </div>
    <div class='field-group'>
      <input class='signup-form' name='ps_pwd' id="ps_pwd"  placeholder='비밀번호' type='password' required="required">
    </div>
    <div class='field-group'>
      <input class='signup-form' name='confirmpassword' id="confirmpassword"  placeholder='비밀번호 확인' type='password' required="required">
    </div>
    <div class='field-group'>
      <input class='signup-form' name='ps_phone' id="ps_phone"  placeholder='핸드폰번호' type='phone' required="required">
    </div>
    <div class='field-group'>
      <input class='signup-form' name='ps_name' id="ps_name"  placeholder='이름' type='text' required="required">
    </div>
      <div class='field-group'>
      <input class='signup-form' name='ps_addr1' id="ps_addr1"  placeholder='주소' onclick="goPopup();" type='text' required="required">
    </div>
     <div class='field-group'>
      <input class='signup-form' name='ps_addr2' id="ps_addr2"  placeholder='상세주소'  type='text' required="required">
    </div>
   <div class='field-group'>
      <input class='signup-form' name='ps_content' id="ps_content"  placeholder='자기소개'  type='text' required="required">
    </div>
    	<input type="hidden" id="ps_lat" name="ps_lat" />
    	<input type="hidden" id="ps_lng" name="ps_lng" />
    <input class='signup-button' type='submit' value='가입하기'>
  </div>
  </form>
  <div class='content'>
    <p>
      이미 회원이신가요?
      <span>
        <a class='link' href='#'>
          로그인하기
        </a>
      </span>
    </p>
  </div>
</div>
  
  
</div>