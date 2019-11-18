package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.userBean;
import helper.DBHelper;

public class LoginUser extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public LoginUser() {};
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		DBHelper db = new DBHelper();
		try
		{
			userBean user = db.checkLoginCredentials(email, password);
		
			if(user == null)
			{
				req.setAttribute("Error_Msg", "Invalid Email or Password");
				req.getRequestDispatcher("/login.jsp").forward(req, res);
			}
			else
			{
				String FullName = user.getuserfName() +" "+ user.getuserlName();
				HttpSession session = req.getSession();
				session.setAttribute("Name", FullName);
				session.setAttribute("Role", user.getuserRole());
				req.setAttribute("Name", FullName);
				req.setAttribute("Role", user.getuserRole());
				req.setAttribute("Success_Msg", "Login Was Succesful");
				req.getRequestDispatcher("/index.jsp").forward(req, res);
			}
		}
		catch(Exception e) { e.printStackTrace();};
	}
}
