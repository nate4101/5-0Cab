<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Upload Problem</title>
<%@ include  file="/include/Header.jsp"%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
</head>
<body>
  <div class="row"> <br/>
    <br/>
    <br/>
    <br/>
  </div>
<div class="container">
  <table class="table table-striped table-bordered">
  <thead class="thead-dark">
    <tr class="active">
      <th scope="col">Status</th>
      <th scope="col">Cab #</th>
      <th scope="col">Passengers</th>
      <th scope="col">Location</th>
      <th scope="col">Special Requests</th>
      <th scope="col">Time of Request</th>
    </tr>
  </thead>
<tbody id ="append">
<tr class="table-success">
  <td><form action="ConfirmRequest" method="post" id="form1">
      <input class="btn btn-success" form="form1" type="submit" value="Confirm" />
    </form></td>
  <td><select form="form1" name="cab_num" id = "myList">
      <option value = "1">Demo</option>
      <option value = "2">38 Van</option>
      <option value = "3">22 Car</option>
      <option value = "4">18 Car</option>
    </select></td>
  <td><input form="form1" id ="f1"type="text" name="pas_num" value="2" readonly/></td>
  <td><textarea form="form1" id ="f2" name="location" rows= "2" maxlength="127" readonly
        	placeholder="Northgate Mall"></textarea></td>
  <td><textarea form="form1" id ="f3" name="special_req" rows= "3" maxlength="127" readonly
        	placeholder="Pick me up from the back, lots of groceries"></textarea></td>
  <td><input form="form1" id ="f4" type="text" name="time" value="11:45:32" readonly/></td>
  <input form="form1" id ="f5"  type="hidden" name="UUID" value="f253f257-150f-11ea-9ab7-06c724a949c8" readonly/>
</tr>
</table>
</div>
<!-- Dispatcher JS including ajax and cab# form -->
<script type="text/javascript" src="js/dispatch.js"></script>
</body>
<footer>
  <%@ include  file="/include/Footer.jsp"%>
</footer>
</html>