<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <style>
      #petsitterList {
      	width : 50%;
        height: 600px;
        background-color: pink;
        position:relative;
      	float:left;
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
    <div id="petsitterList">
    	<select class="addr" name="sido" id="sido"><option value="">-시도-</option></select>
		<select class="addr" name="gugun" id="gugun"><option value="">-구군-</option></select>
		<select class="addr" name="dong" id="dong"><option value="">-동-</option></select>
		<script>sojaeji();</script>
    </div>
    <div id="map"></div>
    <script type="text/javascript">
    var search;
    var address = new Array('대한민국');
    var zoomLevel;
    var map;
    var markers;
    var geocoder;
    var contentString = '<div id="content">'+'</div>';
    var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var n=0;
    var markerCluster;
	function initMap() {
    	geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(37.566535, 126.97796919999996);
        var mapOptions = {
        	 /*  
        	 좌측하단: (33.193668738614384, 124.82258606250002)
        	  우측상단: (38.53185554526987, 130.71125793750002)
        	  */
        	zoom: 7,
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
        	address.pop();
        	<c:forEach items="${list}" var="data" varStatus="status">
  				address.push('${data.ps_addr1}');
  			</c:forEach>
  				 list(address);
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
        google.maps.event.addListener(map, 'zoom_changed', function() {
	    	getlist();
		});
	}
	function list(address){
   		n=0;
   		var locations=new Array();
   	    for(var i=0;i<address.length ; i++){
   	  		geocoder.geocode( { 'address': address[i]}, function(results, status) {
		   		locations.push({lat:results[0].geometry.location.lat(),lng:results[0].geometry.location.lng()});
		   		if (status == 'OK'){
		   	  		n++;
	   	  	    	map.setCenter(results[0].geometry.location);
		   	  	    console.log("n"+n);
		   	  	    if(n==address.length) {
		   	  	    	var infowindow = new google.maps.InfoWindow({
		   	  	    		content: contentString
		   	  	    	});
		   	  			markers = locations.map(function(location, j) {
		   	  				return new google.maps.Marker({
		   	  				map: map,
		   	  			    position: location,
		   	  			    content:address[j],
		   	  				title: address[j],
		   	  				label: labels[j % labels.length],
		   	  				draggable: true
		   	  				});
		   	  			});
		   	  		for(var k=0; k<markers.length; k++){
		   	  			console.log(markers[k].title);
		   	  			google.maps.event.addListener(markers[k],'click',function() {
		   	  				console.log(this.position.lat());
		   	  			  	console.log(this.position.lng());
		   	  			  	console.log(this.content);
		   	  			});
		   	  		}
		   	  		markerCluster = new MarkerClusterer(map, markers,
		   	  			{imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
		   	  	    }
		   	  	   
		   	  	}else {
		            alert("Geocode was not successful for the following reason: " + status);
		        }
   	  		});
   	  		
   		}
	}
	function getlist(){
		zoomLevel = map.getZoom();
        var bounds =  map.getBounds();
        var endLo = bounds.getNorthEast();
        var startLo = bounds.getSouthWest();
        var pos=map.getCenter();
        console.log("Zoom: " + zoomLevel);
        $("#petsitterList").append("Zoom: " + zoomLevel+"<br>");
        $("#petsitterList").append("bounds: " + bounds+"<br>");
        $("#petsitterList").append("좌측하단: " + startLo+"<br>");
        $("#petsitterList").append("우측상단: " + endLo+"<br>");
        $("#petsitterList").append("차이lat: " + (endLo.lat()-startLo.lat())+"<br>");
        $("#petsitterList").append("차이lng: " + (endLo.lng()-startLo.lng())+"<br>");
        $("#petsitterList").append("맵 중앙 lat: " + pos.lat()+"<br>");
        $("#petsitterList").append("맵 중앙 lng: " + pos.lng()+"<br>");
        markerCluster.clearMarkers();
        $.getJSON("<c:url value='/booking/list'/>",{lat:pos.lat(),lng:pos.lng()},function(data) {
    		var arr=new Array();
        	for(var q=0; q<data.list.length; q++){
        		console.log((q+1)+"첫번째 추소 값은 = "+data.list[q].ps_addr1)
        		arr.push(data.list[q].ps_addr1);
    		}
        	
        })
	}
	function listcall(){
		$.getJSON("<c:url value='/user/using'/>",{"id":id}, function(data) {
			if(data.using==true){
				$("#result").html("사용중인 아이디입니다.");
			}else{
				$("#result").html("사용가능한 아이디입니다.");
			}
		});
	}
  	
</script>
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                    <div class="tour-block">
                        <div class="tour-img">
                            <a href="#"><img src="images/tour-pic-1.jpg" alt="Tour and Travel Agency - Responsive Website Template"></a>
                        </div>
                        <div class="tour-content">
                            <h2><a href="#" class="title">Leh-Ladakh</a></h2>
                            <div class="tour-meta"> <span class="tour-meta-icon"><i class="fa fa-sun-o"></i></span><span class="tour-meta-text">8 Days</span> <span class="tour-meta-text">|</span> <span class="tour-meta-icon"><i class="fa fa-moon-o"></i></span><span class="tour-meta-text">7 Nights </span> </div>
                            <div class="tour-text mb40">
                                <p>Monasteries | Nubra Velly | Panmika Pangong Lake | Zoravar Fort | Alchi Khardung La | Sidhu Ghat </p>
                            </div>
                            <div class="tour-details">
                                <div class="tour-details-text"><span>8 Days</span></div>
                                <div class="tour-details-btn"> <span><a href="#" class="btn btn-primary">View Details</a></span> </div>
                            </div>
                        </div>
                    </div>
                </div>
