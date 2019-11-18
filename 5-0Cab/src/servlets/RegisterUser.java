package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.userBean;

import helper.DBHelper;

public class RegisterUser extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public RegisterUser ()
	{
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String fName = req.getParameter("userfName");
		String lName = req.getParameter("userlName");
		String email = req.getParameter("userEmail");
		String password = req.getParameter("userPass");
		String confirmpassword = req.getParameter("confirmPass");
		String role = req.getParameter("userRole");
		

		// More on email error checking, Parse it and validify it!
		if(!email.contains("@"))
		{
			req.setAttribute("Error_Msg", "Email address isnt valid try again :)");
			req.getRequestDispatcher("/register.jsp").forward(req, res);
			return;
		}
		if(!(password.equals(confirmpassword)))
		{
			req.setAttribute("Error_Msg", "Passwords must match :)");
			req.getRequestDispatcher("/register.jsp").forward(req, res);
			return;
		}
		
		userBean user = new userBean();
		user.setuserfName(fName);
		user.setuserlName(lName);
		user.setuserEmail(email);
		user.setuserRole(role);
		user.setuserPass(password);
		
		DBHelper DB = new DBHelper();
		Boolean registered = DB.registerUser(user);
		
		if(registered.equals(true))   //On success, you can display a message to user on Home page
		 {
		 req.setAttribute("userName", fName + " " + lName);
		 req.getRequestDispatcher("/index.jsp").forward(req, res);
		 }
		 else   //On Failure, display a meaningful message to the User.
		 {
		 req.setAttribute("Error_Msg", "Registration Failed, Try Again");
		 req.getRequestDispatcher("/register.jsp").forward(req, res);
		 }
		
	}
}
