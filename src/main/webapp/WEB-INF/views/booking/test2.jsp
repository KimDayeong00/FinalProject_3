<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <style>
      #petsitterList {
      	width : 50%;
        height: 600px;
        position:relative;
      	float:left;
      	overflow:scroll;
      }
      #map {
      	width : 50%;
        height: 600px;
      }
    </style>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDlHuO4oLlpV9W3ENFiqWJI_MjY1Il0cB8&callback=initMap">
    </script>
    
	<div style="width: 100%; margin-top: 5px; padding: 10px; ">
		<table style="border: 1px solid black; margin-top: 5px; padding: 10px;">
			<tr>
				<td colspan="3" style="text-align: center;">지역을 선택하세요.</td>
				<td style="text-align: center;">날짜를 선택하세요.</td>
			</tr>
			<tr style="padding: 10px;">
				<td width="150px"><select style="width: 100px;" class="addr" name="sido" id="sido"><option value="">&nbsp;광역시/도</option></select></td>
				<td width="150px"><select style="width: 100px;" class="addr" name="gugun" id="gugun"><option value="">&nbsp;&nbsp;&nbsp;&nbsp;시군구</option></select></td>
				<td width="150px"><select style="width: 100px;" class="addr" name="dong" id="dong"><option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동</option></select></td>
			<td>
					<div class="calendar">
						<input type="text" id="selector" style="width: 200px" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;날짜 선택하기"> 
					</div>
				</td>
			</tr>
		</table>
		<script>sojaeji();</script>
	</div>
	<%-- <div class="btn-group" data-toggle="buttons">
		<c:forEach items="${filterlist }" var="filter">
			<label class="btn btn-primary" style="border-radius:4px; padding:3px; margin: 3px;">
		    	<input type="checkbox" name="chk" value="${filter.f_type}">${filter.f_type}
			</label>
		</c:forEach>
	</div> --%>
    <div id="petsitterList"></div>
    <div id="map"></div>
    <script type="text/javascript">
    var search;
    var address = new Array();
    var map;
    var geocoder;
    var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var n=0;
    var bk_startdate;
	var bk_enddate;
	var listener;
    $("name").on("click",function(){
    	console.log("안녕")
    })
    
    $(".addr").on("change",function(){
    	var addres = $("#sido").val()+" "+$("#gugun").val()+" "+$("#dong").val();
    	if($("#dong").val()!=""){
    		map.setZoom(17)
    	}else if($("#gugun").val()!=""){
    		map.setZoom(15)
    	}else if($("#sido").val()!=""){
    		map.setZoom(10)
    	}
    	addreslist(addres);
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
		      	var img = '${data.ps_saveimage}';
				address.push({email:email,name:name,addr1:addr1,content:content,lat:lat,lng:lng,img:img});
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
        listener = google.maps.event.addListener(map, 'zoom_changed', function() {
    	   console.log("왔다감")
	    	getlist();
		}); 
	}
	function getlist(){
		var zoomLevel = map.getZoom();
        var bounds =  map.getBounds();
        var endLo = bounds.getNorthEast();
        var startLo = bounds.getSouthWest();
        var pos=map.getCenter();
        /* console.log("Zoom: " + zoomLevel);
        $("#petsitterList").append("Zoom: " + zoomLevel+"<br>");
        $("#petsitterList").append("bounds: " + bounds+"<br>");
        $("#petsitterList").append("좌측하단: " + startLo+"<br>");
        $("#petsitterList").append("우측상단: " + endLo+"<br>");
        $("#petsitterList").append("차이lat: " + (endLo.lat()-startLo.lat())+"<br>");
        $("#petsitterList").append("차이lng: " + (endLo.lng()-startLo.lng())+"<br>");
        $("#petsitterList").append("맵 중앙 lat: " + pos.lat()+"<br>");
        $("#petsitterList").append("맵 중앙 lng: " + pos.lng()+"<br>"); */
        console.log("getlist()"+pos.lat(),pos.lng(),startLo.lat(),startLo.lng(),endLo.lat(),endLo.lng());
        arraygetlist(pos.lat(),pos.lng(),startLo.lat(),startLo.lng(),endLo.lat(),endLo.lng());
	}
	function addreslist(address){
   		n=0;
   		var locations=new Array();
   	  		geocoder.geocode( { 'address': address}, function(results, status) {
		   		locations.push({lat:results[0].geometry.location.lat(),lng:results[0].geometry.location.lng()});
		   		map.setCenter(results[0].geometry.location);
		   	 	var bounds =  map.getBounds();
		        var endLo = bounds.getNorthEast();
		        var startLo = bounds.getSouthWest();
		        var pos=map.getCenter();
		        console.log("1:"+pos.lat(),pos.lng(),startLo.lat(),startLo.lng(),endLo.lat(),endLo.lng())
   	 			getlist()
   	  		});
   	 	list1(locations)
	}
		var markerCluster;
	function list1(locations){
		var markers;
		for(var i=0;i<locations.length ; i++){
			markers = locations.map(function(location, j) {
	 				return new google.maps.Marker({
	 				map: map,
	 			    position: location,
	 			   	email:locations[j].email,
	 			   	name:locations[j].name,
	 			   	addr1:locations[j].addr1,
	 			   	content:locations[j].content,
	 			   	img:locations[j].img,
	 				label: labels[j % labels.length],
	 				draggable: true
	 				});
	 		});
			var infowindow = new google.maps.InfoWindow();
		 		for(var k=0; k<markers.length; k++){
		 			google.maps.event.addListener(markers[k],'click',function() {
		 			var contentString ="<div class='tour-block' style='padding:0; margin:0;'>"+
    				"<div class='tour-img' style='width:20%; float:left;'>"+
    				"<a href='#'><img style='width:200px; height:200px;' src='<c:url value='/resources/upload/"+this.img+"'/>'></a>"+
                	"</div>"+
                        "<div class='tour-content'>"+
                            "<h2><a href='#' class='title'>"+this.email+"</a></h2>"+
                            "<div class='tour-meta'> <span class='tour-meta-icon'><i class='fa fa-sun-o'></i></span><span class='tour-meta-text'>8 Days</span> <span class='tour-meta-text'>|</span> <span class='tour-meta-icon'><i class='fa fa-moon-o'></i></span><span class='tour-meta-text'>7 Nights </span> </div>"+
                            "<div class='tour-text mb40'>"+
                                "<p>Monasteries | Nubra Velly | Panmika Pangong Lake | Zoravar Fort | Alchi Khardung La | Sidhu Ghat </p>"+
                            "</div>"+
                            "<div class='tour-details'>"+
                                "<div class='tour-details-text'><span>8 Days</span></div>"+
                                "<div class='tour-details-btn'> <span><a href='#' class='btn btn-primary'>View Details</a></span> </div>"+
                            "</div>"+
                        "</div>"+
                "</div>" 
		 	        infowindow.setContent(contentString);
					infowindow.open(map, this);
		 			});
		 		}


		 		//addMarkers(markers:Array.<google.maps.Marker>, opt_nodraw:boolean)
		 		if(markerCluster==undefined){
		 			markerCluster = new MarkerClusterer(map, markers,
		 			{imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
		 		}else{
		 			markerCluster.clearMarkers();
		 			markerCluster.resetViewport();
		 			markerCluster.addMarkers(markers,false);
		 			
		 		}
		}
	}
	
	function arraygetlist(lat,lng,leftlat,leftlng,rightlat,rightlng){
		console.log("arraygetlist()")
		var ddd=$("#selector").val().split('to ');
		console.log("어어1"+bk_startdate)
		console.log("어어1"+bk_enddate)
		console.log(lat,lng,leftlat,leftlng,rightlat,rightlng)
	
		 $.getJSON("<c:url value='/booking/list'/>",{lat:lat,lng:lng,leftlat:leftlat,leftlng:leftlng,rightlat:rightlat,rightlng:rightlng,bk_startdate:bk_startdate,bk_enddate:bk_enddate},function(data) {
	    		$("#petsitterList").html("");
	    		google.maps.event.removeListener(listener);
	    		console.log("랭스 : "+data.list.length)
	        	for(var q=0; q<data.list.length; q++){
	        		var petsitterList=
	                        "<div class='tour-block' style='padding:0; margin:0; border:1px solid black; margin-top:5px;'>"+
	        				"<div class='tour-img' style='width:20%;'>"+
	        				"<a href='#'><img style='width:200px; height:200px; float:left;' src='<c:url value='/resources/upload/"+data.list[q].ps_saveimage+"'/>'></a>"+
                        	"</div>"+
	                            "<div class='tour-content'>"+
	                                "<h2>"+data.list[q].ps_content+"</h2>"+
	                                "<div class='tour-meta'>이름 : "+data.list[q].ps_name+"&nbsp;&nbsp; | &nbsp; 반려견 :"+data.list[q].petcnt +"마리</div>"+
	                               
	                                "<div class='tour-details' style=''>"+
	                                "<div class='tour-text mb40' style='text-align: center; height:115px; margin:0px; padding:0px;'>";
					                    for(var w=0; w<data.list[q].list.length; w++){
					                    	petsitterList+="<div style='display: inline-block; margin:5px;'><span style='border:1px solid gray; color:gray; border-radius: 10px; padding: 5px;'>"+data.list[q].list[w].f_type+"</span></div>";
					                    }
					                    petsitterList+=
					                    "</div>"+
	                                    "<div class='tour-details-text' style='margin:0px; padding:0px;'><span style='display: inline-block; color: gray; font-size: 20px; width:100%; margin:0px; padding:0px; margin-top:-5px; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; day care/"+data.list[q].ps_careprice+"&nbsp;&nbsp;&nbsp;&nbsp; 1박/"+data.list[q].ps_price+"&nbsp;&nbsp;&nbsp;&nbsp; 대형견 추가금/"+data.list[q].ps_overprice+"</span></div>"+
	                                    "<div class='tour-details-btn' style='padding:5px;'> <span><a href='<c:url value='/detail?ps_email="+data.list[q].ps_email+"'/>' class='btn btn-primary'>예약하기</a></span> </div>"+
	                                "</div>"+
	                            "</div>"+
	                    "</div>";
	                    $("#petsitterList").append(petsitterList); 				
	    		}
	    })
		    google.maps.event.addListener(map, 'zoom_changed', function() {
		    	console.log("!#!#!#")
			    getlist();
			});
	}
	flatpickr.localize(flatpickr.l10ns.ko); //언어 한글화
	flatpickr("#selector");
	var selector = $("#selector").flatpickr({
		mode:"range",
		dateFormat : "Y/m/d",
		minDate : "today",
		onValueUpdate : function(){
			var ddd=$("#selector").val().split('to ');
			bk_startdate = ddd[0];
			bk_enddate = ddd[1];
			if(bk_startdate!=undefined && bk_enddate!=undefined){
				getlist()
			}
		}
	});
</script>
