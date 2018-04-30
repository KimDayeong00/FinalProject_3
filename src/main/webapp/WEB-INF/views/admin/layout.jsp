<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	
    <!-- Bootstrap -->
    <link href="<c:url value="/resources/admin/vendors/bootstrap/dist/css/bootstrap.min.css" />" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<c:url value="/resources/admin/vendors/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
    <!-- NProgress -->
    <link href="<c:url value="/resources/admin/vendors/nprogress/nprogress.css" />" rel="stylesheet">
    <!-- iCheck -->
    <link href="<c:url value="/resources/admin/vendors/iCheck/skins/flat/green.css" />" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="<c:url value="/resources/admin/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" />" rel="stylesheet">
    <!-- JQVMap -->
    <link href="<c:url value="/resources/admin/vendors/jqvmap/dist/jqvmap.min.css" />" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="<c:url value="/resources/admin/vendors/bootstrap-daterangepicker/daterangepicker.css" />" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<c:url value="/resources/admin/build/css/custom.min.css" />" rel="stylesheet">

</head>
<body class="nav-md">
 <div class="container body">
      <div class="main_container">

	<div id="slide" >
		<tiles:insertAttribute name="slide"/>
	</div>
	
	
	<div id="header_a">
		<tiles:insertAttribute name="header_a"/>
	</div>


	
	<div id="main_a">
		<tiles:insertAttribute name="main_a"/>
	</div>

</div>
</div>
<%-- <c:url value="/resources/admin/vendors/skycons/skycons.js" /> --%>
  <!-- jQuery -->
    <script src="<c:url value="/resources/admin/vendors/jquery/dist/jquery.min.js" />"></script>
    <!-- Bootstrap -->
    <script src="<c:url value="/resources/admin/vendors/bootstrap/dist/js/bootstrap.min.js" />"></script>
    <!-- FastClick -->
    <script src="<c:url value="/resources/admin/vendors/fastclick/lib/fastclick.js" />"></script>
    <!-- NProgress -->
    <script src="<c:url value="/resources/admin/vendors/nprogress/nprogress.js" />"></script>
    <!-- Chart.js -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="<c:url value="/resources/admin/vendors/gauge.js/dist/gauge.min.js" />"></script>
    <!-- bootstrap-progressbar -->
    <script src="<c:url value="/resources/admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js" />"></script>
    <!-- iCheck -->
    <script src="<c:url value="/resources/admin/vendors/iCheck/icheck.min.js" />"></script>
    <!-- Skycons -->
    <script src="<c:url value="/resources/admin/vendors/skycons/skycons.js" />"></script>
    <!-- Flot -->
     <script src="<c:url value="/resources/admin/vendors/Flot/jquery.flot.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/Flot/jquery.flot.pie.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/Flot/jquery.flot.time.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/Flot/jquery.flot.stack.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/Flot/jquery.flot.resize.js" />"></script>
    Flot plugins
    <script src="<c:url value="/resources/admin/vendors/flot.orderbars/js/jquery.flot.orderBars.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/flot-spline/js/jquery.flot.spline.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/flot.curvedlines/curvedLines.js" />"></script>
    DateJS
    <script src="<c:url value="/resources/admin/vendors/DateJS/build/date.js" />"></script> 

</body>
	








</html>