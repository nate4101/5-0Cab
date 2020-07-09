<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Nathan Young, 2020">
	<title>Current Request</title>


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
<!-- Checking some messages -->
<% if(request.getAttribute("error")!=null) {
%>
<div class="alert alert-danger" role="alert">
  <% out.println(request.getAttribute("error")); %>
</div>
<%
}
%>
<% if(request.getAttribute("success")!=null) {
%>
<div class="alert alert-success" role="alert">
  <% out.println(request.getAttribute("lat"));
  	 out.println(request.getAttribute("lon"));%>
</div>
<%
}
%>
<!-- Card for Request Form -->

		
			<!-- Card -->
			<div class="conatiner container-fluid">
				<div id="myMap" style="position:relative;width:100%;height:400px; margin : auto;"></div>
		
			</div>
			
		
	
	
<!-- Globals... -->
	<script type="text/javascript">
		var lat = <%= request.getAttribute("lat") %>;
		var lon = <%= request.getAttribute("lon") %>;
		console.log("Coords, lat: "+lat+", lon: "+lon);
	</script>
<!-- Default datetime-local object for form... is there a better way to do this? -->
	<!-- Jquery then...-->
	<script src="js/jquery-3.5.1.js"></script> 
	<!-- Popper then... -->
	<script src="js/popper.min.js"></script> 
	<!-- Bootstrap... -->
	<script src="js/bootstrap-4.0.0.js"></script>
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
        var results;
        var url = 'https://'+path+'/apiv1/Get?credentials='+JSON.stringify(creds)+'&typeName=DeviceStatusInfo&search={"deviceSearch":{"id":"b1"}}';
        await fetch(url).then(response=>response.json()).then(json=>results=json);
        console.log(results.result[0].latitude);
    	var map = new Microsoft.Maps.Map('#myMap');
        var location1 = new Microsoft.Maps.Location(lat,lon);
        var location2 = new Microsoft.Maps.Location(results.result[0].latitude, results.result[0].longitude);
        var arr = [location1, location2];
        console.log(location1);
        console.log(location2);
        console.log(arr);
        var locRec = new Microsoft.Maps.LocationRect.fromLocations(location1,location2);
        map.setView({bounds: locRec});
        var pin1 = new Microsoft.Maps.Pushpin(location2,{text:'Cab'});
        var pin2 = new Microsoft.Maps.Pushpin(location1,{text:'Pickup'});
        map.entities.push(pin1);
        map.entities.push(pin2);
		//map.setView({"bounds":});
        //Add your post map load code here.
        
    }
    </script>
    <!-- a script that used web v8 sdk -->
	
</body>
</html>