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
	          });<!DOCTYPE html>
	          <html>
	          <head>
	            <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	            <meta charset="utf-8">
	            <title>Marker Clustering</title>
	            <style>
	              /* Always set the map height explicitly to define the size of the div
	               * element that contains the map. */
	              #map {
	                height: 100%;
	              }
	              /* Optional: Makes the sample page fill the window. */
	              html, body {
	                height: 100%;
	                margin: 0;
	                padding: 0;
	              }
	            </style>
	          </head>
	          <body>
	            <div id="map"></div>
	            <script>

	              function initMap() {

	                var map = new google.maps.Map(document.getElementById('map'), {
	                  zoom: 3,
	                  center: {lat: -28.024, lng: 140.887}
	                });

	                // Create an array of alphabetical characters used to label the markers.
	                var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

	                // Add some markers to the map.
	                // Note: The code uses the JavaScript Array.prototype.map() method to
	                // create an array of markers based on a given "locations" array.
	                // The map() method here has nothing to do with the Google Maps API.
	                var markers = locations.map(function(location, i) {
	                  return new google.maps.Marker({
	                    position: location,
	                    label: labels[i % labels.length]
	                  });
	                });

	                // Add a marker clusterer to manage the markers.
	                var markerCluster = new MarkerClusterer(map, markers,
	                    {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
	              }
	              var locations = [
	                {lat: -31.563910, lng: 147.154312},
	                {lat: -33.718234, lng: 150.363181},
	                {lat: -33.727111, lng: 150.371124},
	                {lat: -33.848588, lng: 151.209834},
	                {lat: -33.851702, lng: 151.216968},
	                {lat: -34.671264, lng: 150.863657},
	                {lat: -35.304724, lng: 148.662905},
	                {lat: -36.817685, lng: 175.699196},
	                {lat: -36.828611, lng: 175.790222},
	                {lat: -37.750000, lng: 145.116667},
	                {lat: -37.759859, lng: 145.128708},
	                {lat: -37.765015, lng: 145.133858},
	                {lat: -37.770104, lng: 145.143299},
	                {lat: -37.773700, lng: 145.145187},
	                {lat: -37.774785, lng: 145.137978},
	                {lat: -37.819616, lng: 144.968119},
	                {lat: -38.330766, lng: 144.695692},
	                {lat: -39.927193, lng: 175.053218},
	                {lat: -41.330162, lng: 174.865694},
	                {lat: -42.734358, lng: 147.439506},
	                {lat: -42.734358, lng: 147.501315},
	                {lat: -42.735258, lng: 147.438000},
	                {lat: -43.999792, lng: 170.463352}
	              ]
	            </script>
	            <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
	            </script>
	            <script async defer
	            src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
	            </script>
	          </body>
	        </html>
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