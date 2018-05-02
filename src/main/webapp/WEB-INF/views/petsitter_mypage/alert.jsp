<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var msg = '${msg}';
	var url = '${url}';
	var page = '${page}';
	var dtld =  '${dtld}';
	
	var returnUrl = url+"?page="+page+"&dtld="+dtld; 
	alert(msg);
	document.location.href= returnUrl;
</script>
</body>
</html>