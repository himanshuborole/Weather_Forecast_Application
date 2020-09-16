<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="true" %>
    <%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>WF-Pollution</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="pollution.css"/>

<style>

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
/*------------------------------------------------------*/
/* The Modal (background) */
.modalc {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  }
  
  /* Modal Content */
  .modalc-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
  }
  
  /* The Close Button */
  .close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
  }
  
  .close:hover,
  .close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
  }
  table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }
  
  td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
  }
  
  tr:nth-child(even) {
    background-color: #dddddd;
  }
  button{
    margin-left: 50px;
  }
 
/*------------------------------------------------------*/
/*Alert box css*/
.alert {
  padding: 20px;
  background-color: #ff9800;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
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
      <li><a href="historical_5_days.jsp">Historical 5 days</a></li>
      <li class="active"><a href="pollution.jsp">Air Pollution</a></li>
      <li><a href="forecast.jsp">Forecast</a></li>
      <li><a href="map.jsp">Map</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
	  <li><a href="#" onclick="document.getElementById('id03').style.display='block'" style="width:auto;"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    
    
    </ul>
  </div>
</nav>

<!--Alert box-->
      <div class="alert">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
        <div class="message">Alert Message</div>
      </div>
<!--Alert box finish-->

<button id="myBtn" style="background-color: rgba(0,0,0,0.6) ;color:#fcfcfc;">Air Pollution Info</button>

      <!-- The Modal -->
      <div id="myModal" class="modalc">
      
        <!-- Modal content -->
        <div class="modalc-content">
          <span class="close">&times;</span>
          <div class="table-responsive">
          <table>
        <tr>
          <th>AQI</th>
          <th>Air Pollution Level</th>
          <th>Health Implication</th>
          <th>Cautionary Statements</th>
        </tr>
        <tr>
          <td>0 - 50</td>
          <td>Good</td>
          <td>Air quality is considered satisfactory, and air pollution poses little or no risk</td>
          <td>None</td>
        </tr>
        <tr>
          <td>51 -100</td>
          <td>Moderate</td>
          <td>Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.</td>
          <td>Active children and adults, and people with respiratory disease, such as asthma, should limit prolonged outdoor exertion.</td>
        </tr>
        <tr>
          <td>101-150</td>
          <td>Unhealthy for Sensitive Groups</td>
          <td>AMembers of sensitive groups may experience health effects. The general public is not likely to be affected.</td>
          <td>Active children and adults, and people with respiratory disease, such as asthma, should limit prolonged outdoor exertion.</td>
        </tr>
        <tr>
          <td>151-200</td>
          <td>Unhealthy</td>
          <td>Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects</td>
          <td>Active children and adults, and people with respiratory disease, such as asthma, should avoid prolonged outdoor exertion; everyone else, especially children, should limit prolonged outdoor exertion</td>
        </tr>
        
        <tr>
          <td>201-300</td>
          <td>Very Unhealthy</td>
          <td>Health warnings of emergency conditions. The entire population is more likely to be affected.</td>
          <td>Active children and adults, and people with respiratory disease, such as asthma, should avoid all outdoor exertion; everyone else, especially children, should limit outdoor exertion.</td>
        </tr>
        <tr>
          <td>300+</td>
          <td>Hazardous</td>
          <td>Health alert: everyone may experience more serious health effects</td>
          <td>Everyone should avoid all outdoor exertion</td>
        </tr>
      </table>
          </div>
          
        </div>
      
      </div>
      
<script>
      // Get the modal
      var modal = document.getElementById("myModal");
      
      // Get the button that opens the modal
      var btn = document.getElementById("myBtn");
      
      // Get the <span> element that closes the modal
      var span = document.getElementsByClassName("close")[0];
      
      // When the user clicks the button, open the modal 
      btn.onclick = function() {
        modal.style.display = "block";
      }
      
      // When the user clicks on <span> (x), close the modal
      span.onclick = function() {
        modal.style.display = "none";
      }
      
      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function(event) {
        if (event.target == modal) {
          modal.style.display = "none";
        }
      }
</script>
    

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
    <div class="app-wrap">
        <header>
          <input type="text" autocomplete="off" class="search-box" placeholder="LATITUTE"/>
          <input type="text" autocomplete="off" class="search-box1" placeholder="LONGITUDE"/>
        </header>
        <main>
            <section class="location">
                <p><h3>City , Country</h3></p>
                <div class="source">#### , </div>
                <p><h3> Date of Measurement</h3></p>
                <div class="dateofmeasurement">YYYY/MM/DD</div>
            </section>
            <div class="current">
                <p><h3> AQI Level</h3></p>
                <div class="aiqLevel">####</div>
                <p><h3> AIR Quality Index </h3></p>
                <div class="airQualityIndex">###</div>
                <p><h3>PM 2.5 </h3></p>
                <div class="pm">###</div>
                <p><h3> PM 10 </h3></p>
                <div class="pms">###</div>
            </div>
        </main>
    </div>
    
<script type="text/javascript">
const api={
	    key:"YOUR API KEY",
	    base:"http://api.airpollutionapi.com/1.0/aqi?"
	}


	//-----------------------------------------------
	var v = localStorage.getItem("lat");
	geolat = Number(v);
	//console.log(geolat);
	v1 = localStorage.getItem("lng");
	var geolng = Number(v1);
	//console.log(geolng);
	getResults(geolat,geolng);


	//-------------------------------------------------
	// when user search for differnt location in search box..

	const searchbox = document.querySelector('.search-box');
	const searchbox1 = document.querySelector('.search-box1');

	searchbox1.addEventListener('keypress', setQuery);

	function setQuery(evt) {
	    if(evt.keyCode==13){
	        getResults(searchbox.value,searchbox1.value);
	        
	    }
	}



	function getResults(query,query1){

	    var geolat=query;
	    var geolng=query1;
	    
	    fetch(`${api.base}lat=${geolat}&lon=${geolng}&APPID=${api.key}`)
	    .then(pollution=>{
	        return pollution.json();
	    }).then(displayResults);
	}


	//----------------------------------
	//display the result from json to html page

	function displayResults(pollution){
	    //console.log(pollution);  
	   
	    let source = document.querySelector('.location .source');
	    source.innerText=`${pollution.data.source.name} , ${pollution.data.country}`;

	    let dateofmeasurement = document.querySelector('.location .dateofmeasurement');
	    dateofmeasurement.innerText=`${pollution.data.updated}`;

	    let aiqLevel = document.querySelector('.current .aiqLevel');
	    aiqLevel.innerText=`${pollution.data.text}`;

	    let airQualityIndex = document.querySelector('.current .airQualityIndex');
	    airQualityIndex.innerText=`${pollution.data.value}`;

	    let pm = document.querySelector('.current .pm');
	    pm.innerText=`${pollution.data.aqiParams[1].aqi} , ${pollution.data.aqiParams[1].text}`;

	    let pms = document.querySelector(' .pms');
	    pms.innerText=`${pollution.data.aqiParams[2].aqi} , ${pollution.data.aqiParams[2].text}`;
	    
	     let alerts=document.querySelector('.alert .message');
   		 alerts.innerText=`${pollution.data.alert}`;

	}



</script> 

</body>
</html>