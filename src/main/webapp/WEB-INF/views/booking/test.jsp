<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <style>
      #map {
      	width : 1000px;
        height: 1000px;
      }
    </style>
    <div id="map"></div>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDlHuO4oLlpV9W3ENFiqWJI_MjY1Il0cB8&callback=initMap">
    </script>
    <script type="text/javascript">
    var map;
    var geocoder;
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
      function initMap() {
    	  geocoder = new google.maps.Geocoder();
          var latlng = new google.maps.LatLng(37.572642, 126.991331);
          var mapOptions = {
            zoom: 16,
            center: latlng
          }
          map = new google.maps.Map(document.getElementById('map'), mapOptions);
        // Create an array of alphabetical characters used to label the markers.
        var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        var address = ["서울특별시 종로구 율곡로10길 105","서울특별시 종로구 낙원동 119-2","부산광역시 해운대구 반송로 917","부산광역시 금정구 중앙대로 2019-1","서울특별시 종로구 삼일대로 405 태영빌딩","서울특별시 종로구 종로 73 종각지하쇼핑센터","서울특별시 종로구 수표로 96"];
        var n=0;
        var locations=new Array();
        function moveToLocation(lat, lng){
        	console.log("안녕1");
            var center = new google.maps.LatLng(lat, lng);
            map.panTo(center);
        }
        google.maps.event.addListener(map, 'dragend', function(){    // 드래그시 이벤트 추가
            showMapPos();
        });
        for(var i=0; i<address.length; i++){
  	      geocoder.geocode( { 'address': address[i]}, function(results, status) {
  	    		locations.push({lat:results[0].geometry.location.lat(),lng:results[0].geometry.location.lng()});
  	    		if (status == 'OK') n++;
  	    		if(n==address.length) {
  	    			var infowindow = new google.maps.InfoWindow({
  	    	    	    content: contentString
  	    	    	});
  	    			map.setCenter(results[0].geometry.location);
  			  	    var markers = locations.map(function(location, j) {
  				  	      return new google.maps.Marker({
  				  	    		map: map,
  					  	        position: location,
  					  	        content:"서울 이에요",
  				  	  			title: address[j],
  					  	        label: labels[j % labels.length]
  				  	      });
  				    });
  			  	for(var k=0; k<markers.length; k++){
  			  		console.log(markers[k].title);
  			  		google.maps.event.addListener(markers[k],'click',function() {
  			  			console.log(this.content);
  			  		});
  				}
  			  	      var markerCluster = new MarkerClusterer(map, markers,
  			  	            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
  	    		}
  	      });
        }
        function showMapPos(){
            var pos=map.getCenter();
				console.log(pos.lat());
				console.log(pos.lng());
            //alert(pos.lat()+"/"+pos.lng());
            //return {x:pos.lat(), y:pos.lng()};

        }
      }
    </script>
