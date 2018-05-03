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
    <!-- bootstrap-daterangepicker -->
    <link href="<c:url value="/resources/admin/vendors/bootstrap-daterangepicker/daterangepicker.css" />" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<c:url value="/resources/admin/build/css/custom.min.css" />" rel="stylesheet">

</head>

<%

String login = (String)session.getAttribute("login");
if(login == null)login="";
System.out.println("넘어온 세션로그인값 :"+login);

if(login.equals("admin")){

%>


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

	
  <!-- jQuery -->
    <script src="<c:url value="/resources/vendors/jquery/dist/jquery.min.js" />"></script>
    <!-- Bootstrap -->
    <script src="<c:url value="/resources/admin/vendors/bootstrap/dist/js/bootstrap.min.js" />"></script>
    <!-- FastClick -->
    <script src="<c:url value="/resources/admin/vendors/fastclick/lib/fastclick.js" />"></script>
    <!-- NProgress -->
    <script src="<c:url value="/resources/admin/vendors/nprogress/nprogress.js" />"></script>
    <!-- Chart.js -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="<c:url value="/resources/admin/vendors/gauge.js/dist/gauge.min.js" />"></script>
    <!-- Custom Theme Scripts -->
    <script src="<c:url value="/resources/build/js/custom.min.js" />"></script>
    <!-- bootstrap-progressbar -->
    <script src="<c:url value="/resources/admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js" />"></script>
  
   
    DateJS
    <script src="<c:url value="/resources/admin/vendors/DateJS/build/date.js" />"></script> 

</body>
	
<%}else { %>



      <link rel="stylesheet" href="<c:url value="/resources/admin/error/css/style.css" />">



<body>

  <a href="https://codepen.io/ZonFire99/full/njdls/" class="viewFull" target="_parent">View in full it looks way better :)</a>

<div class="error">

<div class="wrap">
  <div class="404">
	 <span class="green">&lt;!</span><span>DOCTYPE html</span><span class="green">&gt;</span>
<span class="orange">&lt;html&gt;</span>
    <span class="orange">&lt;style&gt;</span>
   * {
		        <span class="green">everything</span>:<span class="blue">awesome</span>;
}
     <span class="orange">&lt;/style&gt;</span>
 <span class="orange">&lt;body&gt;</span> 
              잘못된 접근입니다!
				<span class="comment">&lt;!--The file you are looking for, 
					is not where you think it is.--&gt;
		</span>
 <span class="orange"></span> 
			  


</div>
<br />
<span class="info">
<br />

<span class="orange">&nbsp;&lt;/body&gt;</span>

<br/>
      <span class="orange">&lt;/html&gt;</span>
  </div>
</div>


</span>
  
  

    <script  src="<c:url value="/resources/admin/error/js/index.js" />"></script>




</body>




<%} %>


</html>