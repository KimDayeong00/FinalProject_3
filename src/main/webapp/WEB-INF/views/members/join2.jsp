<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<!-- 구글 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 카카오 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <style>
  .out {
 width: 100%;
 text-align: center;
 }
  .in {
 display: inline-block;
 }
  
  </style>
  
  <link rel="stylesheet" href="resources/css/btn.css">

  <div class="out">
<div class="in">
	<img alt="로고" src="resources/images/logo1.png" style="width: 70%; height: 70%;"><br>
  
  <a href="<c:url value="/register?type=2&type1=1" />">
  <div class="button-fill orange">
    <div class="button-text">펫시터 가입하기</div>
    <div class="button-inside">
      <div class="inside-text">펫시터</div>
    </div>
  </div></a>
  
  
  
  <br><br>
  <div style="margin-left: 40px; margin-bottom: 200px;" >
  	<!-- 카톡 페이스북 네이버 로그인 -->
							<a id="kakao-login-btn" style="float: left; margin-left: 50px;"></a>
							<a href="http://developers.kakao.com/logout"></a> <br>
							<!-- 구글로그앤 -->
							<a href="#" id="login-button"><img style="float: left; margin-left: 50px;margin-bottom:5px; width: 222px; height: 50px;"
								src="resources/images/glogin.png" /></a>
							<br>
							<!-- 로그아웃하기 -->
							<!-- <a href="#" onclick="signOut();">Sign out</a> -->

							<br>
						
							<a href="<c:url value="/naverlogin" />" ><img style="float: left; margin-left: 50px; width: 222px; height: 50px;"
								src="resources/images/naver.PNG" /></a>
  
  
  
  </div>
  
  
  </div>
  </div>

    <script  src="resources/js/index.js"></script>
<script type='text/javascript'>
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('2233cec8886d267c657ec83ed182be8a');
	// 카카오 로그인 버튼을 생성합니다.
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			// 로그인 성공시, API를 호출합니다.
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					alert(JSON.stringify(res.kaccount_email));
				},
				fail : function(error) {
					alert(JSON.stringify(error));
				}
			});
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
	//]]>
</script>
<script async defer src="https://apis.google.com/js/api.js" onload="this.onload=function(){};HandleGoogleApiLibrary()" onreadystatechange="if (this.readyState === 'complete') this.onload()"></script>

<script>

// Called when Google Javascript API Javascript is loaded
function HandleGoogleApiLibrary() {
	// Load "client" & "auth2" libraries
	gapi.load('client:auth2', {
		callback: function() {
			// Initialize client library
			// clientId & scope is provided => automatically initializes auth2 library
			gapi.client.init({
				apiKey: 'AIzaSyD4wwy_d3C4rpb3vOwPX0EQYg9HwufgkpM',
		    	clientId: '727767732831-h42umslkvj83qdlqatd2pabf04225vo8.apps.googleusercontent.com',
		    	scope: 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/plus.me'
			}).then(
				// On success
				function(success) {
			  		// After library is successfully loaded then enable the login button
			  		$("#login-button").removeAttr('disabled');
				}, 
				// On error
				function(error) {
					alert('Error : Failed to Load Library');
			  	}
			);
		},
		onerror: function() {
			// Failed to load libraries
		}
	});
}

// Click on login button
$("#login-button").on('click', function() {
	$("#login-button").attr('disabled', 'disabled');
			
	// API call for Google login
	gapi.auth2.getAuthInstance().signIn().then(
		// On success
		function(success) {
			// API call to get user information
			gapi.client.request({ path: 'https://www.googleapis.com/plus/v1/people/me' }).then(
				// On success
				function(success) {
					console.log(success);
					var user_info = JSON.parse(success.body);
					console.log(user_info);
					alert(user_info.emails[0].value);

				},
				// On error
				function(error) {
					$("#login-button").removeAttr('disabled');
					alert('Error : Failed to get user user information');
				}
			);
		},
		// On error
		function(error) {
			$("#login-button").removeAttr('disabled');
			alert('Error : Login Failed');
		}
	);
});

</script>
