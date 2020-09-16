<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Weather Forecast</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <style>
   body {font-family: Arial, Helvetica, sans-serif;
    background-image: url(images/fresh.jpg);
    background-repeat: no-repeat;
    background-position: center;
   background-attachment: fixed;
    background-size: cover;
  }
    
    /* Full-width input fields */
    input[type=text], input[type=password] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    label{
      color: rgb(255, 255, 255);
    }
    
    
    /* Set a style for all buttons */
    button {
      background-color: #4CAF50;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      cursor: pointer;
      width: 100%;
    }
    
    button:hover {
      opacity: 0.8;
    }
    
    /* Extra styles for the cancel button */
    .cancelbtn {
      width: auto;
      padding: 10px 18px;
      background-color: #f44336;
    }
    
    /* Center the image and position the close button */
    .imgcontainer {
      text-align: center;
      margin: 24px 0 12px 0;
      position: relative;
    }
    
    img.avatar {
      width: 40%;
      border-radius: 50%;
    }
    
    .container {
      padding: 16px;
      width: fit-content;
     
    
    }
    .heading h1{
    padding-top: 5vw;
     font-size: 6vw;
     text-align: center;
     color: rgba(0, 0, 0, 0.801);
     text-shadow: 2px 2px 8px #dfe7df;
     
   }
    /*h1{
      font-size: 10rem;
      text-align: center;
      font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
      color: rgb(0, 0, 0);
      text-shadow: 2px 2px 5px rgb(255, 255, 255);
    }*/
    .thumbnail{
      background-color: rgba(0,0,0,0.9);
    }
   
    span.psw {
      float: right;
      padding-top: 16px;
    }
span.admin{
      float:left;
      padding-top: 16px;
      }
    
    
    /* The Modal (background) */
    .modal {
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 1; /* Sit on top */
      left: 0;
      top: 0;
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
      padding-top: 60px;
    }
    
    /* Modal Content/Box */
    .modal-content {
      background-color: rgba(0,0,0,0.9);
      margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
      border: 1px solid #888;
      width: 50%; /* Could be more or less, depending on screen size */
    }
    
    /* The Close Button (x) */
    .close {
      position: absolute;
      right: 25px;
      top: 0;
      color:rgb(255, 255, 255);
      font-size: 35px;
      font-weight: bold;
    }
    
    .close:hover,
    .close:focus {
      color: red;
      cursor: pointer;
    }
    
    /* Add Zoom Animation */
    .animate {
      -webkit-animation: animatezoom 0.6s;
      animation: animatezoom 0.6s
    }
    
    @-webkit-keyframes animatezoom {
      from {-webkit-transform: scale(0)} 
      to {-webkit-transform: scale(1)}
    }
      
    @keyframes animatezoom {
      from {transform: scale(0)} 
      to {transform: scale(1)}
    }
    
    /* Change styles for span and cancel button on extra small screens */
    @media screen and (max-width: 300px) {
      span.psw {
         display: block;
         float: none;
      }
      .cancelbtn {
         width: 100%;
      }
    }

    .cancelbtn,.signupbtn {
    float: left;
    width: 100%;
    }
    
    .nav{
    position: relative;
  overflow: hidden;

  text-align: center;

}
.navbar{
    background-color: black;
}

    
    
    
    </style>

</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><b>WF</b></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="historical_5_days.jsp">Historical 5 days</a></li>
      <li><a href="pollution.jsp">Air Pollution</a></li>
      <li><a href="forecast.jsp">Forecast</a></li>
      <li><a href="map.jsp">Map</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#" onclick="document.getElementById('id02').style.display='block'" style="width:auto;"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#" onclick="document.getElementById('id01').style.display='block'" style="width:auto;"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
  
<div class="heading">
  <h1><b>WEATHER FORECAST</b></h1>
  
</div>



<div id="id01" class="modal">
  
  <form class="modal-content animate" action="Login" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="images/img_avatar2.png" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="uname" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>
        
      <button type="submit">Login</button><br>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label><br>
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      <span class="admin"><a href="AdminLogin.jsp">Admin Login</a></span>
      <span class="psw"><a href="forgotpassword.jsp">Forgot password?</a></span>
    </div>
  </form>
</div>



<div id="id02" class="modal">
  <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
  <form class="modal-content" action="CustomerServlet" method="post">
    <div class="container">
      <h3 style="color: rgb(255, 255, 255);"><b>Sign Up</b></h3>
      <p style="color: rgb(255, 255, 255);">Please fill in this form to create an account.</p>
      <hr>
      <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>

	  <label for="firstname"><b>First Name</b></label>
      <input type="text" placeholder="First Name" name="firstname" required>

	  <label for="lastname"><b>Last Name</b></label>
      <input type="text" placeholder="Enter Username" name="lastname" required>
		
      <label for="city"><b>City</b></label>
      <input type="text" placeholder="City" name="city" required>
      
      <label for="state"><b>State</b></label>
      <input type="text" placeholder="State" name="state" required>
   
      <label>
        <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
      </label>

      <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

      <div class="clearfix">
        <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
        <button type="submit" class="signupbtn">Sign Up</button>
      </div>
    </div>
  </form>
</div>




<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

var modal2 = document.getElementById('id02');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal2) {
    modal.style.display = "none";
  }
}
localStorage.clear();
</script>

</body>
</html>
