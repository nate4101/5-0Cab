package servlets;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.requestBean;

import helper.DBHelper;

public class UploadRequest extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public UploadRequest ()
	{
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter printWriter = res.getWriter();
		String hiddenString = req.getParameter("cab_num");
		printWriter.println(hiddenString);
		//req.getRequestDispatcher("/index.jsp").forward(req, res);
		return;
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		// Grab form fields
		String location = req.getParameter("Location");
		String passengers = req.getParameter("passengers");
		String description = req.getParameter("reqDescr");
		String name = req.getParameter("name");
		String phoneString = req.getParameter("phone");
		// Error check
		if(description=="")
			description="N/A";
		if(name=="")
			name="N/A";
		if(phoneString.isBlank())
			phoneString="N/A";
		if(!location.contains("North Bay"))
			req.setAttribute("error", "not_local");
		// request bean
		requestBean cabrequestBean = new requestBean();
		cabrequestBean.setdescription(description);
		cabrequestBean.setlocation(location);
		cabrequestBean.setname(name);
		cabrequestBean.setpassengers(passengers);
		cabrequestBean.setphone(phoneString);
		// Database connection
		DBHelper db = new DBHelper();
		boolean result = db.uploadRequest(cabrequestBean);
		if(!result)
		{
			req.setAttribute("error", "upload_fail");
			req.getRequestDispatcher("/index.jsp").forward(req, res);
			return;
		}
		else
		{
			req.getRequestDispatcher("/HelloMap.jsp").forward(req, res);
			return;
		}
	}
}
