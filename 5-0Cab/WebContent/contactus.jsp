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

<body>
	<body>
	<h1 style="background-color:#00FF00; font-size: 60px"> Contact Us </h1>
	<a href="tel:519-270-7648" style="font-size: 35px"; >Phone Us</a>

	<h2>For information on corporate accounts or concerns contact; Manager: Nicky Neal</h2>

<form action="mailto:nicky.5-0cab@sympatico.ca" method="post" enctype="text/plain">
Name:<br>
<input type="text" name="name"><br>
Your E-mail:<br>
<input type="text" name="mail"><br>
Comments:<br>
<input type="text" name="comment" size="50"><br><br>
<input type="submit" value="Send">
<input type="reset" value="Reset">
</form>
</body>
<footer>
<%@ include  file="/include/Footer.jsp"%>
</footer>
<script type="text/javascript" src="js/hamburgerMenu.js"></script> <!-- Javascript to show/hide Hamburger Menu -->
</html>