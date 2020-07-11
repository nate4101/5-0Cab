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
<!-- FontAwesome Icons Free kit -->
<script src="https://kit.fontawesome.com/29c153f1be.js" crossorigin="anonymous"></script>
</head>

<body style="background-image: url(${pageContext.request.contextPath}/images/green.jpg);">

<!-- All Things Navbar -->
<nav class="navbar navbar-dark bg-dark">
	<!-- Columns before the first image and text -->
	<div class="col-0 col-sm-2 col-md-2 col-lg-3 col-xl-4"></div>
	<!-- Columns the media (pic+text) occupies -->
	<div class="col-2">
		<div class = "media">
			<img class="ml-0 pl-0 mt-1 mr-3" src="${pageContext.request.contextPath}/images/Logo.png" alt="cab" width="85" height="65">
			<div class="media-body mr-12">
				<h1 class ="title-text justify-content-center" style="-webkit-text-stroke: 2px black; font-size: 40px;">Booking Application</h1>
			</div>
		</div>	
	</div>
	<!-- Columns before the Navigation Button -->
	<div class="col-10 col-sm-4 col-md-2 col-lg-1"></div>
	<!-- Columns the navigation button takes up, 2 is good -->
	<div class ="col-12 col-sm-2 col-md-3 col-lg-5 ">
		<button class="navbar-brand navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
  		
	</div>
	<!-- Columns after the Navigation Button -->
	<div class="col-0 col-sm-2 col-md-2 col-lg-0 "></div>
	<div class="collapse navbar-collapse" id="navbarCollapse">
   		<ul class="navbar-nav">
   			<li class="nav-item active">
   				<hr>
   				<a class="nav-link " href="#">How To Book a Cab? </a>
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
<br>
<!--  Page Contents Container -->
<div class="container text-center">
	<!-- Request JumboTron and Button-->
	<div class = "row">
		<div class = "col-0 col-sm-1"></div>
		<div class="col-12 col-sm-10">
			<div class="jumbotron" > 
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
		<div class = "col-0 col-sm-1"></div>
	</div>
	<br>
	<!-- Covid-19 Response, future general purpose media? -->
	<div class="row">
		<div class = "col-0 col-md-1"></div>
		<div class="col-12 col-md-10">
			<div class="jumbotron">
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
			<div class="jumbotron mb-4" > 
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
	<div class = "col-0 col-sm-0"></div>
	</div>
	<div class="row">
		<div class = "col-0 col-md-1"></div>
		<div class="col-12 col-md-10">
			<div class="jumbotron">
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
		<div class="col-0 col-sm-1"></div>
		<div class="col-12 col-sm-10">
			<div class="jumbotron mb-4" > 
			<h4 class="text-center display-4">Other Links</h4>
  			<hr style="border-top: 2px solid black;">
  				<div class="text-center">
  					<i class="fab fa-facebook fa-6x" style="color: #007bff;"></i>
  					<h2>Facebook</h2>
        			<p>Check Us out on Facebook!<p>
        			<a class="btn btn-primary" href="https://www.facebook.com/5-0-Cab-North-Bay-114070413579827" role="button">FaceBook Link »</a></p>
  				</div>
  				<hr>
  				<div class="text-center">
  					<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
        			<h2>Company 2</h2>
        			<p>This is what Company 2 Does<p><a class="btn btn-secondary" href="#" role="button">Link to Company 2 »</a></p>
  				</div>
 			</div> 
      	</div>
      <div class="col-- col-sm-2"></div>
    </div>
</div>
<!-- Contact Nicky -->
<div class="container">
	<div class="row">
		<div class="col-0 col-sm-1"></div>
		<div class="col-12 col-sm-10">
			<div class="alert alert-dark" role="alert">
 				For information about setting up a Corporate Account or Concerns; contact Manager : Nicky Neal <a href="#" class="alert-link"> Contact Us</a>
			</div>
			<div class="col-0 col-sm-1"></div>
		</div>
	</div>
</div>

<!-- Last Mentions -->
<div class="container">
	<p class="float-right"><a href="#" class="btn btn-dark">Back to top</a></p>
</div>

<!-- Scripts -->
<!-- Jquery then...-->
<script src="js/jquery-3.5.1.js"></script> 
<!-- Popper then... -->
<script src="js/popper.min.js"></script> 
<!-- Bootstrap... -->
<script src="js/bootstrap-4.0.0.js"></script>

<!-- End of Body -->
</body>
<!-- Code, check if an active request is happening and provide a direct link -->


</html>