<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><meta name="google-signin-client_id"
	content="727767732831-h42umslkvj83qdlqatd2pabf04225vo8.apps.googleusercontent.com">
	
    <title>로그인폼 </title>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 	 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <!-- 구글 -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<!-- 카카오 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- Bootstrap -->
    <link href="resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="resources/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="resources/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="resources/build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form>
              <h1>로그인하기</h1>
              <div>
                <input type="text" class="form-control" placeholder="이메일" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="비밀번호" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="index.html">로그인</a>
                <a class="reset_pass" href="#">비밀번호 찾기</a>
            	<br>
		<!-- 카톡 페이스북 네이버 로그인 -->
	<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
            	<br>
	<div class="g-signin2" data-onsuccess="onSignIn" style="text-align:left;"></div>
	
	<!-- 로그아웃하기 -->
	<!-- <a href="#" onclick="signOut();">Sign out</a> -->
            	<br>
            	
            	<div id="naver_id_login" style="width: 200px;"></div>
            	
              </div>


              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">가입하고 싶으세요?
                  <a href="#signup" class="to_register"> 계정 만들기 </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> 펫케어</h1>
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
                <input type="text" class="form-control" placeholder="Username" required="" />
              </div>
              <div>
                <input type="email" class="form-control" placeholder="Email" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="index.html">Submit</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                  <a href="#signin" class="to_register"> Log in </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> PETCARE!</h1>
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
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v1/user/me',
          success: function(res) {
            alert(JSON.stringify(res));
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  //]]>
</script>


<script type="text/javascript">


function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	/*   alert('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  alert('Name: ' + profile.getName());
	  alert('Image URL: ' + profile.getImageUrl());
	  alert('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present. */
	}

</script>
  
  
  <script type="text/javascript">
  
  	var naver_id_login = new naver_id_login("MfMVXKoyjlrxFxb21n3w", "http://localhost:8090/project/member/navercallback.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8090/");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
  
</html>
