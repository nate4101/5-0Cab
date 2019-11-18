<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>

<%@ include  file="/include/Header.jsp"%>
</head>

<body>
	
	<div class="page-header">
		<div class="jumbotron jumbotron-fluid"></div>
	</div>
	<div class="container-fluid">
		<div class="jumbotron text-center">
			<h1> Home Page </h1>
		</div>
		
		<div class="row">
		
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<a href="${pageContext.request.contextPath}/upload.jsp" style="color:black">
				<div class="jumbotron text-center">
					<h1>Request a Schedule</h1>
				</div>
				</a>
			</div>
			
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<a href="${pageContext.request.contextPath}/searchProblem.jsp" style="color:black">
				<div class="jumbotron text-center">
					<h1>Solution Explorer</h1>
				</div>
				</a>
			</div>
			
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<a href="${pageContext.request.contextPath}/profiles.jsp" style="color:black">
					<div class="jumbotron text-center">
					<h1>Profiles</h1>
				</div>
				</a>
				
			</div>
			
			
		</div>
	</div>
</body>
</html>