<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login as an admin</title>
	<link rel="icon" type="image/x-icon" href="http://localhost:8082/Bank_System/assets/images/favicon.png">
	<link href="http://localhost:8082/Bank_System/assets/css/style1.css" rel="stylesheet">


</head>
<body>
    

       <div class="register1">	
		 <div class="regForm">
		                 	<p class="regtext2">Login as a staff member</p>

            <form action="staffloginForm" method="post" class="loginform2" autocomplete="off">
            
                Username <br><input type="text" name="uid2" class="loginfield" placeholder="Enter your username" required><br><br>
                Password <br><input type="password" name="pass2" class="loginfield" placeholder="Enter your password" required>
                <input type="submit" value="Login" class="submitbtn">
            </form>
          </div>         
       </div>
      
    </body>
    </html>