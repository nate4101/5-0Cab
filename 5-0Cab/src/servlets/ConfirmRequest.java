package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.updateRequestBean;
import helper.DBHelper;

public class ConfirmRequest extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public ConfirmRequest() {}
	
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
		// Get paramaters
		String idString = req.getParameter("UUID");
		String cabnum = req.getParameter("cab_num");
		//Create Bean
		updateRequestBean upd = new updateRequestBean();
		upd.setcabnum(cabnum);
		upd.setID(idString);
		// Initialize DB
		DBHelper DB = new DBHelper();
		boolean result = DB.updateRequest(upd);
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
