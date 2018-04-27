<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Want to start your travel agency online and need website for your travel business? Start with travel agency responsive website template. Its absolutely free.">
    <meta name="keywords" content="travel, tour, tourism, honeymoon pacakage, summer trip, exotic vacation, destination, international, domestic website template, holiday, travel agecny responsive website template">
    <title>Tour and Travel Agency - Responsive Website Template</title>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%--<script src="<c:url value='/resources/js/jquery.min.js'/>" type="text/javascript"></script> --%> 
   <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"> </script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/resources/js/sojaeji.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/resources/js/menumaker.js'/>" type="text/javascript"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/jquery.sticky.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/sticky-header.js'/>"></script>
    
    <!-- Bootstrap -->
    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Style CSS -->
    <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="<c:url value='/resources/css/font-awesome.min.css'/>" rel="stylesheet">
    
    <!-- 지호 체크박스 CSS  -->
     <link href="<c:url value='/resources/css/checobox.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/main-common.css'/>">
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
 	<link href="<c:url value='/resources/css/jquery.nice-number.css'/>" rel="stylesheet">
 	
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"> </script>
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
	<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
     <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!--<script src="<c:url value='/resources/js/jquery.min.js'/>" type="text/javascript"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/resources/js/menumaker.js'/>" type="text/javascript"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/jquery.sticky.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/sticky-header.js'/>"></script>
     <script type="text/javascript" src="<c:url value='/resources/js/jquery.nice-number.js'/>"></script>
	
    
    
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="main">
		<tiles:insertAttribute name="main"/>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
</body>
</html>