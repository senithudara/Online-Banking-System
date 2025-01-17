<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="icon" type="image/x-icon" href="http://localhost:8082/Bank_System/assets/images/favicon.png">
	<link href="http://localhost:8082/Bank_System/assets/css/style2.css" rel="stylesheet">
	
	
<title>Dashboard</title>
    		<button class="submitbtn1" onclick="openModal()">Delete Account</button>



<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>
    <form action="deleteaccount" method="post">
      Enter your password<br>
      <input type="text" id="text-input" name="pwd">
      <br>
      <button type="submit" class="submitbtn1">Submit</button>

      <button type="button" onclick="closeModalForm()" class="submitbtn1">Close</button>
    </form>
  </div>
</div>

<script>
function openModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
}

function closeModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}

// Function to close the form
function closeModalForm() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}
</script>


<!DOCTYPE html>
<html>
<head>
    <script>
        function validateForm() {
            var password1 = document.getElementById("password1").value;
            var password2 = document.getElementById("password2").value;

            if (password1 !== password2) {
                // Passwords do not match
                document.getElementById("password-error").innerHTML = "Passwords do not match.";
                return false;
            }
            
            // Passwords match
            return true;
        }
    </script>
</head>
<body>

<h2>Registration Form</h2>
<form onsubmit="return validateForm()">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>

    <label for="password1">Password:</label>
    <input type="password" id="password1" name="password1" required><br><br>

    <label for="password2">Confirm Password:</label>
    <input type="password" id="password2" name="password2" required>
    <p id="password-error" style="color: red;"></p><br><br>

    <input type="submit" value="Register">
</form>

</body>
</html>



</body>

</html>