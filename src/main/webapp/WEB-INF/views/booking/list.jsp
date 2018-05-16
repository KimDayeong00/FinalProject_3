<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	
<style>
#petsitterList {
	width: 50%;
	height: 600px;
	position: relative;
	float: left;
	overflow: scroll;
}

#map {
	width: 50%;
	height: 600px;
}

.mystyle {
	background-color: yellow;
}

.button {
	padding: 0.75em 2em;
	text-align: center;
	text-decoration: none;
	color: #2194E0;
	border: 2px solid #2194E0;
	font-size: 15px;
	display: inline-block;
	border-radius: 0.3em;
	transition: all 0.2s ease-in-out;
	position: absolute;
	overflow: hidden;
	margin-left: 50px;
	margin-top: -25px;
}

.button:before {
	content: "";
	background-color: rgba(255, 255, 255, 0.5);
	height: 50%;
	width: 3em;
	display: block;
	position: absolute;
	top: 0;
	left: -4.5em;
	-webkit-transform: skewX(-45deg) translateX(0);
	transform: skewX(-45deg) translateX(0);
	transition: none;
}

.button:hover {
	background-color: #2194E0;
	color: #fff;
	border-bottom: 4px solid #1977b5;
}

.button:hover:before {
	-webkit-transform: skewX(-45deg) translateX(13.5em);
	transform: skewX(-45deg) translateX(13.5em);
	transition: all 0.5s ease-in-out;
}
</style>
	
			<div class="divhover"  style="margin:10px; width: 99%; margin-top: 5px; padding: 10px; border: solid 2px #dcdcdc; border-radius: 10px;" ><!-- onmouseover="aaa(this)" onmouseout="bbb(this)" -->
				<div style="margin-left: 540px; font-size: 18px; font-weight: bold; "><span >지역을 선택하세요.</span><span style="margin-left: 375px;"> 날짜를 선택하세요.</span></div>
				<!-- <input type="button" value="이미지로검색" style="margin-left: 30px;"/> -->
				<div style="width:100%; margin-top: 10px;">
					<div style="float: left; margin-left: 400px;">
						<select style="width: 140px; height:31px; text-align:center; border-radius: 10px; font-size: 16px; font-stretch:100%;" class="addr" name="sido" id="sido" onmouseover="aaa(this)" onmouseout="bbb(this)"  > <option value="">광역시/도</option></select>
						<select style="width: 140px; height:31px; text-align:center; border-radius: 10px; font-size: 16px; font-stretch:100%;" class="addr" name="gugun" id="gugun" onmouseover="aaa(this)" onmouseout="bbb(this)" ><option value="">시군구</option></select>
						<select style="width: 140px; height:31px; text-align:center; border-radius: 10px; font-size: 16px; font-stretch:100%;" class="addr" name="dong" id="dong" onmouseover="aaa(this)" onmouseout="bbb(this)" ><option value="">동</option></select>					</div>
					<!-- <a href="javascript:tensor();" class="button">이미지로 검색</a> -->
					<div class="calendar" style="margin-left: 200px;" >
						<input onmouseover="aaa(this)" onmouseout="bbb(this)" type="text" id="selector" style="width: 240px; border-radius: 10px;" placeholder="시작날짜    >    마침날짜"> 
					</div>
				</div>
	<div style="text-align: center; margin-top: 10px;">
		<h4>조건을 선택하세요.</h4>
		<c:forEach var="vo" items="${filterlist }">
			<label class="checkbox-inline" onmouseover="ccc(this)" onmouseout="eee(this)"><input class="filterName" name="filterName" type="checkbox" value="${vo.fl_name}">${vo.f_type }</label>
		</c:forEach>
		<script>sojaeji();</script>
	</div>
</div>
<div id="petsitterList"></div>
<div id="map"></div>
<script type="text/javascript">
	var address = new Array();
	var map;
	var geocoder;
	var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var n = 0;
	var bk_startdate;
	var bk_enddate;
	var ref = 0;
	var filterchk = [];
	var infowindow;
   	$(".filterName").on("click",function(){
   		filterchk=[]
   	 $('input:checkbox[name="filterName"]').each(function() {
   	      if(this.checked){
   	            filterchk.push(this.value)
   	      }
   	 });
   	changeMap()
    })
    
    $(".addr").on("change",function(){
    	var addres = $("#sido").val()+" "+$("#gugun").val()+" "+$("#dong").val();
    	addreslist(addres);
    	setTimeout(function(){
    	 if($("#dong").val()!=""){
     		map.setZoom(17)
     	}else if($("#gugun").val()!=""){
     		map.setZoom(15)
     	}else if($("#sido").val()!=""){
     		map.setZoom(10)
     	} 
    	},100);
    })
	function initMap() {

    	geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(37.566535, 126.97796919999996);
        var mapOptions = {
        	 /*  
        	 좌측하단: (33.193668738614384, 124.82258606250002)
        	  우측상단: (38.53185554526987, 130.71125793750002)
        	  */
        	zoom: 7,
        	center:latlng,
    		mapTypeId: google.maps.MapTypeId.ROADMAP,
    		scrollwheel : true,
    		zoomControl : true,
    		streetViewControl : true,
    		mapTypeControl : true,
    		scaleControl : true,
    		overviewMapControl: true,
    		panControl : true	
        }
        	map = new google.maps.Map(document.getElementById('map'), mapOptions);
	        <c:forEach items="${alllist}" var="data" varStatus="status">
		        var lat = ${data.ps_lat};
		        var lng = ${data.ps_lng};
		      	var email = '${data.ps_email}';
		      	var name = '${data.ps_name}';
		      	var addr1 = '${data.ps_addr1}';
		      	var content = '${data.ps_content}';
		      	var img = '${data.pimg_savefilename}';
		      	var careprice = ${data.ps_careprice};
		      	var price = ${data.ps_price};
		      	var overprice = ${data.ps_overprice};
		      	/* var list = '${data.list}';
		      	console.log("list : "+list)
		      	for(var w=0; w<list.length; w++){
		      		console.log(list[w].f_type);
                } */
				address.push({email:email,name:name,addr1:addr1,content:content,lat:lat,lng:lng,img:img,price:price,careprice:careprice,overprice:overprice});
			</c:forEach>
			list1(address);
        	arraygetlist(37.566535,126.97796919999996,33.193668738614384, 124.82258606250002,38.53185554526987, 130.71125793750002)	
        function moveToLocation(lat, lng){
            var center = new google.maps.LatLng(lat, lng);
            map.panTo(center);
        }
        google.maps.event.addListener(map, 'dragend', function(){    // 드래그시 이벤트 추가
        	showMapPos();
            showMapAddr();
            if(infowindow){
            	infowindow.close();
            }
            getlist()
        });
       
        function showMapPos(){
        	var pos=map.getCenter();
        }
        function showMapAddr(){
        	geocoder.geocode( { 'location': map.getCenter()}, function(results, status) {
	        	if (status == google.maps.GeocoderStatus.OK) {
	            	var str="";
	                for(var i=3; i>=0; i--){
	                	str += " "+results[0].address_components[i].short_name;
	                }
	            }
            });
        }
       google.maps.event.addListener(map, 'zoom_changed', function() {
    	   if(infowindow){
           	infowindow.close();
           }
	    	getlist();
		}); 
	}
	function getlist() {
		var zoomLevel = map.getZoom();
		var bounds = map.getBounds();
		var endLo = bounds.getNorthEast();
		var startLo = bounds.getSouthWest();
		var pos = map.getCenter();
		/* console.log("Zoom: " + zoomLevel);
		$("#petsitterList").append("Zoom: " + zoomLevel+"<br>");
		$("#petsitterList").append("bounds: " + bounds+"<br>");
		$("#petsitterList").append("좌측하단: " + startLo+"<br>");
		$("#petsitterList").append("우측상단: " + endLo+"<br>");
		$("#petsitterList").append("차이lat: " + (endLo.lat()-startLo.lat())+"<br>");
		$("#petsitterList").append("차이lng: " + (endLo.lng()-startLo.lng())+"<br>");
		$("#petsitterList").append("맵 중앙 lat: " + pos.lat()+"<br>");
		$("#petsitterList").append("맵 중앙 lng: " + pos.lng()+"<br>"); */
		arraygetlist(pos.lat(), pos.lng(), startLo.lat(), startLo.lng(), endLo
				.lat(), endLo.lng());

	}
	function addreslist(address) {
		n = 0;
		var locations = new Array();
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			locations.push({
				lat : results[0].geometry.location.lat(),
				lng : results[0].geometry.location.lng()
			});
			map.setCenter(results[0].geometry.location);
			var bounds = map.getBounds();
			var endLo = bounds.getNorthEast();
			var startLo = bounds.getSouthWest();
			var pos = map.getCenter();
			getlist()
		});
	}
	var markerCluster;
	function list1(locations){
 		var markers = locations.map(function(location, j) {
	 				return new google.maps.Marker({
	 			    position: location,
	 			   	email:locations[j].email,
	 			   	name:locations[j].name,
	 			   	addr1:locations[j].addr1,
	 			   	content:locations[j].content,
	 			   	careprice:locations[j].careprice,
	 			   	price:locations[j].price,
	 			   	overprice:locations[j].overprice,
	 			   	img:locations[j].img,
	 				label: labels[j % labels.length]
	 				});
	 		});
 				infowindow = new google.maps.InfoWindow();
		 		for(var k=0; k<markers.length; k++){
		 			google.maps.event.addListener(markers[k],'click',function() {
		 				map.setZoom(17);
		 		    	map.setCenter(this.getPosition());
		 		    	setTimeout(function(){
			 		    	getlist();
		 		      	},100);
		 			var contentString =
		 				"<a href='<c:url value='/detail?ps_email="+this.email+"'/>'><div onmouseover='ccc(this)' onmouseout='ddd(this)' class='tour-block' style=' padding:0; margin:0; border:2px solid #dcdcdc; margin-top:5px;'>"+
        				"<div class='tour-img' style='width:200px;'>"+
        				"<img style='width:200px; height:200px;' src='<c:url value='/resources/upload/"+this.img+"'/>'>"+
                    	"</div>"+
                            "<div class='tour-content' style='width:200px;'>"+
                                "<h2>"+this.content+"</h2>"+
                                "<div class='tour-meta'>이름 : "+this.name+"</div>"+
                                "<span style='display: inline-block; color: gray; font-size: 20px; width:100%; margin:0px; padding:0px; margin-top:-5px; '>day care/"+this.careprice+"<br>1박/"+this.price+"<br>대형견 추가금/"+this.overprice+"</span>"+
                                "</div>"+
                            "</div>"+
                    "</div></a>";
		 	        infowindow.setContent(contentString);
					infowindow.open(map, this);
		 			});
		 		}
		 		 if(markerCluster==undefined){
		 			markerCluster = new MarkerClusterer(map, markers,
		 			{imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
		  		}else{
		 			 markerCluster.clearMarkers();
			    	 markerCluster.addMarkers(markers);
		  		}
	}

	function arraygetlist(lat, lng, leftlat, leftlng, rightlat, rightlng) {
		var chklength = $(".filterName:checked").length;

		var ddd=$("#selector").val().split('to ');
		 $.getJSON("<c:url value='/booking/list'/>",{lat:lat,lng:lng,leftlat:leftlat,leftlng:leftlng,rightlat:rightlat,rightlng:rightlng,bk_startdate:bk_startdate,bk_enddate:bk_enddate,filterchk:JSON.stringify(filterchk),chklength:chklength},function(data) {
	    		$("#petsitterList").html("");
	        	for(var q=0; q<data.list.length; q++){
	        		var petsitterList=
	                        "<div class='tour-block' name='ssd' style='background-color: white; padding:0; margin:0; border:2px solid #dcdcdc; margin-top:5px;' onmouseover='aaa(this)' onmouseout='bbb(this)'>"+
	        				"<div class='tour-img' style='width:20%; margin-top:5px;'>"+																
	        				"<a href='#'><img style='margin-top:5px; width:200px; height:200px; float:left;' src='<c:url value='/resources/upload/"+data.list[q].pimg_savefilename+"'/>'></a>"+
                        	"</div>"+
	                            "<div class='tour-content'>"+
	                                "<h2>"+data.list[q].ps_content+"</h2>"+
	                                "<div class='tour-meta'>이름 : "+data.list[q].ps_name+"&nbsp;&nbsp; | &nbsp; 반려견 :"+data.list[q].petcnt +"마리</div>"+
	                                "<div >"+
	                                "<div class='tour-text mb40' style='text-align: center; height:115px; margin:0px; padding:0px;'>";
					                    for(var w=0; w<data.list[q].list.length; w++){
					                    	petsitterList+="<div style='display: inline-block; margin:5px;'><span class='filterlist' style='border:2px solid #dcdcdc; color:gray; border-radius: 10px; padding: 5px;'>"+data.list[q].list[w].f_type+"</span></div>";
					                    }
					                    petsitterList+=
					                    "</div>"+
	                                    "<div class='tour-details-text' style='margin:0px; padding:0px;'><span style='display: inline-block; color: gray; font-size: 20px; width:100%; margin:0px; padding:0px; margin-top:-5px; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; day care/"+data.list[q].ps_careprice+"&nbsp;&nbsp;&nbsp;&nbsp; 1박/"+data.list[q].ps_price+"&nbsp;&nbsp;&nbsp;&nbsp; 대형견 추가금/"+data.list[q].ps_overprice+"</span></div>"+
	                                    "<div class='tour-details-btn' style='padding:5px;'> <span><a href='<c:url value='/detail?ps_email="+data.list[q].ps_email+"'/>' onclick='return checked();' class='btn btn-primary' style='background-color:ffd700;'>예약하기</a></span> </div>"+
	                                "</div>"+
	                            "</div>"+
	                    "</div>";
	                    $("#petsitterList").append(petsitterList); 				
	    		}
	    })
	}
	flatpickr.localize(flatpickr.l10ns.ko); //언어 한글화
	flatpickr("#selector");
	var selector = $("#selector").flatpickr({
		mode : "range",
		dateFormat : "Y/m/d",
		minDate : "today",
		onValueUpdate : function() {
			var ddd = $("#selector").val().split('to ');
			bk_startdate = ddd[0];
			bk_enddate = ddd[1];
			if (bk_startdate != undefined && bk_enddate != undefined) {
				changeMap()
			}
		}
	});
	function changeMap() {
		var chklength = $(".filterName:checked").length;
		var arr = new Array();
		$.getJSON("<c:url value='/booking/map'/>", {
			bk_startdate : bk_startdate,
			bk_enddate : bk_enddate,
			filterchk : JSON.stringify(filterchk),
			chklength : chklength
		}, function(data) {
			for (var q = 0; q < data.alllist.length; q++) {
				var email = data.alllist[q].ps_email;
				var lat = data.alllist[q].ps_lat;
				var lng = data.alllist[q].ps_lng;
				var name = data.alllist[q].ps_name;
				var addr1 = data.alllist[q].ps_addr1;
				var content = data.alllist[q].ps_content;
				var img = data.alllist[q].ps_saveimage;
				var careprice = data.alllist[q].ps_careprice;
				var price = data.alllist[q].ps_price;
				var overprice = data.alllist[q].ps_overprice;

				arr.push({
					email : email,
					name : name,
					addr1 : addr1,
					content : content,
					lat : lat,
					lng : lng,
					img : img,
					price : price,
					careprice : careprice,
					overprice : overprice
				});
			}
			list1(arr)
			getlist()
		})
	}
	function aaa(div){
		$(div).css("border", "2px solid orange");
		$(div).find(".filterlist").css("border", "2px solid orange");
		
	}
	function bbb(div){
		$(div).css("border", "2px solid #dcdcdc");
		$(div).find(".filterlist").css("border", "2px solid #dcdcdc");
	}
	function ccc(div){
		$(div).css("border", "2px solid orange");
	}
	function ddd(div){
		$(div).css("border", "2px solid #dcdcdc");
	}
	function eee(div){
		$(div).css("border", "");
	}
	$( ".divhover" ).mouseover(function() {
		$(this).css("border", "2px solid orange");
	});
	$( ".divhover" ).mouseout(function() {
		$(this).css("border", "2px solid #dcdcdc");
	});
	
</script>


<script>

function tensor(){
	
	var pop = window.open("<c:url value='/tensor' />","pop","width=570,height=800, scrollbars=yes, resizable=yes"); 
	
}

function checked(){
	
	var id = '<%= session.getAttribute("login") %>';
	if(id == "null"){
		alert("로그인 하셔야 이용가능합니다");
		location.href="<c:url value='/login' />";
		return false;
	}else{
		return true;	
	}
	
	
}

</script>
<script
	src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
	
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDlHuO4oLlpV9W3ENFiqWJI_MjY1Il0cB8&callback=initMap">
	
</script>
