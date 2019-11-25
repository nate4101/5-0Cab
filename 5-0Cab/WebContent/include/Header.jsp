<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 

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
	
	<nav class="navbar fixed-top navbar-expand-lg navbar-custom">
	<div class="container-fluid">
  		<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
  			<img src="${pageContext.request.contextPath}/images/Logo.png" alt="" height="45" width="100">
  		</a>
  		<a class="navbar-brand">
  			<h3 class="active">Serving North Bay Since 1978</h1>
  		</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="sr-only"></span>
    		<span class="navbar-toggler-icon"></span>
  		</button>
  		
  		<div class="collapse navbar-collapse" id="navbar">
    <% if(request.getSession(false).getAttribute("Name") == null) { %>
    	<ul class="nav navbar-nav ml-auto">
    		<li class="navbar-brand navbar-custom">
    			<a href="${pageContext.request.contextPath}/login.jsp">
  					<h1 class="navbar-brand"  class="active">Login / SignUp</h1>
  				</a>
  			</li>
  			<li class="navbar-brand navbar-custom">
    			<a href="${pageContext.request.contextPath}/help.jsp">
  					<h1 class="navbar-brand"  class="active">Help</h1>
  				</a>
  			</li>
    	</ul> <% } %>
<% if(request.getSession(false).getAttribute("Name") != null){%>

<ul class="nav navbar-nav ml-auto">
	<li class="list-group-item list-groupitem-secondary">
	Welcome: 
		<%= request.getSession(false).getAttribute("Name") %>
	</li>
	<li>
	<form class="nav navbar-nav ml-auto" action="EndSession" method="get">
		<button class="btn btn-outline-light btn-secondary" type="submit" role="button">
		<i class="fas fa-sign-out-alt"></i>
		Logout
		</button>
	</form>
	</li>
</ul>


	<% } %>
	
   		 </div>
  	</div>
	</nav>
</div>
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
    <script src="js/jquery-3.2.1.min.js"></script> 
    <!-- Include all compiled plugins (below), or include individual files as needed --> 
    <script src="js/popper.min.js"></script> 
    <script src="js/bootstrap-4.0.0.js"></script>
</html>