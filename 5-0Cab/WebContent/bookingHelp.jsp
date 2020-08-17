<%@ page import="helper.EnviromentVariables" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Nathan Young, 2020">
    <title>Send us an email</title>


    <!--  For Bootstrap Styling  -->
    <link href="css/bootstrap-4.0.0.css" rel="stylesheet">
    <link href="css/my_css.css" rel="stylesheet">
    <!-- FontAwesome Icons Free kit -->
    <script src="https://kit.fontawesome.com/29c153f1be.js" crossorigin="anonymous"></script>
    <!-- Recaptcha -->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<!-- Page Contents -->
<body style="background-image: url(${pageContext.request.contextPath}/images/Tortoise-Shell.svg);">

<!-- Some Extra padding at the start based on viewport-->
<div class="d-none d-sm-block pt-5 pb-4"></div>

<!-- All Things Navbar -->
<nav class="navbar border border-dark navbar-expand-sm  fixed-bottom navbar-light bg-light" id="navbarContainer">
    <div class="navbar-brand border border-secondary">
        <img class="ml-0 pl-0 mt-1 mr-3" src="${pageContext.request.contextPath}/images/Logo.png" alt="cab" width="90" height="45">
    </div>

    <span class="d-block d-sm-none h5 align-content-end"></span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">

        <ul class="navbar-nav">
            <!-- Modify Based on Logged in User
                - End User: Home, Help, Admin Login, |Highlighted|Active Request|Highlighted|
            -->
            <% 	// Admin
                if(request.getSession(false).getAttribute("role")=="admin"){%>
            <li class="nav-item m-1">
                <a class="btn btn-lg btn-outline-dark nav-link" href="index.jsp">
                    Home
                    <i class="fa fa-home" aria-hidden="true"></i></a></a>
            </li>
            <li class="nav-item m-1">
                <a href="adminUpdateCabs.jsp" class="btn btn-lg btn-outline-dark nav-link" type="button">
                    Update Cabs
                    <i class="fas fa-tools"></i>
                </a>
            </li>
            <li class="nav-item m-1 d-sm-none d-md-block">
                <a href="adminLogs.jsp" class="btn btn-lg btn-outline-dark nav-link mt-0" type="button">
                    Logs
                    <i class="fa fa-file-text" aria-hidden="true"></i>
                </a>
            </li>
            <li class="nav-item m-1 d-sm-none d-md-block">
                <a href="${pageContext.request.contextPath}/Logout" class="btn btn-lg btn-outline-dark nav-link mb-0" type="button">
                    Logout
                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                </a>
            </li>
            <%}%>
            <% // Dispatcher
                if(request.getSession(false).getAttribute("role")=="dispatcher") { %>
            <li class="nav-item m-1">
                <a class="btn btn-lg btn-outline-dark nav-link " disabled href="index.jsp">
                    Home
                    <i class="fa fa-home" aria-hidden="true"></i></a></a>
                </a>
            </li>
            <li class="nav-item m-1">
                <a href="dispatcher.jsp" class="btn btn-lg btn-outline-dark nav-link" type="button">
                    Dispatch Page
                    <i class="fas fa-table"></i>
                </a>
            </li>
            <li class="nav-item m-1 d-sm-none d-md-block">
                <a href="dispatcherMap.jsp" class="btn btn-lg btn-outline-dark nav-link mt-0" type="button">
                    Vehicle Map
                    <i class="fa fa-map" aria-hidden="true"></i>
                </a>
            </li>
            <li class="nav-item m-1 d-sm-none d-md-block">
                <a href="${pageContext.request.contextPath}/Logout" class="btn btn-lg btn-outline-dark nav-link mb-0" type="button">
                    Logout
                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                </a>
            </li>
            <%}%>
            <%	// End User
                if(request.getSession(false).getAttribute("role")==null) { %>
            <li class="nav-item m-1">
                <a class="btn btn-lg btn-outline-dark nav-link "  href="index.jsp">
                    Home
                    <i class="fa fa-home" aria-hidden="true"></i></a>
            </li>

            <li class="nav-item m-1">
                <a href="uploadRequest.jsp" class="btn btn-lg btn-outline-dark nav-link" type="button">
                    Book a Cab
                    <i class="fa fa-taxi" aria-hidden="true"></i>
                </a>
            </li>

            <li class="d-sm-none d-md-block">
                <a href="contactUs.jsp" class="btn btn-lg btn-outline-dark nav-link m-1" type="button">
                    Contact Us
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                </a>
            </li>
            <li class="d-sm-none active d-md-block">
                <a href="bookingHelp.jsp" class="btn btn-lg btn-outline-dark nav-link m-1" type="button">
                    Help Booking
                    <i class="fa fa-question" aria-hidden="true"></i>
                </a>
            </li>
            <%}%>
            <li class="nav-item pr-2 my-2 my-sm-0 btn-group d-none d-sm-block d-md-none">
                <!-- Default dropup button -->
                <div class="btn-group dropdown " id="dropdownDiv">
                    <button type="button" class="btn btn-lg btn-outline-dark nav-link dropdown-toggle m-1" data-toggle="dropdown">
                        Other Links
                    </button>
                    <div class="dropdown-menu py-0">
                        <ul class="list-group border border-dark rounded">

                            <!-- Dropdown menu links -->
                            <% 	// Admin
                                if(request.getSession(false).getAttribute("role")=="admin"){%>
                            <a href="adminLogs.jsp" class="btn btn-lg btn-outline-dark nav-link mt-0" type="button">
                                Logs
                                <i class="fa fa-file-text" aria-hidden="true"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/Logout" class="btn btn-lg btn-outline-dark nav-link mb-0" type="button">
                                Logout
                                <i class="fa fa-sign-out" aria-hidden="true"></i>
                            </a>
                            <%}%>
                            <% // Dispatcher
                                if(request.getSession(false).getAttribute("role")=="dispatcher") { %>
                            <a href="dispatcherMap.jsp" class="btn btn-lg btn-outline-dark nav-link mt-0" type="button">
                                Vehicle Map
                                <i class="fa fa-map" aria-hidden="true"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/Logout" class="btn btn-lg btn-outline-dark nav-link mb-0" type="button">
                                Logout
                                <i class="fa fa-sign-out" aria-hidden="true"></i>
                            </a>
                            <%}%>
                            <%	// End User
                                if(request.getSession(false).getAttribute("role")==null) { %>
                            <a href="contactUs.jsp" class="btn btn-lg btn-outline-dark nav-link mt-0" type="button">
                                Contact Us
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </a>
                            <a href="helpBooking.jsp" class="btn btn-lg btn-outline-dark nav-link mt-1" type="button">
                                Help Booking
                                <i class="fa fa-question" aria-hidden="true"></i>
                            </a>
                            <%}%>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</nav>
<br>
<h1> Coming Soon </h1>
<div class="d-block d-sm-none pt-5 pb-5"></div>
<!-- Recaptcha Script -->
<!-- Submit Script -->
<script> </script>
<!-- Jquery then...-->
<script src="js/jquery-3.5.1.js"></script>
<!-- Popper then... -->
<script src="js/popper.min.js"></script>
<!-- Bootstrap... -->
<script src="js/bootstrap-4.0.0.js"></script>
<!-- Adjust Navbar location on screen width -->
<script src="js/navbarAdjust.js"></script>

</body>
</html>