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
	<link href="css/bootstrap-4.0.0.css" rel="stylesheet">
	<link href="css/my_css.css" rel="stylesheet">
	<!-- FontAwesome Icons Free kit -->
	<script src="https://kit.fontawesome.com/29c153f1be.js" crossorigin="anonymous"></script>
</head>
<!-- Page Contents -->
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
	<div class ="col-10 col-sm-2 col-md-3 col-lg-5 ">
		<button class="navbar-brand navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
	</div>
	<!-- Columns after the Navigation Button -->
	<div class="col-2 col-sm-2 col-md-2 col-lg-0 "></div>
	<div class="collapse navbar-collapse" id="navbarCollapse">
   		<ul class="navbar-nav">
   			<li class="nav-item active">
   				<hr>
   				<a class="nav-link " href="${pageContext.request.contextPath}/index.jsp">Home Page >></a>
       			<hr>
     		</li>
   			<li class="nav-item active">
   				<a class="nav-link " href="#">How To Book a Cab? >></a>
       			<hr>
     		</li>
      		<li class="nav-item active">
       			<a class="nav-link" href="#">Contact Us! >></a>
        		<hr>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="#">Admin Login >></a>
      		</li>
    	</ul>
  	</div>
</nav>
<br>
<!-- End of NavBar -->
<% if(request.getAttribute("error")!=null) {
%>
<div class="alert alert-danger" role="alert">
  <% out.println(request.getAttribute("error")); %>
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
        			<form action="UploadRequest" method="post" autocomplete="off">
        				<h3>Required:</h3>
        				<div class="form-group">
        					<label for="bing-suggestion">Enter Your Location:</label>
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
  								<input type="number" class="form-control" name="size" min="1" step="1" id="num-input" required>
  								 <small id="inline" class="text-muted">
      								1 or more
    							</small>   
						    </div>
						    <hr>
						    <h3>Optional:</h3>
						    <div class=form-group>
						    	<label for="date">Request Time:<b> Default: Now</b></label>
						    	<input type="datetime-local" class="form-control" value="" id="reqTime" name="date">
						    </div>
							<div class="form-group">
                            	<label for="instructions">Extra Details:<b> Default: Empty</b></label>
                            	<textarea class="form-control" name="instructions" rows= "4" maxlength="127"></textarea>
                            <small id="inline" class="text-muted">
      							Maximum of 127 Characters.
    						</small>
    						</div>
                           <div class="text-center">
                                <input type="submit" class="btn btn-outline-dark" value="Send Request"> 
                            </div>      
                        </form>
				</div>	
			</div>
		</div>
		
	</div>
</div>  	

<!-- Default datetime-local object for form... is there a better way to do this? -->
<script>
	(function(){
		var d=new Date();
		var date = d.getFullYear()+"-";
		if(d.getMonth()<10)
			date+="0";
		date+=d.getMonth()+"-";
		if(d.getDate()<10)
			date+="0";
		date+=d.getDate()+"T";
		if(d.getHours()<10)
			date+="0";
		date+=d.getHours()+":";
		if(d.getMinutes()<10)
			date+="0";
		date+=d.getMinutes();
		document.getElementById('reqTime').value= date;
    	console.log(document.getElementById('reqTime').value);
	})();
</script>
  
    <script type='text/javascript' src='https://www.bing.com/api/maps/mapcontrol?key=Au8wJoDxUyZXZ-x6Er5X1JD2cgKRT9syoPDsFq8b6tLFrbH5y3EYUb_8rrItR2Eo&callback=loadMapScenario' async defer></script> 
       
	<script src="${pageContext.request.contextPath}/js/BingAutoSuggest.js"></script>
	
	</body>
<!-- Footer -->
<%@ include  file="/include/Footer.jsp"%>
</html>