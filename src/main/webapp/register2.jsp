<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register for Online Banking</title>
<link rel="icon" type="image/x-icon" href="http://localhost:8082/Bank_System/assets/images/favicon.png">
<link href="http://localhost:8082/Bank_System/assets/css/style1.css" rel="stylesheet">

</head>
<body>   

	   <script>
        function validateForm() {
            var password1 = document.getElementById("pass1").value;
            var password2 = document.getElementById("pass2").value;

            if (password1 !== password2) {
                // Passwords do not match
                window.alert("Passwords do not match. Please try again.");
                return false;
            }

            // Passwords match
            return true;
        }
    </script>

<div class="banklogo">
   <img src="http://localhost:8082/Bank_System/assets/images/logo2.png" width="108" height="30" class="cblogo">  		
</div>

<div class="regForm1">
    	
     <h3 class="regtext2">Enter your information to create an account</h3>
     <form action="regForm" method="post" id="form1" autocomplete="off" onsubmit="return validateForm()">
     
    	
    	<table>
    		<tr>
    		<td>First Name</td>
    		<td>Last Name</td>
    		</tr>
    		
    		<tr>
    		<td><input type="text" name="fname" class="input1" required></td>
    		<td><input type="text" name="lname" class="input1" required></td>
    		</tr>
    		
    		<tr>
    		<td>Name with initials<br><input type="text" name="fullnme" required></td>
    		</tr>
    		
    		<tr>
    		<td>Birth Date<br><input type="date" name="bdate" min="1900-01-01" max="2004-12-21" required></td>
    		</tr>
           
           
           <tr>
    		<td>National ID</td>
    		<td>Account Number</td>
    		</tr>
    		
    		<tr>
    		<td><input type="text" name="nid" value="${session_name2}" class="input1" readonly></td>
    		<td><input type="text" name="accno" value="${session_name1}" class="input1" readonly></td>
    		</tr>
    		
    		<tr>
    		<td>Mobile Number<br><input type="tel" name="mnum" pattern="[+][9][4] [0-9]{2} [0-9]{3} [0-9]{4}" placeholder="+94 76 123 1234" value="+94 " maxlength="15" required></td>
    		</tr>
    		
    		<tr>
    		<td>Email<br><input type="email" name="email"></td>
    		</tr>
    		
    		<tr>
    		<td>Select a username<br><input type="text" name="uname" required></td>
    		</tr>
    		
    		
    		<tr>
    		<td>Create a password</td>
    		<td>Confirm your password</td>
    		</tr>
    		
    		<tr>
    		<td><input type="password" name="pass1" id="pass1" minlength="6" required class="input1" ></td>
    		<td><input type="password" name="pass2" id="pass2" minlength="6" required class="input1" ></td>
    		</tr>
    		
    		<tr>
    		<td><input type="submit" name="submit" value="Create Account" onclick="matchPassword()" class="submitbtn1" id="submitbtn"> </td>
    		</tr>
     	</table>
     	
     	<p id="message"></p>
     </form>
         <p id="password-error" style="color: red;"></p><br><br>
     
</div>



</body>
</html>