<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Image Search</title>

<script type="text/JavaScript"
	src="<c:url value='/resources/js/jquery-3.3.1.min.js' />"></script>
<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
html, body {
	width: 100%;
	height: 100%;
}

body {
	background: radial-gradient(ellipse at center, rgba(194, 234, 219, 1) 0%,
		rgba(227, 215, 242, 1) 74%, rgba(227, 215, 242, 1) 74%);
	background-size: 300%;
	padding: 3em;
	color: #333;
	font-family: 'Source Sans Pro';
	font-size: 20px;
	font-weight: 300;
}

#searchform {
	display: block;
	margin: 0 auto;
	width: 100%;
	max-width: 500px;
	transform: translateY(10%);
}

span {
	font-size: 1.5em;
}

#search-bar {
	display: block;
	margin: .25em 0 0;
	width: 100%;
	padding: .25em .5em;
	font-size: 1.2em;
}

.output {
	list-style: none;
	width: 100%;
	min-height: 0px;
	border-top: 0 !important;
	color: #767676;
	font-size: .75em;
	transition: min-height 0.2s;
	position: absolute;
	z-index: 5;
}

.output, #search-bar {
	background: #fff;
	border: 1px solid #767676;
}

.prediction-item {
	padding: .5em .75em;
	transition: color 0.2s, background 0.2s;
}

.output:hover .focus {
	background: #fff;
	color: #767676;
}

.prediction-item:hover, .focus, .output:hover .focus:hover {
	background: #ddd;
	color: #333;
}

.prediction-item:hover {
	cursor: pointer;
}

.prediction-item strong {
	color: #333;
}

.prediction-item:hover strong {
	color: #000;
}

p {
	margin-top: 1em;
}

h1 {
	color: #439973;
	padding-bottom: 5px;
	border-bottom: 2px dotted #439973;
	font-family: 'Patua One';
}

#submit {
	display: block;
	margin: .5em 0 2.5em;
	padding: .25em .5em;
	font-size: 1.2em;
	color: #439973;
	border: 1px solid #439973;
	background: 0;
	transition: color 0.2s, background 0.2s;
}

#submit:hover {
	color: #fff;
	background: #439973;
}

/** custom normalize.css */
*, *:before, *:after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	main, nav, section, summary {
	display: block
}

audio, canvas, video {
	display: inline-block
}

audio
:not
 
(
[
controls
]
 
){
display
:
 
none
;

	
height
:
 
0
}
[hidden], template {
	display: none
}

html {
	font-family: sans-serif;
	-ms-text-size-adjust: 100%;
	-webkit-text-size-adjust: 100%
}

body {
	margin: 0
}

a {
	background: 0 0
}

a:focus {
	outline: thin dotted
}

a:active, a:hover {
	outline: 0
}

h1 {
	font-size: 2em;
	margin: .67em 0
}

abbr[title] {
	border-bottom: 1px dotted
}

b, strong {
	font-weight: 700
}

dfn {
	font-style: italic
}

hr {
	height: 0
}

mark {
	background: #ff0;
	color: #000
}

code, kbd, pre, samp {
	font-family: monospace, serif;
	font-size: 1em
}

pre {
	white-space: pre-wrap
}

q {
	quotes: "\201C" "\201D" "\2018" "\2019"
}

small {
	font-size: 80%
}

sub, sup {
	font-size: 75%;
	line-height: 0;
	position: relative;
	vertical-align: baseline
}

sup {
	top: -.5em
}

sub {
	bottom: -.25em
}

img {
	border: 0
}

svg
:not
 
(
:root
 
){
overflow
:
 
hidden


}
figure {
	margin: 0
}

fieldset {
	border: 1px solid silver;
	margin: 0 2px;
	padding: .35em .625em .75em
}

legend {
	border: 0;
	padding: 0
}

button, input, select, textarea {
	font-family: inherit;
	font-size: 100%;
	margin: 0
}

button, input {
	line-height: normal
}

button, select {
	text-transform: none
}

button, html input[type=button], input[type=reset], input[type=submit] {
	-webkit-appearance: button;
	cursor: pointer
}

button[disabled], html input[disabled] {
	cursor: default
}

input[type=checkbox], input[type=radio] {
	padding: 0
}

input[type=search] {
	-webkit-appearance: textfield;
}

input[type=search]::-webkit-search-cancel-button, input[type=search]::-webkit-search-decoration
	{
	-webkit-appearance: none
}

button::-moz-focus-inner, input::-moz-focus-inner {
	border: 0;
	padding: 0
}

textarea {
	overflow: auto;
	vertical-align: top
}

table {
	border-collapse: collapse;
	border-spacing: 0
}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body>
	<!-- <div id="div_ajax_load_image"></div> -->
	
	<form id="searchform" name="searchform" method="post" enctype="multipart/form-data" >

		<h1>이미지로 검색하기</h1>
		<div class="img_wrap" >
			<img id="img" style="width: 300px; height: 300px; " />
		</div>


		
		<input type="file" id="input_img" name="media" /><br> 
		<input type="text" id="dog" name="dog"  />
		<ul class="output" style="display: none;">
		</ul>
		
		<input type="button" value="적용하기" id="submit" onclick="gogo();">
	<input type="hidden" id="dogName" name="dogName">
	</form>
	
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>




	<script type="text/javascript">
		var sel_file;
		var dog_name;
		$(document).ready(function() {
			 $("#input_img").on("change", handleImgFileSelect); 
			$("#input_img").change(function(){
				var formData = new FormData();
				formData.append("media", $("input[name=media]")[0].files[0]);
		             $.ajax({
		                url: '<c:url value="/tensorSearch" />',
		                processData: false, 
		                contentType: false,
		                data: formData,
		                type: 'POST',
		                dataType:"json",
		                success: function(result){
		                  //  var aa=decodeURI(result.dog);
		                    $("#dog").val(result.dog);
    		                var dogs = result.dog.split("(");
							dog_name = dogs[0];
		                    document.getElementById("dogName").value = dog;
		                }
		                , beforeSend: function () {
		                    var width = 0;
		                    var height = 0;
		                    var left = 0;
		                    var top = 0;

		                    width = 50;
		                    height = 50;


		                    top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
		                    left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

		       

		                    
		                    if($("#div_ajax_load_image").length != 0) {
		                           $("#div_ajax_load_image").css({
		                                  "top": top+"px",
		                                  "left": left+"px"
		                           });
		                           $("#div_ajax_load_image").show();
		                    }
		                    else {
		                           $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="<c:url value="/resources/images/ajax_loader4.gif" />" style="width:50px; height:50px;"></div>');
		                    }

		             }
		             , complete: function () {
		                           $("#div_ajax_load_image").hide();
		             }



		            });
		         });


			 
			
			
		 
		
		
		
		
		});

		function handleImgFileSelect(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}

				sel_file = f;

				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		
		
		
		
		
		
		   function gogo() {
			   var nsrc = $("#img").prop("src");
			   opener.CallBack(dog_name, nsrc);
			   window.close();
		}  
		 
		
	</script>


</body>

</html>






<!-- <style type="text/css">
.img_wrap {
	width: 300px;
	margin-top: 50px;
}

.img_wrap img {
	max-width: 100%;
}
</style>

<script type="text/JavaScript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./js/jquery-3.1.0.min.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var sel_file;

	$(document).ready(function() {
		$("#input_img").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}

			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
</head>

<body>


	<div>
		<div>
			<h2>
				<b>이미지 미리보기</b>
			</h2>
			<p class="title">이미지 업로드</p>
			<input type="file" id="input_img" />
		</div>

		<div>
			<div class="img_wrap">
				<img id="img" />
			</div>
		</div>
		<span id="dog"></span> <input type="button" value="검색하기">
	</div>


</body>
</html> -->


