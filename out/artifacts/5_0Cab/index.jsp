<%@ page import="helper.DBHelper" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%request.getSession(false).invalidate();
request.getSession().setAttribute("role",null);
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Nathan Young, 2020">

	<title>5-0 Cab Home</title>
	<!--  For Bootstrap Styling  -->
	<link href="css/bootstrap-4.0.0.css" rel="stylesheet">
	<link href="css/my_css.css" rel="stylesheet">
	<!-- FontAwesome Icons Free kit -->
	<link rel="icon" href="${pageContext.request.contextPath}/images/favicon-32x32.png">
</head>

<body style="background-image: url(${pageContext.request.contextPath}/images/Tortoise-Shell.svg);">

<!-- Some Extra padding at the start based on viewport-->
<div class="d-none d-sm-block pt-5 pb-4"></div>

<!-- All Things Navbar -->
<nav class="navbar border border-dark navbar-expand-sm  fixed-bottom navbar-light bg-light" id="navbarContainer">
	<div class="navbar-brand border border-secondary">
		<img class="ml-0 pl-0 mt-1 mr-3" src="${pageContext.request.contextPath}/images/Logo.png" alt="cab" width="90" height="45">
	</div>

	<span class="d-block d-sm-none h5 align-content-end"></span>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
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
							<a href="helpBooking.jsp" class="btn btn-lg btn-outline-dark nav-link mt-0" type="button">
								Help Booking
								<i class="fa fa-question" aria-hidden="true"></i>
							</a>
							<a href="contactUs.jsp" class="btn btn-lg btn-outline-dark nav-link mt-1" type="button">
								Contact Us
								<i class="fa fa-envelope" aria-hidden="true"></i>
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
				<ellipse stroke="#000" ry="106" rx="225.5" id="svg_17" cy="-13.5" cx="226" fill-opacity="null" stroke-opacity="null" fill="#fff"/>
				<text stroke="#000" transform="matrix(1,0,0,1.5631896317055685,0,-42.29317529048818) " font-style="italic" font-weight="bold" xml:space="preserve" text-anchor="start" font-family="Helvetica, Arial, sans-serif" font-size="26" id="svg_18" y="55.5" x="40.99219" fill-opacity="null" stroke-opacity="null" stroke-width="0" fill="#000000">Serving North Bay Since 1975</text>
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
					<h1 class="display-4"><b>Book a Cab Online!</b></h1>
  					<p class="lead text-center">Press The Big Green Button to get Started!</p>
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
				<h3 class="text-center display-6"><b>Our Covid-19 Commitment</b></h3>
  				<hr style="border-top: 2px solid black;">
  				<p class="lead text-center text-bold text-monospace">
 					We at 5-0 Cab are aware of the crisis that has come to bear amid the wake of COVID-19 and the strain it has put on everyone. 
 					In an effort to maintain the safety of the health of both our customers and our drivers, 
 					all of our vehicles have been supplied with hand sanitizer and disinfectant wipes to clean the vehicles throughout the day.
 				</p>
 				<p class="lead text-center text-monospace">
 					As stated by the government, and on social media, we ask that if you are feeling unwell, 
 					or are symptomatic that you get checked out as quickly as possible and follow the directions of your health care provider.
 				</p>
 				<p class="lead text-center text-monospace">
 					Until otherwise notified, we will continue to serve our city and our community with outstanding service 24 hours a day, 7 days a week.
 				</p>
			</div>
		</div>
		<div class = "col-0 col-md-1"></div>
	</div>
	<br>
	<!--  Carousel in Jumbotron -->
	<div class = "row">
	<div class="col-0 col-md-1"></div>
		<div class="col-12 col-md-10">
			<div class="jumbotron border border-dark mb-4" >
				<h3 class="text-center display-6"><b>About Us and Our Community</b></h3>
  				<hr style="border-top: 2px solid black;">
				<div class="bd-example">
  					<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
   						 <ol class="carousel-indicators">
      						<li data-target="#carouselExampleCaptions" data-slide-to="0" class=""></li>
      						<li data-target="#carouselExampleCaptions" data-slide-to="1" class=""></li>
      						<li data-target="#carouselExampleCaptions" data-slide-to="2" class="active"></li>
   					 	</ol>
    				<div class="carousel-inner">
      					<div class="carousel-item">
        					<img class="d-block w-100" data-src="holder.js/800x400?auto=yes&amp;bg=777&amp;fg=555&amp;text=First slide" alt="First slide [400x400]" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22800%22%20height%3D%22400%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20800%20400%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1729ec152ea%20text%20%7B%20fill%3A%23555%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A40pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1729ec152ea%22%3E%3Crect%20width%3D%22800%22%20height%3D%22400%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22285.9140625%22%20y%3D%22217.7%22%3EFirst%20slide%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
        					<div class="carousel-caption d-none d-sm-block">
          						<h5>First slide label</h5>
          						<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
        					</div>
      					</div>
      					<div class="carousel-item">
        					<img class="d-block w-100" data-src="holder.js/800x400?auto=yes&amp;bg=666&amp;fg=444&amp;text=Second slide" alt="Second slide [600x400]" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22800%22%20height%3D%22400%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20800%20400%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1729ec152eb%20text%20%7B%20fill%3A%23444%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A40pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1729ec152eb%22%3E%3Crect%20width%3D%22800%22%20height%3D%22400%22%20fill%3D%22%23666%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22247.3125%22%20y%3D%22217.7%22%3ESecond%20slide%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
        					<div class="carousel-caption d-none d-sm-block">
          						<h5>Second slide label</h5>
          						<p class="text-white">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        					</div>
      					</div>
      					<div class="carousel-item active">
        					<img class="d-block w-100" data-src="holder.js/800x400?auto=yes&amp;bg=555&amp;fg=333&amp;text=Third slide" alt="Third slide [800x400]" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22800%22%20height%3D%22400%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20800%20400%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1729ec152eb%20text%20%7B%20fill%3A%23333%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A40pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1729ec152eb%22%3E%3Crect%20width%3D%22800%22%20height%3D%22400%22%20fill%3D%22%23555%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22276.9921875%22%20y%3D%22217.7%22%3EThird%20slide%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
        					<div class="carousel-caption d-none d-sm-block">
          						<h5>Third slide label</h5>
          						<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
        					</div>
      					</div>
    				</div>
    				<a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
      					<span class="sr-only">Previous</span>
    				</a>
    				<a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      					<span class="carousel-control-next-icon" aria-hidden="true"></span>
      					<span class="sr-only">Next</span>
    				</a>
  				</div>
			</div>
 		</div> 
	</div>
	<!--  What we Provide JumboTron -->
	<div class = "col-0 col-md-0"></div>
	</div>
	<div class="row">
		<div class = "col-0 col-md-1"></div>
		<div class="col-12 col-md-10">
			<div class="jumbotron border border-dark mb-4">
				<h3 class="text-center display-6"><b>What We Provide</b></h3>
  				<hr style="border-top: 2px solid black;">
  				<div class="container text-center">
  					<div class="row content-justify-center">
  						<div class="col-12">
  							<div class="card" style="width: 18rem;">
  							<img src="#" class="card-img-top" alt="...">
  								<div class="card-body">
    								<h5 class="card-title">Card title</h5>
    								<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
   									 <a href="#" class="btn btn-primary">Go somewhere</a>
  								</div>
							</div>
  						<p class="lead text-center text-bold text-monospace">
 						5-0 Cab offers a number of vans at no additional charge. 
 						Bought a lot of groceries? We can help with that. 
 						Need to bring something big across town, we're here to help!.
 						</p>
 						<p class="lead text-center text-monospace">
 						As stated by the government, and on social media, we ask that if you are feeling unwell, 
 						or are symptomatic that you get checked out as quickly as possible and follow the directions of your health care provider.
 						</p>
 						<p class="lead text-center text-monospace">
 						Until otherwise notified, we will continue to serve our city and our community with outstanding service 24 hours a day, 7 days a week.
 						</p>
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
			<h4 class="text-center display-4">Other Links</h4>
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
			<div class="alert alert-secondary border-dark pb-0" role="alert" style="background: #e9ecef;">
				<p>For information about setting up a Corporate Account, giving feedback about the company or website, or concerns;</p>
				<p>Contact the Manager, Nicky Neal using the <b>Contact Us  </b> Button below </p>
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
<script src="https://kit.fontawesome.com/29c153f1be.js" crossorigin="anonymous"></script>
<!-- Jquery then...-->
<script src="js/jquery-3.5.1.js"></script> 
<!-- Popper then... -->
<script src="js/popper.min.js"></script> 
<!-- Bootstrap... -->
<script src="js/bootstrap-4.0.0.js"></script>

<script type="application/javascript">
	/* Modify Some content when the screen width changes */
	let nb = this.window.innerWidth<576;
	let flag = nb;
	window.onresize=updateElements;
	updateElements();
	function updateElements(){
		nb=this.window.innerWidth<576;
		if(flag){
			// Resize from sm to xs
			if(nb){
				flag=false;
				let nav = document.getElementById("navbarContainer");
				nav.className="navbar border  border-dark navbar-expand-sm  fixed-bottom navbar-light bg-light";
			}
			// no change needed
			else
				return
		}
		// flag==false
		else{
			if(!nb){
				// Resize from xs to sm
				flag=true;
				let nav = document.getElementById("navbarContainer");
				nav.className="navbar border  border-dark navbar-expand-sm  fixed-top navbar-light bg-light";
			}
			// No Change needed
			else{
				return
			}
		}
	}
</script>
<!-- End of Body -->
</body>
</html>