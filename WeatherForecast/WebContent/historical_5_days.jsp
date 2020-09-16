<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WF-Historical</title>
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
          <link rel="stylesheet" href="historical_5_days.css"/>
        
<style>
.nav{
    position: relative;
  overflow: hidden;

  text-align: center;

}
.dropdown-menu{
    text-align: center;
}
.navbar{
    background-color: black;
}
.navbar-header a{
    text-align: center;
}
.grid-container {
  display: grid;
  grid-template-columns: auto auto auto auto;
  grid-gap: 10px;
  background-color: #2196F3;
  padding: 10px;
}

.grid-container > div {
  background-color: rgba(255, 255, 255, 0.8);
  text-align: center;
  padding: 20px 0;
  font-size: 30px;
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

</style>



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
      <li class="active"><a href="historical_5_days.jsp">Historical 5 days</a></li>
      <li><a href="pollution.jsp">Air Pollution</a></li>
      <li><a href="forecast.jsp">Forecast</a></li>
      <li><a href="map.jsp">Map</a></li>
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
    


      
      <div class="services-section">
        <header>
           <input type="text" autocomplete="off" class="search-box" placeholder="LATITUDE" style="color: white;"/>
          <input type="text" autocomplete="off" class="search-box1" placeholder="LONGITUDE" style="color: white;"/>
            <input type="text" autocomplete="off" class="search-box2" placeholder="MM/DD/YYYY..." style="color: white;"/>
        </header>
       <div class="inner-width">
          <div class="services-container">
            <div class="service-box">
                <div class="location">
                    <p><h4>Latitude,Longitude</h4></p>
                    <div class="latlon0">------</div>
                    <p><h4>Time Zone</h4></p>
                    <div class="timezone0">-------</div>
                    <p><h4>Date Time</h4></p>
                    <div class="datetime0">-------</div>
                </div>
                    <div class="current">
                  <div class="weather-icon0"><img src="images/icons/unknown.png"/></div>
                  <p><h4>Temperature</h4></p>
                  <div class="temp0">--<span>°C</span></div>
                  <p><h4>Weather Condition</h4></p>
                  <div class="weather0">----</div>
                  <p><h4>Humidity</h4></p>
                  <div class="humidity0">----%</div>
                  <p><h4>Wind Speed</h4></p>
                  <div class="windspeed0">----m/s</div>
                    </div>
            </div>
  
            <div class="service-box">
                <div class="location">
                  <p><h4>Latitude,Longitude</h4></p>
                    <div class="latlon1">------</div>
                    <p><h4>Time Zone</h4></p>
                    <div class="timezone1">-------</div>
                    <p><h4>Date Time</h4></p>
                    <div class="datetime1">-------</div>
                </div>
                    <div class="current">
                  <div class="weather-icon1"><img src="images/icons/unknown.png"/></div>
                  <p><h4>Temperature</h4></p>
                  <div class="temp1">--<span>°C</span></div>
                  <p><h4>Weather Condition</h4></p>
                  <div class="weather1">----</div>
                  <p><h4>Humidity</h4></p>
                  <div class="humidity1">----%</div>
                  <p><h4>Wind Speed</h4></p>
                  <div class="windspeed1">----m/s</div>
                </div>
            </div>
  
            <div class="service-box">
                <div class="location">
                  <p><h4>Latitude,Longitude</h4></p>
                    <div class="latlon2">------</div>
                    <p><h4>Time Zone</h4></p>
                    <div class="timezone2">-------</div>
                    <p><h4>Date Time</h4></p>
                    <div class="datetime2">-------</div>
                </div>
                    <div class="current">
                  <div class="weather-icon2"><img src="images/icons/unknown.png"/></div>
                  <p><h4>Temperature</h4></p>
                  <div class="temp2">--<span>°C</span></div>
                  <p><h4>Weather Condition</h4></p>
                  <div class="weather2">----</div>
                  <p><h4>Humidity</h4></p>
                  <div class="humidity2">----%</div>
                  <p><h4>Wind Speed</h4></p>
                  <div class="windspeed2">----m/s</div>
                </div>
            </div>
  
            <div class="service-box">
                <div class="location">
                  <p><h4>Latitude,Longitude</h4></p>
                    <div class="latlon3">------</div>
                    <p><h4>Time Zone</h4></p>
                    <div class="timezone3">-------</div>
                    <p><h4>Date Time</h4></p>
                    <div class="datetime3">-------</div>
                </div>
                    <div class="current">
                  <div class="weather-icon3"><img src="images/icons/unknown.png"/></div>
                  <p><h4>Temperature</h4></p>
                  <div class="temp3">--<span>°C</span></div>
                  <p><h4>Weather Condition</h4></p>
                  <div class="weather3">----</div>
                  <p><h4>Humidity</h4></p>
                  <div class="humidity3">----%</div>
                  <p><h4>Wind Speed</h4></p>
                  <div class="windspeed3">----m/s</div>
                </div>
            </div>
  
            <div class="service-box">
                <div class="location">
                  <p><h4>Latitude,Longitude</h4></p>
                    <div class="latlon4">------</div>
                    <p><h4>Time Zone</h4></p>
                    <div class="timezone4">-------</div>
                    <p><h4>Date Time</h4></p>
                    <div class="datetime4">-------</div>
                </div>
                    <div class="current">
                  <div class="weather-icon4"><img src="images/icons/unknown.png"/></div>
                  <p><h4>Temperature</h4></p>
                  <div class="temp4">--<span>°C</span></div>
                  <p><h4>Weather Condition</h4></p>
                  <div class="weather4">----</div>
                  <p><h4>Humidity</h4></p>
                  <div class="humidity4">----%</div>
                  <p><h4>Wind Speed</h4></p>
                  <div class="windspeed4">----m/s</div>
                </div>
            </div>
  
          </div>
        </div>
      </div>
  
  
    


<script type="text/javascript">

const api={
	    key:"YOUR API KEY",
	    base:"https://api.openweathermap.org/data/2.5/"
	}

	//accessing geoLat and geoLng from local storage
	var value = localStorage.getItem("lat");
	var geolat = Number(value);
	//console.log(geolat);
	var value1 = localStorage.getItem("lng");
	var geolng = Number(value1);
	//console.log(geolng);
	//getting today date in MM/DD/YYYY format
	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	var yyyy = today.getFullYear();
	today = mm + '/' + dd + '/' + yyyy;
	toTimestamp(geolat, geolng, today);
	//-------------------------

	const searchbox = document.querySelector('.search-box');
const searchbox1 = document.querySelector('.search-box1');
const searchbox2 = document.querySelector('.search-box2');
searchbox2.addEventListener('keypress', setQuery);

function setQuery(evt) {
    if (evt.keyCode == 13) {
        toTimestamp(searchbox.value , searchbox1.value , searchbox2.value);

    }
}

function toTimestamp(query, query1, strDate) {
   // alert(strDate)
    var n = 5;
    var geolat = query;
    var geolng = query1;
	    var yesterday = new Date(strDate);
	    yesterday=(yesterday.setDate(yesterday.getDate() ))/1000;
	       localStorage.setItem("i1", 0);
	       var i=0
	      while(i<5){ 
	        
	        getResults(yesterday);
	        var datetimeconverted=convert(yesterday);
	        let datetime = document.querySelector(`.datetime${i}`);
	            datetime.innerText = `${datetimeconverted}`;
		    
	            
	    function getResults(query){
	       
	      fetch(`${api.base}onecall/timemachine?lat=${geolat}&lon=${geolng}&dt=${query}&units=metric&appid=${api.key}`)
	      .then(weather=>{
	         
	        return weather.json();
	     }).then(displayResults);
	    }

	    
	    function displayResults(weatherobj){
	        //console.log(weatherobj);  
	      
	        //var i=j;
	        var i1 = localStorage.getItem("i1");
	        var j = Number(i1);
	        //console.log(j);

	        let latlon = document.querySelector(`.latlon${j}`);
	        latlon.innerText=`${weatherobj.lat}, ${weatherobj.lon}`;

	    
	        let timezone = document.querySelector(`.timezone${j}`);
	        timezone.innerText = `${weatherobj.timezone}`;

	        let locationIcon = document.querySelector(`.weather-icon${j}`);
	        const {icon} = weatherobj.current.weather[0];
	        //locationIcon.innerHTML = `<img src="images/icons/${icon}.png"/>`;
	        locationIcon.innerHTML = `<img src="http://openweathermap.org/img/w/${icon}.png"/>`;
	        


	        let temp = document.querySelector(`.temp${j}`);
	        temp.innerHTML=`${Math.round(weatherobj.current.temp)}<span>°c</span>`;

	        let weather_el = document.querySelector(`.weather${j}`);
	        weather_el.innerText=`${weatherobj.current.weather[0].main}`;

	        let humidity = document.querySelector(`.humidity${j}`);
	        humidity.innerText=`${weatherobj.current.humidity}%`;

	        let windspeed = document.querySelector(`.windspeed${j}`);
	        windspeed.innerText=`${weatherobj.current.wind_speed}m/s`;


	        localStorage.setItem("i1", j+1);
	    }
	    function convert(yesterday){

            // Unixtimestamp
            var unixtimestamp = yesterday;
           
            // Months array
            var months_arr = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
           
            // Convert timestamp to milliseconds
            var date = new Date(unixtimestamp*1000);
           
            // Year
            var year = date.getFullYear();
           
            // Month
            var month = months_arr[date.getMonth()];
           
            // Day
            var day = date.getDate();
           
            // Hours
            var hours = date.getHours();
           
            // Minutes
            var minutes = "0" + date.getMinutes();
           
            // Seconds
            var seconds = "0" + date.getSeconds();
           
            // Display date time in MM-dd-yyyy h:m:s format
            var convdataTime = month+'-'+day+'-'+year+' '+hours + ':' + minutes.substr(-2) + ':' + seconds.substr(-2);
            
            return convdataTime;
            
           }
	        i++;
	    yesterday=yesterday-86400;
	        //alert(yesterday);
	       
	   }
	}
	  



</script>

</body>
</html>