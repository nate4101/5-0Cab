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
                    <div class="card-header bg-success text-center">
                    	<a class="card-link" data-toggle="collapse" style="color:black">
                        	<h1>Request A Cab</h1>
                        </a>
                    </div>
                    <div id="Upload">
                    
    					<div class="card-body border-dark border-rounded">
                        <form action="UploadRequest" method="post">
                            <div class="form-group">
                            	<label for="location">Location:</label>
                            	<input type="text" class="form-control" name="Location" maxlength="127" required>
                            </div>
    						<div class="form-group">
  								<label for="number_passengers">Number of Passengers:</label>
  								  <input type="number" class="form-control" name="passengers" min="1" step="1" id="num-input" required>    
						    </div>
						    <button type="button" id="opt" class="btn btn-light"
  								href="#"  data-toggle="popover" data-trigger="hover" 
  								title="Optional:"
  								data-content="Comfirm your information when we arrive!">
  								<h3>Optional Info:</h3>
							</button>
							<div class="form-group">
                            	<label for="special_instructions">Special Instruction (Opt):</label>
                            	<textarea class="form-control" name="reqDescr" rows= "4" maxlength="127"></textarea>
                            <small id="inline" class="text-muted">
      							Maximum of 127 Characters.
    						</small>
    						</div>
						    <div class="form-group">
						    	  <label for="name">Name (Opt):</label>
  								  <input type="text" class="form-control" name="name" maxlength="127">
						    </div>
						    <div class="form-group">
  								<label for="telephone">Phone Number (Opt):</label>
  								  <input type="tel" class="form-control" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
  								  <small>Format: 123-456-7890</small>
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
<script>
$(document).ready(function(){
  $('[data-toggle="popover"]').popover();   
});
</script>    
</body>
<footer>
<%@ include  file="/include/Footer.jsp"%>
</footer>
</html>