<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- Style CSS -->
    <script src="<c:url value='/resources/js/zInput.js'/>" type="text/javascript"></script>
    <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">



</head>
<body>
<div id="wrap">
	<div id="shopheader">
		<tiles:insertAttribute name="header1"/>
	</div>
	<div id="shopheader2">
		<tiles:insertAttribute name="header2"/>
	</div>
	<div id="shopmain">
		<tiles:insertAttribute name="main1"/>
	</div>
	<div id="shopfooter">
		<tiles:insertAttribute name="footer1"/>
	</div>
</div>
</body>
</html>