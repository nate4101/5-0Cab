<%@ page import="helper.DBHelper" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>

<%
	for(Cookie c : request.getCookies()){
		if(c.getName().contains("5_0Cab")){
			session.setAttribute("requestID",c.getValue());
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Nathan Young, 2020">

	<title>5-0 Cab Home</title>
	<!--  For Bootstrap Styling  -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/my_css.css" rel="stylesheet">
	<!-- FontAwesome Icons Free kit -->
	<link rel="icon" href="${pageContext.request.contextPath}/images/favicon-32x32.png">
</head>

<body style="background-image: url(${pageContext.request.contextPath}/images/Tortoise-Shell.svg); font-family: 'Helvetica Neue';">

<!-- Some Extra padding at the start based on viewport-->
<div class="d-none d-sm-block pt-5 pb-4"></div>

<!-- All Things Navbar -->
<nav class="navbar border border-dark navbar-expand-sm  fixed-bottom navbar-light bg-light " id="navbarContainer" style="padding-right: 0">
	<div class="navbar-brand border border-secondary mr-0">
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
			<li class="nav-item active m-1">
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
			<li class="nav-item active m-1">
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
			<li class="nav-item active m-1">
				<a class="btn btn-lg btn-outline-dark nav-link "  href="index.jsp">
					Home
					<i class="fa fa-home" aria-hidden="true"></i></a>
			</li>
			<% if(request.getSession(false).getAttribute("requestID")!=null){ %>
			<li class="nav-item m-1">
				<a href="activeRequest.jsp" class="btn btn-lg btn btn-info border-dark nav-link" type="button">
					Active Request
					<i class="fa fa-taxi" aria-hidden="true"></i>

				</a>
			</li>
			<%}else{%>
			<li class="nav-item  m-1">
				<a href="uploadRequest.jsp" class="btn btn-lg btn-outline-dark nav-link" type="button">
					Book a Cab
					<i class="fa fa-taxi" aria-hidden="true"></i>
				</a>
			</li>
			<%}%>
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

<!-- Serving North Bay SVG -->
<div class="container" id="svgContainer">
	<div style="text-align: center;">
		<svg width="100%" height="50%"  viewBox="0 0 454 95" xmlns="http://www.w3.org/2000/svg" style=" margin: auto;">
			<!-- Created with Method Draw - http://github.com/duopixel/Method-Draw/ -->
			<g>
				<title>background</title>
				<rect fill="none" id="canvas_background" height="95" width="454" y="-1" x="-1"/>
				<g display="none" overflow="visible" y="0" x="0" height="100%" width="100%" id="canvasGrid">
					<rect fill="url(#gridpattern)" stroke-width="0" y="0" x="0" height="100%" width="100%"/>
				</g>
			</g>
			<g>
				<title>Layer 1</title>
				<ellipse stroke="#000" ry="106" rx="225.5" id="svg_17" cy="-13.5" cx="226" fill-opacity="null" stroke-opacity="null" fill="#e9ecef"/>
				<text stroke="#000" transform="matrix(1,0,0,1.5631896317055685,0,-42.29317529048818) " font-style="" font-weight="normal" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="26" id="svg_18" y="55.5" x="48" fill-opacity="null" stroke-opacity="null" stroke-width="0" fill="#000000">Serving North Bay Since 1975</text>
			</g>
		</svg>
	</div>
</div>

<!--  Page Contents Container -->
<div class="container text-center">
	<!-- Request JumboTron and Button-->
	<div class = "row">
		<div class = "col-0 col-md-1"></div>
		<div class="col-12 col-md-10">
			<div class="jumbotron border border-dark mb-4 pt-4" >
				<div class="container text-center">
					<h1 class="display-4" style="font-family: 'Helvetica Neue'; "><b>Book a Cab Online!</b></h1>
					<p class="lead text-center" style="font-family: 'Helvetica Neue';">Press The Big Green Button to get Started!</p>
					<hr style="border-top: 5px dashed black;">
					<a href="${pageContext.request.contextPath}/uploadRequest.jsp">
						<button type="button" class="btn btn-success btn-circle btn-xl">
							<i class="fas fa-taxi fa-3x"></i>
						</button>
					</a>
					<hr style="border-top: 5px dashed black;">
				</div>
			</div>
		</div>

		<div class = "col-0 col-md-1"></div>
	</div>

	<!-- Covid-19 Response, future general purpose media? -->
	<div class="row">
		<div class = "col-0 col-md-1"></div>
		<div class="col-12 col-md-10">
			<div class="jumbotron border border-dark mb-4">
				<h2 class="text-center " style="font-family: 'Helvetica Neue'; "><b>Our Covid-19 Commitment</b></h2>
				<hr style="border-top: 2px solid black;">
				<p class="lead text-center" style="font-family: 'Helvetica Neue'; ">
					We at 5-0 Cab are aware of the crisis that has come to bear amid the wake of COVID-19 and the strain it has put on everyone.
					In an effort to maintain the safety of the health of both our customers and our drivers,
					all of our vehicles have been supplied with hand sanitizer and disinfectant wipes to clean the vehicles throughout the day.
				</p>
				<p class="lead text-center" style="font-family: 'Helvetica Neue'; ">
					As stated by the government, and on social media, we ask that if you are feeling unwell,
					or are symptomatic that you get checked out as quickly as possible and follow the directions of your health care provider.
				</p>
				<p class="lead text-center" style="font-family: 'Helvetica Neue'; ">
					Until otherwise notified, we will continue to serve our city and our community with outstanding service 24 hours a day, 7 days a week.
				</p>
			</div>
		</div>
		<div class = "col-0 col-md-1"></div>
	</div>
	<!--  Carousel in Jumbotron -->
	<div class = "row">
		<div class="col-0 col-md-1"></div>
		<div class="col-12 col-md-10">
			<div class="jumbotron border border-dark mb-4" >
				<h2 class="text-center " style="font-family: 'Helvetica Neue'; "><b>About Us and Our Community</b></h2>
				<hr style="border-top: 2px solid black;">
				<div class="5-0slideshow">
					<div id="carousel" class="carousel carousel-fade" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleCaptions" data-slide-to="0" class="bg-secondary"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="1" class="bg-secondary"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="2" class="active bg-secondary"></li>
						</ol>
						<div class="carousel-inner">
							<%--	Comp Sci Development Team--%>
							<div class="carousel-item">
								<img src="images/SoftwareEngineering.jpg" class="rounded" width="100%" height="100%">
								<div class="carousel-caption bg-light rounded px-2" style="opacity: 80%;">
									<h5 class="d-none d-sm-block" style="color: black">5-0Cab's Nicky Neal working with Nipissing's Computer Science Students.</h5>
									<h5 class="d-block d-sm-none" style="color: black">Web app in development.</h5>
									<a class="bg-dark rounded px-2 pb-1" style="color: white; opacity: 100% !important;"
									   href="https://www.nugget.ca/news/local-news/taxi-business-turns-to-students-to-create-app?fbclid=IwAR0ucloSyvgku6bkPLq9paqjMkGb071a0KNdmMcqRAoEf20dJayi7_7FLGQ">
										<u>North Bay Nugget</u></a>
								</div>
							</div>
							<%--	North Bay Hospital	--%>
							<div class="carousel-item">
								<img src="images/HospitalCabs.png" class="rounded" width="100%" height="100%">
								<div class="carousel-caption bg-light rounded px-2" style="opacity: 80%;">
									<h5 class="d-none d-sm-block" style="color: black">5-0 Cab solutes health care workers for their hard work during Covid-19 pandemic</h5>
									<h5 class="d-block d-sm-none" style="color: black">5-0 Cab Solutes Hospital</h5>
									<a class="bg-dark rounded px-2 pb-1" style="color: white; opacity: 100% !important;"
										href="https://www.facebook.com/114070413579827/videos/661877254643968/?__cft__[0]=AZUkx8mykuD9pKHxJDpQuanWeKVFtcjVzs2yoclGiot4JsEmyzeH1H6VmHf5yzl-lPdJ36nG-4q7wHmsSoO-V2zdAyGV979qtjl8i_cdQNmjfERLA4alDv_LqR9N5nFHXnKdKDUVRO23z--2bilcbjaEIroO0A3r7ffhMX_W3DZMB4GSxciECPCY20Nnwzbh_wU&__tn__=H-R">
									<u>FaceBook Post</u></a>
								</div>
							</div>
							<%--	HOPES Kitchen --%>
								<div class="carousel-item active">
									<img src="images/HopesKitchen.png" class="rounded" width="100%" height="100%">
									<div class="carousel-caption bg-light rounded px-2" style="opacity: 80%;">
										<h5 class="d-none d-sm-block" style="color: black">5-0Cab helps local kitchen get meals out to those in need, while their vehicle is in service.</h5>
										<h5 class="d-block d-sm-none" style="color: black">5-0 Cab Helping the Community</h5>
										<a class="bg-dark rounded px-2 pb-1" style="color: white; opacity: 100% !important;"
										   href="https://www.facebook.com/114070413579827/videos/661877254643968/?__cft__[0]=AZUkx8mykuD9pKHxJDpQuanWeKVFtcjVzs2yoclGiot4JsEmyzeH1H6VmHf5yzl-lPdJ36nG-4q7wHmsSoO-V2zdAyGV979qtjl8i_cdQNmjfERLA4alDv_LqR9N5nFHXnKdKDUVRO23z--2bilcbjaEIroO0A3r7ffhMX_W3DZMB4GSxciECPCY20Nnwzbh_wU&__tn__=H-R">
											<u>FaceBook Post</u></a>
									</div>
								</div>
						</div>
						<a class="carousel-control-prev " href="#carousel" role="button" data-slide="prev">
							<span class="carousel-control-prev-icon bg-dark rounded mt-1" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
							<span class="carousel-control-next-icon bg-dark rounded mt-1" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  What we Provide JumboTron -->
	<div class="row">
		<div class = "col-0 col-md-1"></div>
		<div class="col-12 col-md-10">
			<div class="jumbotron border border-dark mb-4">
				<h2 class="text-center display-5" style="font-family: 'Helvetica Neue'; "><b>What We Provide</b></h2>
				<hr style="border-top: 2px solid black;">
				<div class="container text-center">
					<div class="row content-justify-center">
						<div class="col-12">
							<ul>
								<li>
									<p class="lead text-center " style="font-family: 'Helvetica Neue'; ">5-0 Cab offers a number of vans at no additional charge. Bought a lot of groceries? We can help with that. Need to bring something big across town, we're here to help!
									</p>
								</li>
								<li>
									<p class="lead text-center " style="font-family: 'Helvetica Neue';">For those customers wishing a car instead we have a number of cars in our fleet, all you need to do is ask by phone call, or specify in the extra details online.
									</p>
								</li>
								<li>
									<p class="lead text-center " style="font-family: 'Helvetica Neue'; ">5-0 Cab offers of additional added value: Personalized Out-of-Town service; In a rush to get somewhere because other arrangements fell through? The online booking system supports the following towns around North Bay:
										<p style="font-family: 'Helvetica Neue'; ">Callander, Sturgeon, Corbiel, Mattawa, Astorfield, Temiskaming, Bonfield, Nipissing, Powassan, Redbridge</p>
									</p>
								</li>
								<li>
									<p class="lead text-center " style="font-family: 'Helvetica Neue'; ">
										Car need a boost? We can help with that as well, often cheaper than calling a tow-truck. Let the dispatcher know!
									</p>
								</li>
								<li>
									<p class="lead text-center " style="font-family: 'Helvetica Neue'; ">
										If you just need us to grab you something from the store and deliver it to you, we can handle it for you.
									</p>
								</li>
								<li>
									<p class="lead text-center " style="font-family: 'Helvetica Neue'; ">
										5-0 Cab has been serving the North Bay and surrounding area for almost 40 years. We were founded in 1978 and to this day, still one of the most sought after taxis in the area.
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class = "col-0 col-md-1"></div>
			</div>
		</div>
	</div>
</div> <!-- End of Page Content Container -->

<!-- Proudly Sponsoring -->
<div class="container">
	<div class="row">
		<div class="col-0 col-md-1"></div>
		<div class="col-12 col-md-10">
			<div class="jumbotron border border-dark mb-4" >
				<h3 class="text-center display-4" style="font-family: 'Helvetica Neue'; ">Other Links</h3>
				<hr style="border-top: 2px solid black;">
				<div class="text-center">
					<i class="fab fa-facebook fa-6x" style="color: #007bff;"></i>
					<h2>Facebook</h2>
					<p>Check Us out on Facebook!</p>
					<a class="btn btn-primary" href="https://www.facebook.com/5-0-Cab-North-Bay-114070413579827" role="button">FaceBook Link »</a>
				</div>
				<hr>
				<div class="text-center">
					<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
					<h2>Company 2</h2>
					<p>This is what Company 2 Does<p><a class="btn btn-secondary" href="#" role="button">Link to Company 2 »</a></p>
				</div>
			</div>
		</div>
		<div class="col-- col-md-2"></div>
	</div>
</div>
<!-- Contact Nicky -->
<div class="container">
	<div class="row">
		<div class="col-0 col-md-1"></div>
		<div class="col-12 col-md-10">
			<div class="alert alert-secondary border-dark pb-0" role="alert" style="background: #e9ecef; font-family: 'Helvetica Neue'">
				<h5>For information about setting up a Corporate Account, giving feedback about the company or website, or concerns;</h5>
				<h5>Contact the Manager, Nicky Neal using the <b>Contact Us  </b> Button below </h5>
			</div>
			<div class="col-0 col-md-1"></div>
		</div>
	</div>
</div>

<!-- Last Mentions -->
<div class="container" id="finalContainer">
	<div class="row">
		<div class="col-0 col-md-1"></div>
		<div class="col-12 col-md-10">
			<p class="float-left"><a href="contactUs.jsp" class="btn btn-info border-dark">Contact Us</a></p>
			<p class="float-right"><a href="#" class="btn btn-secondary border-dark">Back to top</a></p>
		</div>
		<div class="col-0 col-md-1"></div>
	</div>
</div>
<div class="d-block d-sm-none pt-4 pb-5"></div>


<!-- Scripts -->
<!-- Jquery then...-->
<script src="js/jquery-3.5.1.js"></script>
<!-- Popper then... -->
<script src="js/popper.min.js"></script>
<!-- then ... Bootstrap... then everything else-->
<script src="js/bootstrap.min.js"></script>
<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/29c153f1be.js" crossorigin="anonymous"></script>
<!-- Adjust Navbar location on screen width -->
<script src="js/navbarAdjust.js"></script>
<!-- End of Body -->
</body>
</html>