<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<link rel="icon" type="image/x-icon" href="http://localhost:8082/Bank_System/assets/images/favicon.png">
<link href="http://localhost:8082/Bank_System/assets/css/style2.css" rel="stylesheet">

<header>
	<div class="headerbox">
   
   		<div class="headeritem">
       		<a href="profile.jsp"><img src="http://localhost:8082/Bank_System/assets/images/logo2.png" width="324" height="90" class="cblogo">
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

function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

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

<center>
<div class="register1">	
	<div class="regForm">
	    	<p class="regtext">Edit your details to update</p>
	
  	   <form action="updatedata" method="post" id="form1" autocomplete="off">
    
    	
    		First Name<br><input type="text" name="efname" value="${session_fname}" class="editinput" required><br>
    	
    		Last Name<br><input type="text" name="elname" value="${session_lname}" class="editinput" required><br>
    		
    		Name with initials<br><input type="text" name="efullnme" value="${session_fullname}" class="editinput" required><br>
    		
    		Birth Date<br><input type="date" name="ebdate" min="1900-01-01" max="2004-12-21" value="${session_bday}" class="editinput" required><br>
           
    		Mobile Number<br><input type="tel" name="emnum" pattern="[+][9][4] [0-9]{2} [0-9]{3} [0-9]{4}" placeholder="+94 76 123 1234" value="${session_phone}" class="editinput" maxlength="15" required><br>
    		
    		Email<br><input type="email" name="eemail" value="${session_email}" class="editinput" required><br>
    		
    		<input type="submit" name="submit" value="Update Data" class="submitbtn1">
    		<br>
     	
     </form>
     <div class="dltbtnarea">
         <a href="changepass.jsp"><button class="submitbtn1">Change Password</button></a><br>
    <button class="dltbtn" onclick="openModal()">Delete Account</button> &nbsp<a href="redirect.jsp"><button class="dltbtn">Cancel</button></a>
     </div>
    </div>
    
</div>    		
</center>

</body>


<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>
    <form action="deleteaccount" method="post" autocomplete="off">
      Enter your password &nbsp
      <input type="text" id="text-input" name="pwd">
      <button type="submit" class="submitbtn1">Delete Account</button>

      <button type="button" onclick="closeModalForm()" class="submitbtn1">Close</button>
    </form>
  </div>
</div>

<script>

//displaying the popup when the button is clicked
function openModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
}

//closing the popup when the x icon is clicked
function closeModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}

//closing the popup when the close button is clicked
function closeModalForm() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}
</script>

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