<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("MfMVXKoyjlrxFxb21n3w", "http://localhost:8090/project/member/navercallback.jsp");
  // ì ê·¼ í í° ê° ì¶ë ¥
  alert(naver_id_login.oauthParams.access_token);
  // ë¤ì´ë² ì¬ì©ì íë¡í ì¡°í
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // ë¤ì´ë² ì¬ì©ì íë¡í ì¡°í ì´í íë¡í ì ë³´ë¥¼ ì²ë¦¬í  callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
  }
</script>
</body>
</html>



