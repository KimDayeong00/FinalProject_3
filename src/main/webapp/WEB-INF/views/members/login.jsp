<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>로그인폼</title>


<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 구글 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 카카오 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- Bootstrap -->
    <link href="<c:url value="/resources/admin/vendors/bootstrap/dist/css/bootstrap.min.css" />" rel="stylesheet">
 <!-- Font Awesome -->
    <link href="<c:url value="/resources/admin/vendors/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
    <!-- NProgress -->
    <link href="<c:url value="/resources/admin/vendors/nprogress/nprogress.css" />" rel="stylesheet">
<!-- Animate.css -->
<link href="resources/vendors/animate.css/animate.min.css"
	rel="stylesheet">

 <!-- Custom Theme Style -->
    <link href="<c:url value="/resources/build/css/custom.min.css" />" rel="stylesheet">


<script>

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("<c:url value="/send" />","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
}
</script>



</head>

<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a>

		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form action="<c:url value="/n_login" />"  method="post" id="myForm">
						<h1>로그인하기</h1>
						<div>
							<input type="text" class="form-control" placeholder="이메일" name="email"
								required="" onkeypress="if(event.keyCode == 13){ document.getElementById('myForm').submit() }"/>
						</div>
						<div>
							<input type="password" class="form-control" placeholder="비밀번호" name="pwd"
								required="" onkeypress="if(event.keyCode == 13){ document.getElementById('myForm').submit() }"
								/>
						</div>
						<div>
							<a class="btn btn-default submit" href="#" onclick="document.getElementById('myForm').submit()">로그인</a> <a
								class="reset_pass" href="#" onclick="goPopup();">비밀번호 찾기</a>

						</div>
						<div class="login_wrapper" style="float: left;">
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
						
							<a href="<c:url value="/sociallogin?type1=4" />" ><img style="float: left; margin-left: 50px; width: 222px; height: 50px;"
								src="resources/images/naver.PNG" /></a>

				
						</div>


						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								가입하고 싶으세요? <a href="<c:url value="/register1" />"> 계정 만들기 </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<a href="<c:url value="/" />"><i class="fa fa-paw"></i> 펫케어</a>
								</h1>
								<p>© 2020. All Rights Reserved. Privacy Policy</p>
							</div>
						</div>
					</form>
				</section>
			</div>

			<div id="register" class="animate form registration_form">
				<section class="login_content">
					<form>
						<h1>Create Account</h1>
						<div>
							<input type="text" class="form-control" placeholder="Username"
								required="" />
						</div>
						<div>
							<input type="email" class="form-control" placeholder="Email"
								required="" />
						</div>
						<div>
							<input type="password" class="form-control"
								placeholder="Password" required="" />
						</div>
						<div>
							<a class="btn btn-default submit" href="index.html">Submit</a>
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								Already a member ? <a href="#signin" class="to_register">
									Log in </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<i class="fa fa-paw"></i> PETCARE!
								</h1>
								<p>© 2020. All Rights Reserved. Privacy Policy</p>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
</body>
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
					alert( JSON.stringify(res));
					
					var emailM = JSON.stringify(res.kaccount_email);
					var emailLength = emailM.length;
					var newEmail = emailM.substr(1,(emailLength-2));
					location.href="<c:url value='/sociallogin?type1=2&email="+newEmail+"' />";
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
					location.href="<c:url value='/sociallogin?type1=3&email="+user_info.emails[0].value+"' />";
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

<!-- 
<script src="https://apis.google.com/js/platform.js?onload=renderButton"
	async defer></script>
<script>
	function onSuccess(googleUser) {
	/* 	var profile = googleUser.getBasicProfile();
		alert('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present. 
		email = profile.getEmail(); */
	}
	function onFailure(error) {
		console.log(error);
	}
	function renderButton() {
		gapi.signin2.render('my-signin2', {
			'scope' : 'profile email',
			'width' : 221.99,
			'height' : 48.98,
			'longtitle' : true,
			'theme' : 'white',
			'onsuccess' : onSuccess,
			'onfailure' : onFailure

		});
	}
	
	function check(googleUser){
		var profile = googleUser.getBasicProfile();
		alert('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present. 
	}
</script>
 -->


</html>
