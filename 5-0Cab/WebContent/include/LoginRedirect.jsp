<% 
// Check if session attribute Role is admin, if not redirect to main page
if(request.getSession(false).getAttribute("Role") == null){
	request.setAttribute("Error_Msg", "You must log in first");
		 request.getRequestDispatcher("/login.jsp").forward(request, response);
} %>