<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>

<%@ include  file="/include/Header.jsp"%>
<link rel="stylesheet" href="css/home.css">
</head>

<body style="padding-top: 65px;">
	<div class="py-3 text-center" style="background-color: #57bc90;/*green*/">
		<h1> Contact Us </h1>
	</div>
	<div class="row pb-3" style="background-color: #57bc90;/*green*/">
		<form class="col-md-2 offset-md-5" action="mailto:nicky.5-0cab@sympatico.ca" method="post" enctype="text/plain">
			Name:<br>
			<input type="text" name="name"><br>
			Your E-mail:<br>
			<input type="text" name="mail"><br>
			Comments:<br>
			<input type="text" name="comment" size="50">
			<br>
			<br>
			<input type="submit" value="Send">
			<input type="reset" value="Reset">
		</form>
	</div>
	<div class="text-center pb-3" style="background-color: #57bc90;/*green*/">
		<div class="text-center">
			<p style="font-size:30px; display:inline-block;">Not what you're looking for?</p> <a href="tel:519-270-7648" style="font-size: 30px;">Phone Us</a>
		</div>
		<h2>For information on corporate accounts or concerns, please contact Nicky Neal</h2>
	</div>


</body>
<footer>
<%@ include  file="/include/Footer.jsp"%>
</footer>
<script type="text/javascript" src="js/hamburgerMenu.js"></script> <!-- Javascript to show/hide Hamburger Menu -->
</html>