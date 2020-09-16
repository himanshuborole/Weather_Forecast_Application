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
     font-size: 5vw;
     text-align: center;
     color: rgba(0, 0, 0, 0.5);
     
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
   .nav{
    position: relative;
  overflow: hidden;

  text-align: center;

}
    .navbar{
    background-color: black;
}
    
    span.psw {
      float: right;
      padding-top: 16px;
    }
    span.admin{
      float:left;
      padding-top: 16px;
      }
    img {
  display: block;
  margin-left: auto;
  margin-right: auto;
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
    </style>

</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="home.jsp"><b>WF</b></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="home.jsp">Home</a></li>
      
    </ul>
    
  </div>
</nav>
  



<div id="id03">
  
  <form class="modal-content animate" action="forget" method="post">
    <div class="imgcontainer">
      
        <p><h3 style="text-align: center;"><b>FORGOT PASSWORD</b></h3></p>
    </div>

    <div class="container">
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Email" name="email" required>

      <label for="psw"><b>New Password</b></label>
      <input type="password" placeholder="Enter new Password" name="pass" required>

      <label for="psw"><b>Confirm Password</b></label>
      <input type="password" placeholder="confirm Password" name="cpass" required>
        
      <button type="submit" value="Submit">Submit</button><br>
    
    </div>
  </form>
</div>



</body>
</html>
