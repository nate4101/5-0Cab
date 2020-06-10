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
<link href="css/my_css.css" rel="stylesheet">
</head>

<body style="padding-top: 5px;">

<!-- All Things Navbar -->
<div class="container-sm">
<nav class="navbar navbar-dark bg-dark">
	<!-- Columns before the first image and text -->
	<div class="col-0 col-sm-2 col-md-2 col-lg-0 col-xl-0"></div>
	<!-- Columns the media (pic+text) occupies -->
	<div class="col-2 col-sm-2 col-md-2 col-lg-0 col-xl-0">
		<div class = "media">
			<img class="ml-0 pl-0 mt-1 mr-3" src="${pageContext.request.contextPath}/images/Logo.png" alt="cab" width="85" height="65">
			<div class="media-body mr-12">
			<h1 class ="title-text justify-content-center">Booking Application</h1>
			</div>
		</div>	
	</div>
	<!-- Columns before the Navigation Button -->
	<div class="col-10 col-sm-4 col-md-1 col-lg-0 col-xl-0"></div>
	<!-- Columns the navigation button takes up, 2 is good -->
	<div class ="col-8 col-sm-2 col-md-2 col-lg-0 col-xl-0">
		<button class="navbar-brand navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  		</button>
	</div>
	<!-- Columns after the Navigation Button -->
	<div class="col-0 col-sm-2 col-md-2 col-lg-0 col-xl-0"></div>
		<div class="collapse navbar-collapse" id="navbarCollapse">
   			<ul class="navbar-nav">
     			<li class="nav-item active">
      			<hr>
       			<a class="nav-link " href="#">How To Book a Cab ? </a>
        		<hr>
     			</li>
      			<li class="nav-item active">
       			<a class="nav-link" href="#">Contact Us!</a>
        		<hr>
      			</li>
      			<li class="nav-item">
        		<a class="nav-link" href="#">Admin Login</a>
      			</li>
    		</ul>
  		</div>
</nav>	
</div>

<br>
<!-- Request JumboTron and Button-->
<div class="container text-center">
	<div class = "row">
	<div class = "col-1"></div>
	<div class="col-10">
	<!--  style="background:transparent !important" -->
	<!-- <div class="jumbotron" style="background: url(img path) no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;">  -->
		<div class="jumbotron mb-4" > 
		
		<h1 class="text-center display-4">Book a Cab Online!</h1>
  		<p class="lead text-center">Press The Big Green Button to get Started!</p>
  		<hr style="border-top: 5px dashed black;">
  		<a href="${pageContext.request.contextPath}/upload.jsp">
 		<button type="button" class="btn btn-success btn-circle btn-xl"><h5 style="color: black;">Request</h5><h5 style="color: black;">A Cab</h5> </button>
 		</a>
 		<hr style="border-top: 5px dashed black;">
 		<p class="lead text-center">Or use the Drop-down Button on the Toolbar for Help.</p>
 	</div> 
 	
	</div>
	<div class = "col-1"></div>
	</div>
	
</div>

<!-- Request JumboTron and Button-->
<div class="container text-center">
	<div class = "row">
	<div class = "col-1"></div>
	<div class="col-10">
	<!--  style="background:transparent !important" -->
	<!-- <div class="jumbotron" style="background: url(img path) no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;">  -->
		<div class="jumbotron mb-4" > 
		
		<h1 class="text-center display-4">Book a Cab Online!</h1>
  		<p class="lead text-center">Press The Big Green Button to get Started!</p>
  		<hr style="border-top: 5px dashed black;">
  		<a href="${pageContext.request.contextPath}/upload.jsp">
 		<button type="button" class="btn btn-success btn-circle btn-xl"><h5 style="color: black;">Request</h5><h5 style="color: black;">A Cab</h5> </button>
 		</a>
 		<hr style="border-top: 5px dashed black;">
 		<p class="lead text-center">Or use the Drop-down Button on the Toolbar for Help.</p>
 	</div> 
 	
	</div>
	<div class = "col-1"></div>
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
				<a class="row justify-content-center texdec" href="">
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