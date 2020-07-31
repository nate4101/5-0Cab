<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Dispatcher 5-0 Cab Page</title>
		<!-- Style Sheet for datatables and extensions -->
		<link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
 	</head>
<body>
	
			<table id="table_id" class="display">
    		<thead>
        		<tr>
            <th>Column 1</th>
            <th>Column 2</th>
        </tr>
    </thead>
    <tbody>
        
    </tbody>
    <tfoot>
    	<tr>
            <th>Column 1</th>
            <th>Column 2</th>
        </tr>
    </tfoot>
	</table>
<br>
<div id="click">
	Load Table
</div>	
	
<!-- Scripts -->
<!-- Jquery First -->
<script src="js/jquery-3.5.1.js"></script>
<!-- Then Datatables with extensions, but not editor-->
<script type="text/javascript" src="DataTables/datatables.min.js"></script>
<script>
$('#table_id').DataTable(
	    //Options
	    // ajax: '/RetreiveRequests'
	    );
	} );
</script>
</body>
</html>