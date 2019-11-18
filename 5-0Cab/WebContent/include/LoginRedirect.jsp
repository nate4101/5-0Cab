<% if(request.getSession(false).getAttribute("Name") == null){
	request.setAttribute("Error_Msg", "You must log in first");
		 request.getRequestDispatcher("/login.jsp").forward(request, response);
} %>