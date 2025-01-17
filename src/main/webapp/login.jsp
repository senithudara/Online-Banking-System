<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
	<link rel="icon" type="image/x-icon" href="http://localhost:8082/Bank_System/assets/images/favicon.png">
	<link href="http://localhost:8082/Bank_System/assets/css/style1.css" rel="stylesheet">


</head>
<body>
    <div class="loginarea">
    
    <div class="loginareabox">
      <div class="logbox"><br>
		
        <div class="lform">
        	
          <h3 class="logtext">Login to the system</h3>
    	  <h4 class="logtext1">Enter your login details below</h4><br>
            <form action="loginForm" method="post" class="loginform" autocomplete="off">
                Username <br><input type="text" name="uid1" class="loginfield" placeholder="Enter your username" required><br><br>
                Password <br><input type="password" name="pass1" class="loginfield" placeholder="Enter your password" minlength="6" required>
                <a href="#">Forgot Password?</a><br><br>
                <input type="submit" value="Login" class="submitbtn">
            </form>
        </div>
        
        
        <div class="btns"><br><br>
               <a href="register1.jsp"><button class="submitbtn2">Sign up for Online Banking</button></a><br>
               <a href="stafflogin.jsp">Login as an admin</a>
               
        </div>
      </div>
      </div>


	 <div class="loginareabox">
        <div class="welcomebox">
            <img src="http://localhost:8082/Bank_System/assets/images/logo2.png" width="360" height="100" class="welcomelogo">
            <h2 class="welcometxt">Online Banking Made Simple...</h2><br>
            <h4 class="welcometxt">Welcome to Ceylon Bank! We are delighted to offer you a Revolutionary Digital Banking experience.</h4>
        </div>
      </div>
    </div>
        
        

    </body>
    </html>