<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Nathan Young, 2020">
<title>5-0 Cab Home</title>

<head>
<!--  For Bootstrap Styling  -->
<link href="css/bootstrap-4.0.0.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}css/my_css.css" rel="stylesheet">
</head>

<body style="padding-top: 5px;">

<nav class="navbar navbar-expand navbar-dark bg-dark">
	<a class="navbar-brand">
		<img src="${pageContext.request.contextPath}/images/Logo.png" alt="cab" width="80" height="60">
	</a>
	<h1 class ="title-text">Booking Application</h1>
	
</nav>
<br>
<div class="container">
<div class="jumbotron">
  <h1 class="text-center">Book a Cab Online!</h1>
  <p class="lead text-center">Press The Big Green Button to get Started!</p>
  <hr>
  <p class="lead">
    <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
  </p>
</div>
</div>


	<div class="container-fluid py-3" style="background-color: #57bc90;/*green*/ border-bottom:1px solid grey;">
		<div class="row">
			<div class="col text-center">
				
			</div>
		</div>
		<div class="row">
			<div class="col text-center">
				<h2 class="col">With our new booking system, ordering a cab could not be any easier.</h2>
			</div>
		</div>
	    <div class="row">
			<div class="col-md-2 offset-md-5">
				<a class="row justify-content-center texdec" href="${pageContext.request.contextPath}/upload.jsp">
	    			<input class="ctaButton" type="Button" value="Request a Cab"/>
	    		</a>
			</div>
		</div>
	</div>
	<div class="container-fluid py-3" style="border-bottom:1px solid grey;">
		<div class="row pb-3">
			<div class="col text-center">
				<h2>What We Provide</h2>
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<div class="col-4 text-center">
				<h2>Vans</h2>
				<div class="row">
					<div class="col-2">
					</div>
					<div class="col-8">
						<p>5-0 Cab offers a number of vans at no additional charge. Bought a lot of groceries? We can help with that. Need to bring something big across town, we're here to help!.</p>
						<a class="row justify-content-center texdec"href="${pageContext.request.contextPath}/upload.jsp">
	    					<input class="moreButton" type="Button" value="Find Out More"/>
	    				</a>
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
						<a class="row justify-content-center texdec"href="${pageContext.request.contextPath}/upload.jsp">
	    					<input class="moreButton" type="Button" value="Find Out More"/>
	    				</a>
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
						<a class="row justify-content-center "href="${pageContext.request.contextPath}/upload.jsp">
	    					<input class="moreButton" type="Button" value="Find Out More"/>
	    				</a>
					</div>
					<div class="col-2">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid py-3" style="background-color: #57bc90;/*green*/ border-bottom:1px solid grey;">
		<div class="row">
			<div class="col text-center">
				<h2>Proudly Sponsoring</h2>
			</div>
		</div>
		<div class="d-flex justify-content-center">
		</div>
	</div>

</body>

<%@ include  file="/include/Footer.jsp"%>

</html>