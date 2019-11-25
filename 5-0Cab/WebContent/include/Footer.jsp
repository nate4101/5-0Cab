<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<meta charset="ISO-8859-1">

<!-- 
TO-DO------FIX this for future use of custom CSS and Bootstrap...

<link href="${ pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="${ pageContext.request.contextPath }/jquery/jquery.min.js"></script>
<script src="${ pageContext.request.contextPath }/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
-->
<link href="css/bootstrap-4.0.0.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/39c11639e3.js"></script>

<div class="container">
	
	<nav class="navbar navbar-expand-lg navbar-custom">
	<div class="container-fluid">
    			<a class="navbar-brand navbar-custom" href="${pageContext.request.contextPath}/AboutUs.jsp">
  					<h3 class="active">| About Us |</h1>
  				</a>
  		<a class="navbar-brand navbar-custom" href="${pageContext.request.contextPath}/contactus.jsp">
  					<h3 class="active">| Contact Us |</h1>
  				</a>
  				<a class="navbar-brand navbar-custom" href="${pageContext.request.contextPath}/login.jsp">
  					<h3 class="active">| Terms and Conditions |</h1>
  				</a>
  				<a class="navbar-brand navbar-custom" href="${pageContext.request.contextPath}/login.jsp">
  					<h3 class="active">| Privacy Policy |</h1>
  				</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="sr-only"></span>
    		<span class="navbar-toggler-icon"></span>
  		</button>
  	</div>
	</nav>
</div>
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
    <script src="js/jquery-3.2.1.min.js"></script> 
    <!-- Include all compiled plugins (below), or include individual files as needed --> 
    <script src="js/popper.min.js"></script> 
    <script src="js/bootstrap-4.0.0.js"></script>
</html>