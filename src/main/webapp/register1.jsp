<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register for Online Banking</title>
<link rel="icon" type="image/x-icon" href="http://localhost:8082/Bank_System/assets/images/favicon.png">
<link href="http://localhost:8082/Bank_System/assets/css/style1.css" rel="stylesheet">
<script src="http://localhost:8082/Bank_System/assets/JS/myscript1.js"></script>


</head>
<body>

<div class="banklogo">
   <img src="http://localhost:8082/Bank_System/assets/images/logo2.png" width="108" height="30" class="cblogo">  		
</div>

<div class="register1">	
	<div class="regForm">
	<form action="accValidate" method="post" >
    	<p class="regtext">Let's find your account</p>
    	<h4 class="regtext1">Fill in your account details below</h4>
	
		Account Type<br>
        <select name="accounttype" required>
            <option value="type" disabled>-- Select your account type --</option>
        	<option value="Savings Account">Savings Account</option>
            <option value="Current Account">Current Account</option>
        </select><br><br>
        Account Number<br><input type="text" name="accnum" maxlength="8" required><br><br>
        National ID<br><input type="text" name="nid" maxlength="12" required><br><br>
        <input type="submit" name="submit" value="Continue" class="submitbtn"> 
   
	</form>	
	</div>
</div>

</body>
</html>