<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Dispatcher 5-0 Cab Page</title>
		<!-- Style Sheet for datatables and extensions -->
		<link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		
		<link href="css/my_css.css" rel="stylesheet">
 	</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark">
	<!-- Columns before the first image and text -->
	<div class="col-0 col-sm-2 col-md-2 col-lg-3 col-xl-4"></div>
	<!-- Columns the media (pic+text) occupies -->
	<div class="col-2">
		<div class = "media">
			<img class="ml-0 pl-0 mt-1 mr-3" src="${pageContext.request.contextPath}/images/Logo.png" alt="cab" width="85" height="65">
			<div class="media-body mr-12">
				<h1 class ="title-text justify-content-center" style="-webkit-text-stroke: 2px black; font-size: 40px;">Booking Application</h1>
			</div>
		</div>	
	</div>
	<!-- Columns before the Navigation Button -->
	<div class="col-10 col-sm-4 col-md-2 col-lg-1"></div>
	<!-- Columns the navigation button takes up, 2 is good -->
	<div class ="col-12 col-sm-2 col-md-3 col-lg-5 ">
		<button class="navbar-brand navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
  		
	</div>
	<!-- Columns after the Navigation Button -->
	<div class="col-0 col-sm-2 col-md-2 col-lg-0 "></div>
	<div class="collapse navbar-collapse" id="navbarCollapse">
   		<ul class="navbar-nav">
   		<li class="nav-item active">
   				<hr>
   				<a class="nav-link " href="${pageContext.request.contextPath}/index.jsp">Home Page >></a>
       			<hr>
     		</li>
   			<li class="nav-item active">
   				<hr>
   				<a class="nav-link " href="#">How To Book a Cab? </a>
       			<hr>
     		</li>
      		<li class="nav-item active">
       			<a class="nav-link" href="#">Contact Us!</a>
        		<hr>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="#">Admin Login</a>
      		</li>
    	</ul>
  	</div>
</nav>
<br>
<hr>
<!-- All Things DataTables -->
<div class = "container">
<div class="row" id="buttonrow"></div>
	<table id="example" class="table table-border row-border table-striped" style="width:100%">
        <thead>
            <tr>
                <th>Location</th>
                <th>Size</th>
                <th>Details</th>
                <th>Date</th>
                <th>Status</th>
                <th>Cabs</th>
            </tr>
        </thead>
        <tbody>
            
        </tbody>
        <tfoot>
            
        </tfoot>
    </table>
<br>	
</div>
<!-- Scripts -->
<!-- Jquery First -->
<script src="js/jquery-3.5.1.js"></script>
<!-- Then popper -->
<script src="js/popper.min.js"></script> 
<!-- Bootstrap... -->
<script src="js/bootstrap-4.0.0.js"></script>
<!-- Then Datatables with extensions, but not editor-->
<script type="text/javascript" src="DataTables/datatables.min.js"></script>
<script>
$(document).ready(function() {

	var cabnums = {1:50,2: 48, 3: 20};
    var table = $('#example').DataTable( {
    	ajax: '${pageContext.request.contextPath}/RetrieveRequests?formatted=true',
    	dom: 'Bfrtip',
    	select: true,
    	columns:[
    	    {
    	    	data:'location'
    	    },
    	    {
    	    	data:'size'
    	    },
    	    {
    	    	data:'details'
    	    },
    	    {
    	    	data:'time',
    	    	render:{
    	    		_:'display',
    	    		sort:'sort'
    	    	}
    	    },
    	    {
    	    	data:'state',
    	    	render: function(data,type,row){
    	    		if(data==0)
    	    			return "New Request";
    	    		else
    	    			return "In Progress";
    	    	},
    	    	createdCell: function(cell, cellData,rowData,rowIndex,colIndex){
    	    		if(cellData==0)
    	    			$(cell).addClass('bg-success');
    	    		else
    	    			$(cell).addClass('bg-warning');
    	    	}
    	    },
    	    {
    	    	data:'cabs'
    	    }
    	],
    	order: [],
    	buttons: [
    		{
    			text: 'Submit',
    			action: function () {
    	        	var data = table.rows({selected: true}).data();
    	        	//var data = table.$('input, select').serialize();
    	        	//var data = table.rows().data();
    	        	
    	        	console.log(data[0]);
    			}
    		},
    		{
    			text: 'Decline',
    			action: function () {
    	        	var data = table.rows({selected: true}).data();
    	        	//var data = table.$('input, select').serialize();
    	        	//var data = table.rows().data();
    	        	alert("Declining: "+data[0].location)
    	        	console.log(data[0]);
    			}
    		}
    	]
    		
    });
} );
</script>
</body>
</html>