<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="icon" type="image/x-icon" href="http://localhost:8082/Bank_System/assets/images/favicon.png">
	<link href="http://localhost:8082/Bank_System/assets/css/style2.css" rel="stylesheet">
	
<title>Dashboard</title>
<header>
	<div class="headerbox">
   
   		<div class="headeritem">
       		<a href="profile.jsp"><img src="http://localhost:8082/Bank_System/assets/images/logo2.png" href="profile.jsp" width="324" height="90" class="cblogo">
       		</a>
  		</div> 
  	   
 		<div class="headeritem">
   	   		<a href="redirect.jsp"><img src="http://localhost:8082/Bank_System/assets/images/pfp.png" width="50" height="50" class="userpic">
 			</a>
   		</div>
   	
	</div>

  	  
  	   <div class="navbar">
  			<a href="#home" class="menubtn1">View Transaction History</a>
  			<a href="#home">Transfer Money</a>
  			<a href="#home">Apply for a Loan</a>
  			<a href="#">FAQ</a>
  			
  			
  		
  		
  			<div class="dropdown">
  				<button class="dropbtn" onclick="myFunction()">Other
    			<i class="fa fa-caret-down"></i>
 				</button>
  					<div class="dropdown-content" id="myDropdown">
    					<a><form method="post" action="viewuserprofile" class="viewpro">
						<input type="submit" value="View profile" >
						</form></a>
    					<a href="#">Help</a>
    					<a href="#">User Guide</a>
    					<a href="login.jsp">Logout</a>
    				
  					</div>
  			</div> 
   		</div>
 

	
<script>

//opening the dropdown menu when the button is clicked
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

//using an event listener to close the dropdown when clicking outside of it
window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {
  var myDropdown = document.getElementById("myDropdown");
    if (myDropdown.classList.contains('show')) {
      myDropdown.classList.remove('show');
    }
  }
}

</script>
</header>
</head>
<body>

<div class="dashboardbody">

	<div class="accdata">
	<h3 class="welcometext">Welcome ${session_fname}!</h3>
	<table>
      
    	<tr>
      		<th>Your account:</th>
      		<th></th>
    	</tr>
  		<tbody>
   			 <tr class="row1">
      			<td>${session_accno}</td>
      			<td class="balancetxt">Rs.${session_balance}</td>
   			</tr>
   			
   			<tr class="row2">
      			<td>(${session_acctype})</td>
      			<td></td>
   			</tr>
   			
  		</tbody>
	</table>
	</div>
	
</div>


</body>
<center>
<footer>
		<div class="footerbox">
		<br>
	
   			 <div class="footer-links">
     			 <a href="#">About us</a> |
     			 <a href="#">Help</a> |
     			 <a href="#">FAQ</a> |
     			 <a href="#">User guide</a> |
				 <a href="contactus.jsp">Contact us</a> |
     			 <a href="#">Privacy policy</a>
    		</div>
    		
    		
		<br>    
    	<div class="connect">
        	<p class="connect-text">Connect with us</p>
        	<a target="_blank "href="https://www.facebook.com/"><img src="http://localhost:8082/Bank_System/assets/images/fb.png" alt="Facebook Logo" width="25px" height="25px" class="sm"></a>
        	<a target="_blank "href="https://www.instagram.com/"><img src="http://localhost:8082/Bank_System/assets/images/insta.png" alt="Instagram Logo" width="25px" height="25px" class="sm"></a>
        	<a target="_blank "href="https://www.twitter.com/"><img src="http://localhost:8082/Bank_System/assets/images/twitter.png" alt="Twitter Logo" width="25px" height="25px" class="sm"></a>
        	<a target="_blank "href="https://www.youtube.com/"><img src="http://localhost:8082/Bank_System/assets/images/yt.jpg" alt="YouTube Logo" width="32px" height="23px" class="sm"></a>
    	</div>
    	
    	<div class="footer-bottom">
     		 © All rights reserved - Ceylon Bank
    	</div>
    	
    	<div class="footer-logo">
        	<img src="http://localhost:8082/Bank_System/assets/images/favicon.png" alt="Ceylon Bank logo" width="44px" height="44px">
   		 </div>
	 </div>
</footer>
</center>
</html>