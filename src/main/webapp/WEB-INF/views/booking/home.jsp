<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
       #map {
        height: 100%;
        width: 100%;
       }
    </style>
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDlHuO4oLlpV9W3ENFiqWJI_MjY1Il0cB8"
    async defer></script>
   <script type="text/javascript">
    var geocoder;
    var map;
    function initialize() {
      geocoder = new google.maps.Geocoder();
      var latlng = new google.maps.LatLng(-34.397, 150.644);
      var mapOptions = {
        zoom: 16,
        center: latlng
      }
      map = new google.maps.Map(document.getElementById('map'), mapOptions);
    }

    function codeAddress() {
      /* var address = document.getElementById('address').value; */
      <%
      	System.out.println("서울특별시 종로구 율곡로10길 105");
      	System.out.println("서울특별시 종로구 낙원동 119-2");
      %>
      console.log("서울특별시 종로구 율곡로10길 105");
      console.log("서울특별시 종로구 낙원동 119-2");
      var address = ["서울특별시 종로구 율곡로10길 105","서울특별시 종로구 낙원동 119-2"];
      for(var i=0; i<address.length; i++){
	      geocoder.geocode( { 'address': address[i]}, function(results, status) {
	        if (status == 'OK') {
	          map.setCenter(results[0].geometry.location);
	          var marker = new google.maps.Marker({
	              map: map,
	              position: results[0].geometry.location
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
</html>