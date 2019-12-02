<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Upload Problem</title>

<%@ include  file="/include/Header.jsp"%>

</head>
<body>
	<div class="row">
		<br/>
		<br/>
		<br/>
		<br/>
	</div>

<!-- Page Content -->
    <div class="container">
        <div class="row justify-content-center">		
            <div class="col-lg-8">
                <div class="card g-light text-dark">
                <span class="border border-dark rounded">
                    <div class="card-header bg-success text-center">
                    	<a class="card-link" data-toggle="collapse" style="color:black">
                        	<h1>Request A Cab</h1>
                        </a>
                    </div>
                    </span>
                    <div id="Upload" class="collapse show">
    					<div class="card-body">
                
                        <form action="UploadSchedule" method="post">
                            <div class="form-group">
                            	<label for="email">Location:</label>
                            	<input type="text" class="form-control" name="ScheduleName" maxlength="255" required>
                            </div>
                            <div class="form-group">
                            	<label for="Text Decription">Special Instruction:</label>
                            	<textarea class="form-control" name="ScheduleDescription" rows= "4" maxlength="255" style="resize: none;"> </textarea>
                            <small id="passwordHelpInline" class="text-muted">
      							Maximum of 255 Characters.
    						</small>
    						</div>
    						<div class="form-group">
  								<label for="example-number-input">Number of Passengers:</label>
  								<div>
  								  <input class="form-control" type="number" min="1" step="1" id="num-input">
 							    </div>
						    </div>
                           <div class="text-center">
                                <input type="submit" class="btn btn-outline-dark" value="Send Request"> 
                            </div>      
                        </form>		
 						</div>	
                    	</div><!-- card body -->
                    </div>
                </div><!-- main card -->
            </div><!-- login form -->
        </div><!-- row -->
    </div><!-- container -->
    
</body>
<footer>
<%@ include  file="/include/Footer.jsp"%>
</footer>
</html>