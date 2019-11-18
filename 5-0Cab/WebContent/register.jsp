<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>

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
                <div class="card bg-light text-dark">
                    <div class="card-header text-center">
                    	<a class="card-link" data-toggle="collapse" href="#Login" style="color:black">
                        	<h1>Register</h1>
                        </a>
                    </div>
                    <div id="Login" class="collapse show">
    					<div class="card-body">
                			<form class="form-horizontal" action="RegisterUser" method="post">
                            	<div class="form-group">
                            		<label for="email">Email:</label>
                            		<input type="email" class="form-control" name="userEmail" placeholder="Enter you're Email" maxlength="100" required>
                            	</div>  
                            	<div class="form-group">
                            		<label for="password">Password:</label>
                            		<input type="password" class="form-control" name="userPass" placeholder="Choose a Password" minlength="8" maxlength="64" required>
                            	</div>  
                            	<div class="form-group">
                            		<label for="confirmPass">Confirm-Pass:</label>
                            		<input type="password" class="form-control" name="confirmPass" placeholder="Re-enter Password" minlength="8" maxlength="64" required>
                            	</div>  
                            	<div class="form-group">
                            		<label for="userfName">First Name</label>
                            		<input type="text" class="form-control" name="userfName" placeholder="What's Your First Name" maxlength="100" required>
                            	</div>  
                            	<div class="form-group">
                            		<label for="userfName">Last Name</label>
                            		<input type="text" class="form-control" name="userlName" placeholder="What's Your Last Name" maxlength="100" required>
                            	</div>
                            	<div class="form-group">
    								<label for="exampleFormControlSelect2">Select you're Role (Confirmation may be needed)</label>
    								<select name="userRole" class="form-control" id="exampleFormControlSelect2">
										<option>Admin</option>
										<option>Professor</option>			
										<option>Student</option>
										<option>Other</option>
    								</select>
  								</div>
								<div class="text-center">
								<button class="btn btn-outline-light btn-secondary" type="submit" role="button">
                                	Register
                                	</button>
                            	</div>
							</form>
                    	</div><!-- card body -->
                    </div>
                </div><!-- main card -->
            </div><!-- login form -->
        </div><!-- row -->
    </div><!-- container -->
</body>
</html>