<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" ver="0" href="<c:url value='/resources/css/common.css' />">
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