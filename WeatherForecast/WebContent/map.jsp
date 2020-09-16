<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>WF-Map</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <style>
    html, body{
      width: 100%;
      height: 100%;
      margin: 0;
      padding: 0;
      background-color:black;
    }
    #map-canvas {
      width: 100%;
      height: 100%;
    }
    .gm-style-iw {
      text-align: center;
    }
    .container {
      padding: 16px;
      width: fit-content;
}
.center {
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}  
.nav{
    position: relative;
  overflow: hidden;

  text-align: center;

}
.navbar{
    background-color: black;
}
.dropdown-menu{
    text-align: center;
}
  </style>
  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR KEY">
</script>
<script>
  var map;
  var geoJSON;
  var request;
  var gettingData = false;
  var openWeatherMapKey = "YOUR API KEY"

  function initialize() {
    var mapOptions = {
      zoom: 4,
      center: new google.maps.LatLng(28.70,77.10)
    };

    map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);
    // Add interaction listeners to make weather requests
    google.maps.event.addListener(map, 'idle', checkIfDataRequested);

    // Sets up and populates the info window with details
    map.data.addListener('click', function(event) {
      infowindow.setContent(
       "<img src=" + event.feature.getProperty("icon") + ">"
       + "<br /><strong>" + event.feature.getProperty("city") + "</strong>"
       + "<br />" + event.feature.getProperty("temperature") + "&deg;C"
       + "<br />" + event.feature.getProperty("weather")
       );
      infowindow.setOptions({
          position:{
            lat: event.latLng.lat(),
            lng: event.latLng.lng()
          },
          pixelOffset: {
            width: 0,
            height: -15
          }
        });
      infowindow.open(map);
    });
  }

  var checkIfDataRequested = function() {
    // Stop extra requests being sent
    while (gettingData === true) {
      request.abort();
      gettingData = false;
    }
    getCoords();
  };

  // Get the coordinates from the Map bounds
  var getCoords = function() {
    var bounds = map.getBounds();
    var NE = bounds.getNorthEast();
    var SW = bounds.getSouthWest();
    getWeather(NE.lat(), NE.lng(), SW.lat(), SW.lng());
  };

  // Make the weather request
  var getWeather = function(northLat, eastLng, southLat, westLng) {
    gettingData = true;
    var requestString = "http://api.openweathermap.org/data/2.5/box/city?bbox="
                        + westLng + "," + northLat + "," //left top
                        + eastLng + "," + southLat + "," //right bottom
                        + map.getZoom()
                        + "&cluster=yes&format=json"
                        + "&APPID=" + openWeatherMapKey;
    request = new XMLHttpRequest();
    request.onload = proccessResults;
    request.open("get", requestString, true);
    request.send();
  };

  // Take the JSON results and proccess them
  var proccessResults = function() {
    console.log(this);
    var results = JSON.parse(this.responseText);
    if (results.list.length > 0) {
        resetData();
        for (var i = 0; i < results.list.length; i++) {
          geoJSON.features.push(jsonToGeoJson(results.list[i]));
        }
        drawIcons(geoJSON);
    }
  };

  var infowindow = new google.maps.InfoWindow();

  // For each result that comes back, convert the data to geoJSON
  var jsonToGeoJson = function (weatherItem) {
    var feature = {
      type: "Feature",
      properties: {
        city: weatherItem.name,
        weather: weatherItem.weather[0].main,
        temperature: weatherItem.main.temp,
        min: weatherItem.main.temp_min,
        max: weatherItem.main.temp_max,
        humidity: weatherItem.main.humidity,
        pressure: weatherItem.main.pressure,
        windSpeed: weatherItem.wind.speed,
        windDegrees: weatherItem.wind.deg,
        windGust: weatherItem.wind.gust,
        icon: "http://openweathermap.org/img/w/"
              + weatherItem.weather[0].icon  + ".png",
        coordinates: [weatherItem.coord.Lon, weatherItem.coord.Lat]
      },
      geometry: {
        type: "Point",
        coordinates: [weatherItem.coord.Lon, weatherItem.coord.Lat]
      }
    };
    // Set the custom marker icon
    map.data.setStyle(function(feature) {
      return {
        icon: {
          url: feature.getProperty('icon'),
          anchor: new google.maps.Point(25, 25)
        }
      };
    });

    // returns object
    return feature;
  };

  // Add the markers to the map
  var drawIcons = function (weather) {
     map.data.addGeoJson(geoJSON);
     // Set the flag to finished
     gettingData = false;
  };

  // Clear data layer and geoJSON
  var resetData = function () {
    geoJSON = {
      type: "FeatureCollection",
      features: []
    };
    map.data.forEach(function(feature) {
      map.data.remove(feature);
    });
  };

  google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
<%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
		
			
			if(session.getAttribute("username")==null)
			{
				response.sendRedirect("home.jsp");
			}
			
			
		
		%>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="AfterLoginHome.jsp"><b>WF</b></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="AfterLoginHome.jsp">Home</a></li>
      <li><a href="historical_5_days.jsp">Historical 5 days</a></li>
      <li><a href="pollution.jsp">Air Pollution</a></li>
      <li><a href="forecast.jsp">Forecast</a></li>
      <li class="active"><a href="map.jsp">Map</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
	  <li><a href="#" onclick="document.getElementById('id03').style.display='block'" style="width:auto;"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    </ul>
  </div>
</nav>

<div id="id03" class="modal">

<form class="modal-content animate" action="Logout" style="background-color:black;">
<div class="container">
      <label for="uname" style="color:white;"><b>DO YOU WANT TO LOGOUT...</b></label>
</div ><br><br>
<div class="center">
    <input type="submit" value="Logout">
     <button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn">Cancel</button>
  </div>
  </form>


</div>

<div id="map-canvas"></div>

</body>
</html>