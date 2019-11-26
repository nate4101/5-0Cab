<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>

<%@ include  file="/include/Header.jsp"%>
<link rel="stylesheet" href="css/home.css">

<link href="js/mapbox/mapbox.css" rel="stylesheet" type="text/css" />
</head>

<body style="padding-top: 65px;">

	<div class="container-fluid py-3" style="background-color: #76BED0;/*blue*/">
		<div class="row">
			<div class="col text-center">
				<h1>Book a Cab Online!</h1>
			</div>
		</div>
		<div class="row">
			<div class="col text-center">
				<h2 class="col">With our new booking system, ordering a cab could not be any easier.</h2>
			</div>
		</div>
	    <div class="row">
			<div class="col">
				<a class="row justify-content-center"href="${pageContext.request.contextPath}/upload.jsp">
	    			<input class="ctaButton" type="Button" value="Request a Cab"/>
	    		</a>
			</div>
		</div>
	</div>
	<div class="container-fluid pt-3">
		<div class="row pb-3">
			<div class="col text-center">
				<h2>What We Provide</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-4 text-center">
				<h2>Vans</h2>
				<div class="row">
					<div class="col-2">
					</div>
					<div class="col-8">
						<p>5-0 Cab offers a number of vans at no additional charge. Bought a lot of groceries? We can help with that. Need to bring something big across town, we're here to help!.</p>
					</div>
					<div class="col-2">
					</div>
				</div>
			</div>
			<div class="col-4 text-center">
				<h2>Vans</h2>
				<div class="row">
					<div class="col-2">
					</div>
					<div class="col-8">
						<p>5-0 Cab offers a number of vans at no additional charge. Bought a lot of groceries? We can help with that. Need to bring something big across town, we're here to help!.</p>
					</div>
					<div class="col-2">
					</div>
				</div>
			</div>
			<div class="col-4 text-center">
				<h2>Vans</h2>
				<div class="row">
					<div class="col-2">
					</div>
					<div class="col-8">
						<p>5-0 Cab offers a number of vans at no additional charge. Bought a lot of groceries? We can help with that. Need to bring something big across town, we're here to help!.</p>
					</div>
					<div class="col-2">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid py-3" style="background-color: #76BED0;/*blue*/">
		<div class="row">
			<div class="col text-center">
				<h2>Proudly Sponsoring</h2>
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<div><img class="sponsored" src="images/Logo.png"></div>
			<div><img class="sponsored" src="images/Logo.png"></div>
			<div><img class="sponsored" src="images/Logo.png"></div>
			<div><img class="sponsored" src="images/Logo.png"></div>
		</div>
	</div>

</body>
<footer>
<%@ include  file="/include/Footer.jsp"%>
</footer>
<script type="text/javascript" src="js/hamburgerMenu.js"></script> <!-- Javascript to show/hide Hamburger Menu -->
</html>