<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<style>

body{
background: 
		linear-gradient(rgba(196, 102, 0, 0.6), rgba(155, 89, 182, 0.6));
}

/*form styles*/
#msform {
	width: 400px;
	margin: 50px auto;
	text-align: center;
	position: relative;
}
#msform fieldset {
	background: white;
	border: 0 none;
	border-radius: 3px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
	padding: 20px 30px;
	box-sizing: border-box;
	width: 80%;
	margin: 0 10%;
	
	/*stacking fieldsets above each other*/
	position: relative;
}
/*Hide all except first fieldset*/
#msform fieldset:not(:first-of-type) {
	display: none;
}
/*inputs*/
#msform input, #msform textarea {
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width: 100%;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 13px;
}
/*buttons*/
#msform .action-button {
	width: 100px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 5px;
}
#msform .action-button:hover, #msform .action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
/*headings*/
.fs-title {
	font-size: 15px;
	text-transform: uppercase;
	color: #2C3E50;
	margin-bottom: 10px;
}
.fs-subtitle {
	font-weight: normal;
	font-size: 13px;
	color: #666;
	margin-bottom: 20px;
}
/*progressbar*/
#progressbar {
	margin-bottom: 30px;
	overflow: hidden;
	/*CSS counters to number the steps*/
	counter-reset: step;
}
#progressbar li {
	list-style-type: none;
	color: white;
	text-transform: uppercase;
	font-size: 9px;
	width: 33.33%;
	float: left;
	position: relative;
}
#progressbar li:before {
	content: counter(step);
	counter-increment: step;
	width: 20px;
	line-height: 20px;
	display: block;
	font-size: 10px;
	color: #333;
	background: white;
	border-radius: 3px;
	margin: 0 auto 5px auto;
}
/*progressbar connectors*/
#progressbar li:after {
	content: '';
	width: 100%;
	height: 2px;
	background: white;
	position: absolute;
	left: -50%;
	top: 9px;
	z-index: -1; /*put it behind the numbers*/
}
#progressbar li:first-child:after {
	/*connector not needed before the first step*/
	content: none; 
}
/*marking active/completed steps green*/
/*The number of the step and the connector before it = green*/
#progressbar li.active:before,  #progressbar li.active:after{
	background: #27AE60;
	color: white;
}


.transition {
  font-family: 'Montserrat', sans-serif;
  -webkit-tap-highlight-color: transparent;
  -webkit-transition: background-color 0.3s, color 0.3s, width 0.3s, border-width 0.3s, border-color 0.3s;
  transition: background-color 0.3s, color 0.3s, width 0.3s, border-width 0.3s, border-color 0.3s;
}
.center-align {
  width: 200px;
  border: 2px solid #1ECD97;
  border-radius: 10px;
  height: 250px;
  position: absolute;
  left: 50%;
  padding: 1em;
  top: 50%;
  margin-top: -125px;
  margin-left: -100px;
}
input[type="radio"] {
  visibility: hidden;
  height: 0;
  width: 0;
}
label {
  text-align: center;
  vertical-align: middle;
  display: block;
  margin: 0 auto;
  padding: 0;
  border: 2px solid #1ECD97;
  border-radius: 40px;
  background: transparent;
  color: #1ECD97;
  letter-spacing: 1px;
  font-size: 18px;
  font-family: 'Montserrat', sans-serif;
  -webkit-tap-highlight-color: transparent;
  -webkit-transition: background-color 0.3s, color 0.3s, width 0.3s, border-width 0.3s, border-color 0.3s;
  transition: background-color 0.3s, color 0.3s, width 0.3s, border-width 0.3s, border-color 0.3s;
}
input[type="radio"]:checked + label,
input[checked="checked"] + label {
  background-color: #1ECD97;
  color: white;
}


</style>

<div id="wrap" style="width: 500px; height: 500px; margin-left: 700px;">
  <!-- multistep form -->
<form id="msform" action="<c:url value='pwd_okok' />" method="post">
  <!-- progressbar -->
  <ul id="progressbar">
    <li class="active">회원구분</li>
    <li>개인정보 입력</li>
    <li>비밀번호 변경</li>
  </ul>
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">회원 구분</h2>
    <h3 class="fs-subtitle">회원 종류를 선택하세요</h3>
    <input type="radio" name="size" id="size_1" value="member" checked />
 <label for="size_1">일반회원</label>
  
 <input type="radio" name="size" id="size_2" value="petsitter" />
 <label for="size_2">펫시터</label>
    <br><input type="button" name="next" class="next action-button" value="다음으로" />
  </fieldset>
  <fieldset>
    <h2 class="fs-title">개인정보 입력</h2>
    <h3 class="fs-subtitle">개인정보를 입력해 주세요</h3>
    <input type="email" name="email" id="email" placeholder="이메일 주소" />
    <input type="text" name="name" id="name" placeholder="이름" />
    <input type="text" name="phone" id="phone" placeholder="전화번호" />
    <span style="color: red;" id="errorMsg"></span>
    <input type="button" name="previous" class="previous action-button" value="이전으로" />
    <input type="button" name="next" class="next action-button" value="다음으로" />
  </fieldset>
  <fieldset>
    <h2 class="fs-title">비밀번호 변경</h2>
    <h3 class="fs-subtitle">변경하실 비밀번호를 입력해 주세요</h3>
    <input type="text" name="pwd" placeholder="비밀번호" />
    <input type="password" name="pwd_ok" placeholder="비밀번호 확인" />
    <input type="button" name="previous" class="previous action-button" value="이전으로" />
    <input type="submit" name="submit" class="submit action-button" value="변경" />
  </fieldset>
</form>

</div>


  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
  <script>

//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches
var count =0;
$(".next").click(function(){
	count++;
	var flag;
	//유효성 검사 하기
	if(count == 2){
		var gubun = $(":input:radio[name=size]:checked").val();
		var email = $("#email").val();
		var name = $("#name").val();
		var phone = $("#phone").val();
		if(gubun == "petsitter"){
			  $.ajax({
	                url: '<c:url value="/pwd?gubun=2&email='+email+'&name='+name+'&phone='+phone+'" />',
	                type: 'GET',
	                dataType:"json",
	                async: false,
	                success: function(result){
	                	flag = result.result;
	                },
	                error: function() {
	                }
	                });
		}else{
			 $.ajax({
	                url: '<c:url value="/pwd?gubun=1&email='+email+'&name='+name+'&phone='+phone+'" />',
	                type: 'GET',
	                dataType:"json",
	                async: false,
	                success: function(result){
	                	flag = result.result;
	                },
	                error: function() {
	                }
	                });
		}
		
	
		
	}	
	
	if(count == 2){
		if(flag == "ok"){
			$("#errorMsg").text("");
	}else{
		count--;
		$("#errorMsg").text("정보가 일치하지 않습니다.");
		return;
		
	}
	}
	
	
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({
        'transform': 'scale('+scale+')',
        'position': 'absolute'
      });
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});












$(".previous").click(function(){
	count--;
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".submit").click(function(){
	
	
})
  </script>

