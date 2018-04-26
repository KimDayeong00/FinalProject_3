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
<!--     	<select class="addr" name="sido" id="sido"><option value="">-시도-</option></select>
		<select class="addr" name="gugun" id="gugun"><option value="">-구군-</option></select>
		<select class="addr" name="dong" id="dong"><option value="">-동-</option></select>
		<script>sojaeji();</script> -->
    <div id="petsitterList"></div>
    
    <div id="map"></div>
    <script type="text/javascript">
    var search;
    var address = new Array();
    var zoomLevel;
    var map;
    var geocoder;
    var contentString = '<div id="content">'+'</div>';
    var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var n=0;
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
        	arraygetlist(37.566535,126.97796919999996)	
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
        arraygetlist(pos.lat(),pos.lng());
	}
	/* function list(address){
   		n=0;
   		var locations=new Array();
   	    for(var i=0;i<address.length ; i++){
   	  		geocoder.geocode( { 'address': address[i]}, function(results, status) {
		   		locations.push({lat:results[0].geometry.location.lat(),lng:results[0].geometry.location.lng()});
		   		map.setCenter(results[0].geometry.location);
   	  		});
   		}
   	 	list1(locations)
	} */
		var markerCluster;
	function list1(locations){
		var markers;
		for(var i=0;i<locations.length ; i++){
			markers = locations.map(function(location, j) {
	 				return new google.maps.Marker({
	 				map: map,
	 			    position: location,
	 				label: labels[j % labels.length],
	 				draggable: true
	 				});
	 		});
		 		for(var k=0; k<markers.length; k++){
		 			google.maps.event.addListener(markers[k],'click',function() {
		 				console.log(this.position.lat());
		 			  	console.log(this.position.lng());
		 			  	console.log(this.content);
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
	function arraygetlist(lat,lng){
		 $.getJSON("<c:url value='/booking/list'/>",{lat:lat,lng:lng},function(data) {
	    		var arr=new Array();
	    		$("#petsitterList").html("");
	        	for(var q=0; q<data.list.length; q++){
	        		arr.push({lat:data.list[q].ps_lat,lng:data.list[q].ps_lng})
	        		$("#petsitterList").append(
	                        "<div class='tour-block' style='padding:0; margin:0;'>"+
	        				"<div class='tour-img' style='width:20%; float:left;'>"+
	        				"<a href='#'><img style='width:200px; height:200px;' src='<c:url value='/resources/upload/"+data.list[q].ps_saveimage+"'/>'></a>"+
                        	"</div>"+
	                            "<div class='tour-content'>"+
	                                "<h2><a href='#' class='title'>Leh-Ladakh</a></h2>"+
	                                "<div class='tour-meta'> <span class='tour-meta-icon'><i class='fa fa-sun-o'></i></span><span class='tour-meta-text'>8 Days</span> <span class='tour-meta-text'>|</span> <span class='tour-meta-icon'><i class='fa fa-moon-o'></i></span><span class='tour-meta-text'>7 Nights </span> </div>"+
	                                "<div class='tour-text mb40'>"+
	                                    "<p>Monasteries | Nubra Velly | Panmika Pangong Lake | Zoravar Fort | Alchi Khardung La | Sidhu Ghat </p>"+
	                                "</div>"+
	                                "<div class='tour-details'>"+
	                                    "<div class='tour-details-text'><span>8 Days</span></div>"+
	                                    "<div class='tour-details-btn'> <span><a href='#' class='btn btn-primary'>View Details</a></span> </div>"+
	                                "</div>"+
	                            "</div>"+
	                    "</div>");  				
	        				
	    		}
	        	list1(arr);
	    })
	}
</script>