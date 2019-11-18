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
	
	<!-- Hamburger Menu Actual -->
            <div id="hamLinks" class="hamLinkCont">
            	<div class="hamLink">
	        		<a href="">Login</a></br>
	        	</div>
	        	<div class="hamLink">
	        		<a href="">Create Account</a></br>
	        	</div>
	        	<div class="hamLink">
	        		<a href="">Help</a></br>
	        	</div>
            </div><!-- End Hamburger Menu Actual -->

        <!-- CALL TO ACTION -->
        <div class="ctaCont">
            <h1>Book a Cab Online!</h1>
            <h2>With our new booking system, ordering a cab could not be any easier.</h2>
            <a href="${pageContext.request.contextPath}/upload.jsp">
            <input class="ctaButton" type="Button" value="Request a Cab"/>
            </a>
        </div><!-- End CALL TO ACTION -->

        <!-- Information -->
        <div class="infoCont">
            <h2>What We Provide</h2>
            <div class="infoBoxCont">
                <div class="infoBox">
                    <h2>Vans</h2>
                    <p>5-0 Cab offers a number of vans at no additional charge. Bought a lot of groceries? We can help with that. Need to bring something big across town, we're here to help!.</p>
                </div>
        </div><!-- End Information -->

        <!-- Sponsoring -->
        <div class="sponsorsCont">
            <h2>Proudly Sponsoring</h2>
            <img class="sponsored" src="images/logo.png">
            <img class="sponsored" src="images/logo.png">
            <img class="sponsored" src="images/logo.png">
            <img class="sponsored" src="images/logo.png">
        </div><!-- End Sponsoring -->

        <!-- Footer -->
        <div class="footCont">
            <div class="footButtonCont">
            	<a href="index.html" class="footButton">About Us</a>
            	<a href="index.html" class="footButton">Contact Us</a>
            	<a href="index.html" class="footButton">Terms</a>
                <!--<input class="footButton" type="button" value="Privacy Policy" />-->
            </div>
        </div><!-- End Footer -->
</body>
<footer>
<%@ include  file="/include/Footer.jsp"%>
</footer>
<script type="text/javascript" src="js/hamburgerMenu.js"></script> <!-- Javascript to show/hide Hamburger Menu -->
</html>