<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <!--  dailyui 011 by Karen. -->
<!--  Please open this page in Chrome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Josefin+Sans:400,600''>

      <style>
      .stroke-color {
  stroke: #DEAB57;
}
.stroke-color.success {
  stroke: #228165;
}
.stroke-color.error {
  stroke: #AE4141;
}

.fill-color {
  fill: #DEAB57;
}
.fill-color.success {
  fill: #228165;
}
.fill-color.error {
  fill: #AE4141;
}

.success {
  color: #1f745b;
}

.error {
  color: #9d3b3b;
}

@-webkit-keyframes loading {
  to {
    stroke-dashoffset: 12;
  }
}
@-moz-keyframes loading {
  to {
    stroke-dashoffset: 12;
  }
}
@keyframes loading {
  to {
    stroke-dashoffset: 12;
  }
}
body {
  font-family: 'Josefin Sans', sans-serif;
  background: #F8F6D9;
  color: #c89a4e;
}

.outer {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  box-shadow: 3px 6px 6px 0 rgba(197, 195, 169, 0.8);
  background: #fff;
  padding: 12px 24px;
}

.submit {
  border-top-left-radius: 40px;
  border-top-right-radius: 40px;
  border-bottom-right-radius: 40px;
  border-top-right-radius: 40px;
  border-bottom-left-radius: 40px;
  border-bottom-right-radius: 40px;
  border-bottom-left-radius: 40px;
  border-top-left-radius: 40px;
  font: bold 1em/1em 'Josefin Sans', sans-serif;
  padding: 6px 12px;
  width: 150px;
  margin: 10px auto;
  height: 48px;
  display: block;
  color: #50CAA7;
  border: 3px solid #50CAA7;
  outline: none;
  background: #fff;
}
.submit:hover {
  border-color: #50B7CA;
  color: #50B7CA;
}
.submit:active {
  border-color: #7D50CA;
  color: #7D50CA;
}

svg {
  display: block;
  margin: 0 auto;
}

.loading {
  stroke-dasharray: 8;
  animation: loading 1s linear;
}

.title {
  font: bold 2em/2em 'Josefin Sans', sans-serif;
  text-align: center;
  display: block;
}

.msg {
  font: normal 1.2em/1.2em 'Josefin Sans', sans-serif;
  text-align: center;
  display: block;
  margin: 0 auto 12px auto;
  color: #888;
}
      
      
      </style>

<div id="wrap" style="width: 300px; height: 600px;">
<div class="outer">
	<svg width="200px" height="200px" version="1.1" xmlns="http://www.w3.org/2000/svg">
		<!-- mouth -->
		<path d="M80 114, C84 114,116 114, 120 114" fill="none" stroke-width="6" stroke-linecap="round" class="mouth stroke-color" />
		<!-- eyes -->
		<circle cx="120" cy="90" r="6" class="fill-color eye" />
		<circle cx="80" cy="90" r="6" class="fill-color eye" />
		<!-- face -->
		<circle cx="100" cy="100" r="50" stroke-width="6" fill="none" class="stroke-color face" />
	</svg>
	<strong class="title">Daily UI</strong>
	<p class="msg">Please click the button, try it!</p>
	<button class="submit">GO!</button>	
</div>

</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  
<script>
var xDisappointed = function() {
	$('.mouth').attr('class', 'mouth stroke-color error');
	$('.eye').attr('class', 'eye fill-color error');
	$('.face').attr('class', 'face stroke-color error');
	$('.mouth').attr('d', 'M80 114, C84 100,116 100, 120 114');
	$('.title').addClass('error').text('OOPS!');
	$('.msg').text('요청작업에 실패하였습니다..');	
	$('.submit').text('메인 페이지로');
}

var errorStatus = function() {
	$('.mouth').attr('class', 'mouth stroke-color loading');
	setTimeout(xDisappointed, 1000);
}

var xSmaile = function() {
	$('.mouth').attr('class', 'mouth stroke-color success');
	$('.eye').attr('class', 'eye fill-color success');
	$('.face').attr('class', 'face stroke-color success');
	$('.mouth').attr('d', 'M80 114, C84 130,116 130, 120 114');
	$('.title').removeClass('error').addClass('success').text('GOOD!');
	$('.msg').text('요청 작업에 성공하였습니다.');
	$('.submit').text('메인 페이지로');
}

var successStatus = function() {
	$('.mouth').attr('class', 'mouth stroke-color error loading');
	setTimeout(xSmaile, 1000);
}

var xReset = function() {
	$('.mouth').attr('class', 'mouth stroke-color');
	$('.eye').attr('class', 'eye fill-color'),
	$('.face').attr('class', 'face stroke-color'),
	$('.mouth').attr('d', 'M80 114, C84 114,116 114, 120 114');
	$('.title').removeClass('success').text('Daily UI');
	$('.msg').text('Please click the button, try it!');
	$('.submit').text('GO!');
}
var step = 0;
var actions = [errorStatus, successStatus, xReset];


$( document ).ready(function() {
    
	var check = '<%=session.getAttribute("rlt")%>';
	if(check == "success"){
		successStatus();
	}else{
		errorStatus();
	}
	
});

$('.submit').click(function() {
	location.href="<c:url value='.main'/>";
});

</script>
