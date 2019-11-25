<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mapping</title>
<%@ include  file="/include/Header.jsp"%>
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
  <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
   integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
   crossorigin=""></script>
</head>
<body style="padding-top: 65px;">
<div class="container-fluid display-1 mt-2">
		<div class="row">
			<div class="col-2 d-none d-lg-block" style="height:790px"></div>
			<div class="col-8 width-100 align items center">
				<div id="mapid" style="width: 100%; height: 790px;"></div> <!--  Screen cutoffs height: 480, 640, 790 (800 creates scrollbar)  Width: 900-->
			</div>
			<div class="col-2 d-none d-lg-block"></div>
		</div>
</div>		
	


<script type="text/javascript" src="js/helloMap.js"></script> 
</body>
<footer>
<%@ include  file="/include/Footer.jsp"%>
</footer>
</html>