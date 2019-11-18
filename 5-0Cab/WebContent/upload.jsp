<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Upload Problem</title>

<%@ include  file="/include/Header.jsp"%>
<%@ include file="/include/LoginRedirect.jsp" %>

</head>
<body>
	<div class="page-header">
		<div class="jumbotron jumbotron-fluid"></div>
	</div>

<!-- Page Content -->
    <div class="container">
        <div class="row justify-content-center">		
            <div class="col-lg-8">
                <div class="card g-light text-dark">
                    <div class="card-header text-center">
                    	<a class="card-link" data-toggle="collapse" href="#Upload" style="color:black">
                        	<h1>Upload A Scheduling Problem</h1>
                        </a>
                    </div>
                    <div id="Upload" class="collapse show">
    					<div class="card-body">
                
                        <form action="UploadSchedule" method="get">
                            <div class="form-group">
                            	<label for="email">Schedule Name:</label>
                            	<input type="text" class="form-control" name="ScheduleName" maxlength="255" required>
                            </div>
                            <div class="form-group">
                            	<label for="Text Decription">Schedule Description:</label>
                            	<textarea class="form-control" name="ScheduleDescription" rows= "4" maxlength="255" style="resize: none;"> </textarea>
                            <small id="passwordHelpInline" class="text-muted">
      							Maximum of 255 Characters.
    						</small>
                            </div>
                            <div class="custom-file">
    							<input type="file" class="custom-file-input" id="validatedCustomFile" required>
   					 				<label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
    							<div class="invalid-feedback">Example invalid custom file feedback</div>
                           	</div>
                            <br/><br/>
                            <div class="text-center">
                            <button class="btn btn-outline-light btn-secondary" type="submit" role="button">
									Upload Schedule
								</button>
                            </div>
                                <!-- 
                                <input type="hidden" name="auth" value="login"> 
                                -> Something Dillon did for the controller class, might be useful concept later
                                -->            
                        </form>			
                    	</div><!-- card body -->
                    </div>
                </div><!-- main card -->
            </div><!-- login form -->
        </div><!-- row -->
    </div><!-- container -->
</body>
</html>