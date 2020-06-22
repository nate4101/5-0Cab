<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Dispatcher 5-0 Cab Page</title>
		<!-- Style Sheet for datatables and extensions -->
		<link rel="stylesheet" type="text/css" href="DataTables/datatables.css"/>
 	</head>
<body>
<div class = "container">
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>Location</th>
                <th>Size</th>
                <th>Details</th>
                <th>Date</th>
                <th>ID</th>
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
<!-- Then Datatables with extensions, but not editor-->
<script type="text/javascript" src="DataTables/datatables.js"></script>
<script>
$(document).ready(function() {
    $('#example').DataTable({
    	"ajax": '${pageContext.request.contextPath}/RetreiveRequests',
    	columns:[
    		{data:'location'},
    		{data:'size'},
    		{data:'details'},
    		{data:'req_time'},
    		{data:'id', visible:false}
    	]
    });
} );
</script>
</body>
</html>