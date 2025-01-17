<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="icon" type="image/x-icon" href="http://localhost:8082/Bank_System/assets/images/favicon.png">
	<link href="http://localhost:8082/Bank_System/assets/css/style2.css" rel="stylesheet">
	
<title>Admin Dashboard</title>

<header>
	<div class="headerbox">
   
   		<div class="headeritem">
       		<img src="http://localhost:8082/Bank_System/assets/images/logo2.png" width="324" height="90" class="cblogo">
  		</div> 
  	   
 		
   	
	</div>

</header>
</head>
<body>
   	 
   	<div class="admintxt">  		
   	<h1>Administrator Dashboard</h1>
	<h3>Welcome ${session_name}!</h3>
	</div>
	
	<div class="adminbtns">
	<a href="#"><button>Review Loans</button></a>
	<a href="#"><button>View Transactions</button></a>
	<a href="#"><button>Edit FAQ page</button></a>
	<a href="#"><button>Edit User Profile</button></a>
	
	</div>
	
</body>
</html>