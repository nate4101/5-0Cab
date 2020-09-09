<%@ page import="helper.HTTPHelper" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<% System.out.println(session.getAttribute("requestID"));
	if(request.getSession().getAttribute("requestID")!=null) {
		Cookie c = new Cookie("5_0CabRequestId",session.getAttribute("requestID").toString());
		c.setMaxAge(10*60);
		response.addCookie(c);
	}else
		response.sendRedirect(HTTPHelper.getBaseUrl(request)+"/uploadRequest.jsp");%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Nathan Young, 2020">
	<title>Current Request</title>
	<!--  For Bootstrap Styling  -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/my_css.css" rel="stylesheet">
	<link rel="icon" href="${pageContext.request.contextPath}/images/favicon-32x32.png">
	<!-- FontAwesome Icons Free kit -->
	<script src="https://kit.fontawesome.com/29c153f1be.js" crossorigin="anonymous"></script>
</head>
<!-- Page Contents -->
<body style="background-image: url(${pageContext.request.contextPath}/images/Tortoise-Shell.svg); font-family: 'Helvetica Neue';">

<!-- Some Extra padding at the start based on viewport-->
<div class="d-none d-sm-block pt-5 pb-4"></div>

<!-- All Things Navbar -->
<nav class="navbar border border-dark navbar-expand-sm  fixed-bottom navbar-light bg-light " id="navbarContainer" style="padding-right: 0">
	<div class="navbar-brand border border-secondary mr-0">
		<img class="ml-0 pl-0 mt-1 mr-3" src="${pageContext.request.contextPath}/images/Logo.png" alt="cab" width="90" height="45">
	</div>

	<span class="d-block d-sm-none h5 align-content-end"></span>
	<button class="navbar-toggler bg-light border-dark mr-4 py-2" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		Menu  <span class="navbar-toggler-icon ml-2"></span>
	</button>

	<div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
		<ul class="navbar-nav">
			<!-- Modify Based on Logged in User
                - End User: Home, Help, Admin Login, |Highlighted|Active Request|Highlighted|
            -->
			<% 	// Admin
				if(request.getSession(false).getAttribute("role")=="admin"){%>
			<li class="nav-item  m-1">
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
			<li class="nav-item  m-1">
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
			<% if(request.getSession(false).getAttribute("requestID")!=null){ %>
			<li class="nav-item active m-1">
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

<br>
<!-- End of NavBar -->
<!-- Checking some messages -->
<% if(session.getAttribute("error")!=null) {
%>
<div class="alert alert-danger" role="alert">
	<% out.println(session.getAttribute("error")); %>
</div>
<%}%>

<!-- Card for Request Form -->

<!-- Card -->
<div class="container container-fluid vw-100" style="height: 75vh">
	<div class="border border-dark w-100 h-100" id="myMap"></div>

</div>

<!-- Globals... -->
<script type="text/javascript">
	var lat = <%= session.getAttribute("lat") %>;
	var lon = <%= session.getAttribute("lon") %>;
	console.log("Coords, lat: "+lat+", lon: "+lon);
</script>

<!-- Jquery then...-->
<script src="js/jquery-3.5.1.js"></script>
<!-- Popper then... -->
<script src="js/popper.min.js"></script>
<!-- Bootstrap... -->
<script src="js/bootstrap.min.js"></script>
<!-- bing maps web v8 sdk -->
<script type='text/javascript' src='http://www.bing.com/api/maps/mapcontrol?callback=GetMap&key=Au8wJoDxUyZXZ-x6Er5X1JD2cgKRT9syoPDsFq8b6tLFrbH5y3EYUb_8rrItR2Eo' async defer></script>
<!-- Map Logic -- Abstact into .js -->
<script type='text/javascript'>
	async function GetMap()
	{
		var auth;
		var creds;
		var path;
		await fetch('https://my.geotab.com/apiv1/Authenticate?password=SF7VhwLfRvvXDv7&userName=nate4101@gmail.com&database=5_0Cab')
				.then(response=>response.json()).then(json=>auth=json);
		console.log(auth);
		path = auth.result.path;
		creds=auth.result.credentials;
		console.log(JSON.stringify(creds));
		console.log(path);
		var initialized=false;
		var results;
		var map = new Microsoft.Maps.Map('#myMap');
		setInterval(async function(){

					var url = 'https://'+path+'/apiv1/Get?credentials='+JSON.stringify(creds)+'&typeName=DeviceStatusInfo&search={"deviceSearch":{"id":"b1"}}';
					await fetch(url).then(response=>response.json()).then(json=>results=json);
					console.log(results.result[0].latitude);
					var location1 = new Microsoft.Maps.Location(lat,lon);
					var location2 = new Microsoft.Maps.Location(results.result[0].latitude, results.result[0].longitude);
					var arr = [location1, location2];
					console.log(location1);
					console.log(location2);
					console.log(arr);
					var locRec = new Microsoft.Maps.LocationRect.fromLocations(location1,location2);
					var pin1 = new Microsoft.Maps.Pushpin(location1,{text:'Pickup'});
					var pin2 = new Microsoft.Maps.Pushpin(location2,{text:'Cab'});
					if(!initialized)
					{
						console.log("Initializing");

						map.setView({bounds: locRec});
						map.entities.push(pin1);
						map.entities.push(pin2);
						initialized=true;
					}
					else{
						console.log("Refreshing Map");

						map.entities.pop();
						map.setView({bounds: locRec});
						map.entities.push(pin2);
					}
					var previous = pin1;


					//map.setView({"bounds":});
					//Add your post map load code here.) => {
				}
				, 10000);
	}
</script>
<!-- a script that used web v8 sdk -->
<!-- Adjust Navbar location on screen width -->
<script src="js/navbarAdjust.js"></script>
</body>
</html>