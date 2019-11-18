package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EndSession extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public EndSession() {}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		
		try
		{
			HttpSession session = req.getSession(false);
			
			if(session!=null)
			{
				session.invalidate();
				req.setAttribute("Success_Msg", "Logout Was Succesful" );
				req.getRequestDispatcher("/index.jsp").forward(req, res);
				System.out.println("logged out" + " User name/ ID/ Something");
			}
			else
			{
				req.setAttribute("Error_Msg", "Try Logging In First" );
				req.getRequestDispatcher("/index.jsp").forward(req, res);
				System.out.println("logged out" + " User name/ ID/ Something");
			}
		}
		catch(Exception e){ e.printStackTrace(); }
	}

}
