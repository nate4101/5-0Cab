<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login In</title>

<%@ include  file="/include/Header.jsp"%>

</head>

<body>
	<div class="page-header">
		<div class="jumbotron jumbotron-fluid"></div>
	</div>

<!-- Page Content -->
    <div class="container">
        <div class="row justify-content-center">		
            <div class="col-lg-6">
            	<div class="card text-center">
  					<div class="card-header">
   						 <ul class="nav nav-tabs card-header-tabs">
    						  <li class="nav-item">
     							   <a class="nav-link active" data-toggle="collapse" href="#Signup">Active</a>
     						  </li>
      						  <li class="nav-item">
        						   <a class="nav-link" href="#">Link</a>
      						  </li>
      						   <li class="nav-item">
        							<a class="nav-link disabled" href="#">Disabled</a>
      						   </li>
    					 </ul>
  					</div>
  					<div class="card bg-light text-dark" id="Signup" class="collapse show">
    					<h5 class="card-title">Special title treatment</h5>
    					<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
    					<a href="#" class="btn btn-primary">Go somewhere</a>
  					</div>
</div>
            </div><!-- login form -->
        </div><!-- row -->
    </div><!-- container -->
</body>
<footer>
	<%@ include  file="/include/Footer.jsp"%>
</footer>
</html>