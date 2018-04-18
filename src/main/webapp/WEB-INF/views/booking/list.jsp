<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <style>
       #map {
        height: 400px;
        width: 100%;
       }
    </style>
    
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDlHuO4oLlpV9W3ENFiqWJI_MjY1Il0cB8">
    </script>
     <script type="text/javascript">
    var geocoder;
    var map;
    var contentString = '<div id="content">'+
    '<div id="siteNotice">'+
    '</div>'+
    '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
    '<div id="bodyContent">'+
    '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
    'sandstone rock formation in the southern part of the '+
    'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
    'south west of the nearest large town, Alice Springs; 450&#160;km '+
    '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
    'features of the Uluru - Kata Tjuta National Park. Uluru is '+
    'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
    'Aboriginal people of the area. It has many springs, waterholes, '+
    'rock caves and ancient paintings. Uluru is listed as a World '+
    'Heritage Site.</p>'+
    '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
    'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
    '(last visited June 22, 2009).</p>'+
    '</div>'+
    '</div>';
    function initialize() {
      geocoder = new google.maps.Geocoder();
      var latlng = new google.maps.LatLng(37.572642, 126.991331);
      var mapOptions = {
        zoom: 16,
        center: latlng
      }
      map = new google.maps.Map(document.getElementById('map'), mapOptions);
    }
    function codeAddress() {
    	var address = ["서울특별시 종로구 율곡로10길 105","서울특별시 종로구 낙원동 119-2","부산광역시 해운대구 반송로 917","부산광역시 금정구 중앙대로 2019-1","서울특별시 종로구 삼일대로 405 태영빌딩","서울특별시 종로구 종로 73 종각지하쇼핑센터","서울특별시 종로구 수표로 96"];
    	var infowindow = new google.maps.InfoWindow({
    	    content: contentString
    	});
    	
    	for(var i=0; i<address.length; i++){
	      geocoder.geocode( { 'address': address[i]}, function(results, status) {
	        if (status == 'OK') {
	          map.setCenter(results[0].geometry.location);
	          var marker = new google.maps.Marker({
	              map: map,
	              position: results[0].geometry.location,
	              title: 'Uluru (Ayers Rock)'
	          });
	          console.log(marker);
	      	  marker.addListener('click', function() {
	      	    infowindow.open(map, marker);
	      	  });
	        } else {
	          alert('Geocode was not successful for the following reason: ' + status);
	        }
      });
      }
    }
    </script>
  <body onload="initialize()">
   <div id="map"></div>
    <div>
      <input id="address" type="textbox" value="">
      <input type="button" value="Encode" onclick="codeAddress()">
    </div>
  </body>
