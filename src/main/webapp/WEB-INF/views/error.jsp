<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>Cute Dog Pure CSS</title>
  
  
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>

      <link rel="stylesheet" href="resources/css/error.css">

  
</head>

<body>

  <div class="text text-center pull-right" style="float:left; margin-right: 300px;">
   <h2>작업 처리에 실패하셨습니다.</h2>
  <br />
  <h4><a href="<c:url value="/" />">메인 페이지로</a></h4>
</div>
<div class="text text-center pull-left">
 
  
  
  
</div>

<div class="doggy center-block">
  <div class="ears center-block">
      <div class="earl"></div>
      <div class="earr"></div>
    </div>
  <div class="doggy-head center-block">    
    <div class="eyel"></div>
    <div class="eyer"></div>    
    <div class="muzzle center-block">      
      <div class="doggy-nose center-block"></div>
    </div>    
    <div class="collar"></div>
  </div>
  
  <div class="doggy-body">
    <div class="spot"></div> 
    <div class="frontPawL"></div>
    <div class="frontPawR"></div>
  </div>
</div>
<div class="table">
  <div class="paper center-block"></div>
  <div class="tea"></div>
</div>
  <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js'></script>

  

</body>

</html>
