<%@ page import="helper.EnviromentVariables" %>
<%@ page import="org.json.JSONWriter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Nathan Young, 2020">
	<title>Request a 5-0 Cab</title>
	<!--  For Bootstrap Styling  -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/my_css.css" rel="stylesheet">
	<!-- FontAwesome Icons Free kit -->
	<script src="https://kit.fontawesome.com/29c153f1be.js" crossorigin="anonymous"></script>
	<!-- Recaptcha -->
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	<link rel="icon" href="${pageContext.request.contextPath}/images/favicon-32x32.png">
</head>
<!-- Page Contents -->
<body style="background-image: url(${pageContext.request.contextPath}/images/Tortoise-Shell.svg); font-family: 'Helvetica Neue'">

<!-- Some Extra padding at the start based on viewport-->
<div class="d-none d-sm-block pt-5 pb-4"></div>

<!-- All Things Navbar -->
<nav class="navbar border border-dark navbar-expand-sm  fixed-bottom navbar-light bg-light" id="navbarContainer">
	<div class="navbar-brand border border-secondary">
		<img class="ml-0 pl-0 mt-1 mr-3" src="${pageContext.request.contextPath}/images/Logo.png" alt="cab" width="90" height="45">
	</div>

	<span class="d-block d-sm-none h5 align-content-end"></span>
	<button class="navbar-toggler bg-light border-dark py-2" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		Menu  <span class="navbar-toggler-icon ml-2"></span>
	</button>

	<div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
		<ul class="navbar-nav">
			<!-- Modify Based on Logged in User
                - End User: Home, Help, Admin Login, |Highlighted|Active Request|Highlighted|
            -->
			<% 	// Admin
				if(request.getSession(false).getAttribute("role")=="admin"){%>
			<li class="nav-item m-1">
				<a class="btn btn-lg btn-outline-dark nav-link" href="index.jsp">
					Home
					<i class="fa fa-home" aria-hidden="true"></i></a></a>
			</li>
			<li class="nav-item m-1">
				<a href="adminUpdateCabs.jsp" class="btn btn-lg btn-outline-dark nav-link" type="button">
					Update Cabs
					<i class="fas fa-tools"></i>
				</a>
			</li>
			<li class="nav-item m-1 d-sm-none d-md-block">
				<a href="adminLogs.jsp" class="btn btn-lg btn-outline-dark nav-link mt-0" type="button">
					Logs
					<i class="fa fa-file-text" aria-hidden="true"></i>
				</a>
			</li>
			<li class="nav-item m-1 d-sm-none d-md-block">
				<a href="${pageContext.request.contextPath}/Logout" class="btn btn-lg btn-outline-dark nav-link mb-0" type="button">
					Logout
					<i class="fa fa-sign-out" aria-hidden="true"></i>
				</a>
			</li>
			<%}%>
			<% // Dispatcher
				if(request.getSession(false).getAttribute("role")=="dispatcher") { %>
			<li class="nav-item m-1">
				<a class="btn btn-lg btn-outline-dark nav-link " disabled href="index.jsp">
					Home
					<i class="fa fa-home" aria-hidden="true"></i></a></a>
				</a>
			</li>
			<li class="nav-item m-1">
				<a href="dispatcher.jsp" class="btn btn-lg btn-outline-dark nav-link" type="button">
					Dispatch Page
					<i class="fas fa-table"></i>
				</a>
			</li>
			<li class="nav-item m-1 d-sm-none d-md-block">
				<a href="dispatcherMap.jsp" class="btn btn-lg btn-outline-dark nav-link mt-0" type="button">
					Vehicle Map
					<i class="fa fa-map" aria-hidden="true"></i>
				</a>
			</li>
			<li class="nav-item m-1 d-sm-none d-md-block">
				<a href="${pageContext.request.contextPath}/Logout" class="btn btn-lg btn-outline-dark nav-link mb-0" type="button">
					Logout
					<i class="fa fa-sign-out" aria-hidden="true"></i>
				</a>
			</li>
			<%}%>
			<%	// End User
				if(request.getSession(false).getAttribute("role")==null) { %>
			<li class="nav-item m-1">
				<a class="btn btn-lg btn-outline-dark nav-link "  href="index.jsp">
					Home
					<i class="fa fa-home" aria-hidden="true"></i></a>
			</li>

			<li class="nav-item active m-1">
				<a href="uploadRequest.jsp" class="btn btn-lg btn-outline-dark nav-link" type="button">
					Book a Cab
					<i class="fa fa-taxi" aria-hidden="true"></i>
				</a>
			</li>

			<li class="d-sm-none d-md-block">
				<a href="contactUs.jsp" class="btn btn-lg btn-outline-dark nav-link m-1" type="button">
					Contact Us
					<i class="fa fa-envelope" aria-hidden="true"></i>
				</a>
			</li>
			<li class="d-sm-none d-md-block">
				<a href="bookingHelp.jsp" class="btn btn-lg btn-outline-dark nav-link m-1" type="button">
					Help Booking
					<i class="fa fa-question" aria-hidden="true"></i>
				</a>
			</li>
			<%}%>
			<li class="nav-item pr-2 my-2 my-sm-0 btn-group d-none d-sm-block d-md-none">
				<!-- Default dropup button -->
				<div class="btn-group dropdown " id="dropdownDiv">
					<button type="button" class="btn btn-lg btn-outline-dark nav-link dropdown-toggle m-1" data-toggle="dropdown">
						Other Links
					</button>
					<div class="dropdown-menu py-0">
						<ul class="list-group border border-dark rounded">

							<!-- Dropdown menu links -->
							<% 	// Admin
								if(request.getSession(false).getAttribute("role")=="admin"){%>
							<a href="adminLogs.jsp" class="btn btn-lg btn-outline-dark nav-link mt-0" type="button">
								Logs
								<i class="fa fa-file-text" aria-hidden="true"></i>
							</a>
							<a href="${pageContext.request.contextPath}/Logout" class="btn btn-lg btn-outline-dark nav-link mb-0" type="button">
								Logout
								<i class="fa fa-sign-out" aria-hidden="true"></i>
							</a>
							<%}%>
							<% // Dispatcher
								if(request.getSession(false).getAttribute("role")=="dispatcher") { %>
							<a href="dispatcherMap.jsp" class="btn btn-lg btn-outline-dark nav-link mt-0" type="button">
								Vehicle Map
								<i class="fa fa-map" aria-hidden="true"></i>
							</a>
							<a href="${pageContext.request.contextPath}/Logout" class="btn btn-lg btn-outline-dark nav-link mb-0" type="button">
								Logout
								<i class="fa fa-sign-out" aria-hidden="true"></i>
							</a>
							<%}%>
							<%	// End User
								if(request.getSession(false).getAttribute("role")==null) { %>
							<a href="contactUs.jsp" class="btn btn-lg btn-outline-dark nav-link mt-0" type="button">
								Contact Us
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</a>
							<a href="helpBooking.jsp" class="btn btn-lg btn-outline-dark nav-link mt-1" type="button">
								Help Booking
								<i class="fa fa-question" aria-hidden="true"></i>
							</a>
							<%}%>
						</ul>
					</div>
				</div>
			</li>
		</ul>
	</div>
</nav>
<br>
<!-- End of NavBar -->
<!-- Checking some messages -->
<% if(request.getSession().getAttribute("error")!=null) {
%>
<div class="alert alert-danger" role="alert">
	<% out.println(request.getSession().getAttribute("error"));
		request.getSession().setAttribute("error",null);
	%>
</div>
<%
	}
%>
<% if(request.getSession().getAttribute("success")!=null) {
%>
<div class="alert alert-success" role="alert">
	<% out.println(request.getSession().getAttribute("success").toString());
	request.getSession().setAttribute("success",null);%>
</div>
<%
	}
%>
<!-- Card for Request Form -->
<div class="container">
	<div class = "row">
		<div class="col-12">
			<!-- Card -->
			<div class="card bg-light text-dark">
				<div class="card-header bg-light text-center">
					<h1 class="text-dark">Request Form</h1>
				</div>
				<!-- Card Body -->
				<div class="card-body border-dark border-rounded" >
					<!-- Submission Form -->
					<form action="CreateRequest" method="post" autocomplete="off">
						<h3>Required:</h3>
						<div class="form-group">
							<label for="searchBox">Enter Your Location:</label>
							<input style ="width: 95%; box-sizing: auto !important;" type="text" id='searchBox' class="form-control" placeholder="Search Box" required>
							<small id='searchBoxContainer' class="text-muted"></small>
						</div>
						<!-- Hidden Form for Location, passed to the backend, written by the bing api -->
						<div class="form-group">
							<!-- Pickup Location String -->
							<input type="hidden" class="form-control" id="location" name="loc" maxlength="127" value="" required>
						</div>
						<!-- Hidden Form for lat and lon, passed to the backend, written by the bing api -->
						<div class="form-group">
							<!-- Pickup Location String -->
							<input type="hidden" class="form-control" id="coords" name="coordinates" maxlength="127" value="" required>
						</div>
						<div class="form-group">
							<label for="size">Number of Passengers:</label>
							<input type="number" class="form-control" id="size" name="size" min="1" step="1" id="num-input" required>
							<small class="text-muted">
								1 or more
							</small>
						</div>
						<hr>
						<h3>Optional:</h3>
						<div class="form-group">
							<label for="instructions">Extra Details:</label>
							<textarea class="form-control" id="instructions" name="instructions" rows= "4" maxlength="127"></textarea>
							<small class="text-muted">
								Maximum of 127 Characters.
							</small>
						</div>
						<h3>Verification:</h3>
						<div class="g-recaptcha  mb-0" data-size="" data-sitekey="6LcLwLgZAAAAAE2IfEMP_cSgOWrJFiUKqPquV5Ii" data-callback="recaptchaOnSuccess" data-expired-callback="recaptchaOnExpired" data-error-callback="recaptchaOnError"></div>

						<div class="form-group row pt-0">
							<div class="col-9 col-sm-8 col-md-6 col-lg-4 input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="prepend">Completed:</span>
								</div>
								<!-- Recaptcha String Stuff-->
								<input type="text" class="form-control bg-white" id="recaptcha" name="recaptcha" maxlength="127" value="False"  disabled>
								<input type="hidden" id="hiddenRecaptcha" name="recaptcha" value="">
							</div>
						</div>
						<br>
						<div class="text-center">
							<input type="submit" class="btn btn-outline-dark" value="Send Request">
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
</div>
<div class="d-block d-sm-none pt-5 pb-5"></div>
<!-- Recaptcha Script -->
<script type="application/javascript">

	function recaptchaOnSuccess(){
		let x = grecaptcha.getResponse();
		document.getElementById("hiddenRecaptcha").value=x;
		let recaptcha=document.getElementById("recaptcha");
		recaptcha.value="Success";
		recaptcha.className="form-control bg-success";
	}
	function recaptchaOnExpired(){
		document.getElementById("hiddenRecaptcha").value="";
		let recaptcha=document.getElementById("recaptcha");
		recaptcha.value="Reverify";
		recaptcha.className="form-control bg-danger";

	}
	function recaptchaOnError(){
		let x = grecaptcha.getResponse();
		document.getElementById("hiddenRecaptcha").value="";
		let recaptcha=document.getElementById("recaptcha");
		recaptcha.value="Refresh Page & Try Again";
		recaptcha.className="form-control bg-warning";
	}
</script>
<!-- Jquery then...-->
<script src="js/jquery-3.5.1.js"></script>
<!-- Popper then... -->
<script src="js/popper.min.js"></script>
<!-- Bootstrap... -->
<script src="js/bootstrap.min.js"></script>
<!-- Adjust Navbar location on screen width -->
<script src="js/navbarAdjust.js"></script>
<!-- bing maps web v8 sdk -->
<script type='text/javascript' src='https://www.bing.com/api/maps/mapcontrol?key=Au8wJoDxUyZXZ-x6Er5X1JD2cgKRT9syoPDsFq8b6tLFrbH5y3EYUb_8rrItR2Eo&callback=loadMapScenario' async defer></script>
<!-- a script that used web v8 sdk -->
<script src="js/BingAutoSuggest.js"></script>

</body>
</html>