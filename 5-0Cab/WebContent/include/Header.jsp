<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<meta charset="ISO-8859-1">

<!-- 
TO-DO------FIX this for future use of custom CSS and Bootstrap...

<link href="${ pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="${ pageContext.request.contextPath }/jquery/jquery.min.js"></script>
<script src="${ pageContext.request.contextPath }/bootstrap/js/bootstrap.bundle.min.js"></script>
-->
<%
    /* @Source: Amazon AWS Documentation
     * AWS Elastic Beanstalk checks your application's health by periodically
     * sending an HTTP HEAD request to a resource in your application. By
     * default, this is the root or default resource in your application,
     * but can be configured for each environment.
     *
     * Here, we report success as long as the app server is up, but skip
     * generating the whole page since this is a HEAD request only. You
     * can employ more sophisticated health checks in your application.
     */
    if (request.getMethod().equals("HEAD")) return;
%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/39c11639e3.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<div class="container">
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container-fluid">
  		<a href="${pageContext.request.contextPath}/index.jsp"><h1 class="navbar-brand"  class="active">Your All in One Scheduling Service</h1></a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="sr-only"></span>
    		<span class="navbar-toggler-icon"></span>
  		</button>
  		
  		<div class="collapse navbar-collapse" id="navbar">
   			<ul class="nav navbar-nav ml-auto">
   			<li class="navbar-brand"> Message List:  </li>
   				<li class="list-group-item list-group-item-success"><%= request.getAttribute("Success_Msg")==null?"":request.getAttribute("Success_Msg") %></li>
  				<li class="list-group-item list-group-item-danger"><%= request.getAttribute("Error_Msg")==null?"":request.getAttribute("Error_Msg") %></li>
    		</ul>
    <% if(request.getSession(false).getAttribute("Name") == null) { %>
    	<ul class="nav navbar-nav ml-auto">
    		<li class="navbar-brand"><a href="${pageContext.request.contextPath}/login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
  			<li class="navbar-brand"><a href="${pageContext.request.contextPath}/register.jsp"><i class="fas fa-user-plus"></i> Sign up</a></li>
  		</ul>
<% } %>
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
</html>