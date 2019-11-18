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
                <div class="card g-light text-dark">
                    <div class="card-header text-center">
                    	<a class="card-link" data-toggle="collapse" href="#Login" style="color:black">
                        	<h1>Login</h1>
                        </a>
                    </div>
                    <div id="Login" class="collapse show">
    					<div class="card-body">
                
                        <form action="LoginUser" method="post">
                            <div class="form-group">
                            	<label for="email">Email:</label>
                            	<input type="email" class="form-control" name="email" placeholder="Enter email" maxlength="100" required>
                            </div>
                            <div class="form-group">
                            	<label for="password">Password:</label>
                            	<input type="password" class="form-control" name="password" placeholder="Enter password" maxlength="64" required>
                            </div>
                            <br/>
                            <div class="text-center">
                                <input type="submit" class="btn btn-outline-primary" value="Login"> 
                                <a href="${pageContext.request.contextPath}/register.jsp" >Register</a>
                                <br/>
                                <small><a class="btn btn-link" href="${ pageContext.request.contextPath }/forgotPassword.jsp" role="button">Forgot Password?</a></small>
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