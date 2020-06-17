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
		
		printWriter.println("test");
		//req.getRequestDispatcher("/index.jsp").forward(req, res);
		return;
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		// Grab form fields
		String loc = req.getParameter("loc");
		String coordinates[] = req.getParameter("coordinates").split(",");
		String size = req.getParameter("size");
		String date = req.getParameter("date");
		String instructions = req.getParameter("instructions")==null?"N/A":req.getParameter("instructions");
		
		// Error check
		if(!(loc.contains("North Bay")||loc.contains("Callander")||loc.contains("Sturgeon"))||coordinates==null||Integer.parseInt(size)<1) {
			System.out.println("No North bay");
			req.setAttribute("error", "Error in Upload: Please use Bing AutoSuggest to fill in Location");
			req.getRequestDispatcher("/upload.jsp").forward(req, res);
			return;
		}
		if(Integer.parseInt(size)>12) {
			System.out.println("Large Request Size");
			req.setAttribute("error", "Error in Upload: Request size of: "+Integer.parseInt(size)+" too large. Consider calling");
			req.getRequestDispatcher("/upload.jsp").forward(req, res);
			return;
		}
		String concatString=loc+coordinates[0]+coordinates[1]+size+date+instructions;
		System.out.println(concatString);
		concatString=concatString.toLowerCase();
		if(concatString.contains("drop")||concatString.contains("=")||concatString.contains("table"))
		{
			System.out.println("Possible SQL attack");
			req.setAttribute("error", "Error in Upload: Unexpected Keyword or Character found in request. Details logged");
			req.getRequestDispatcher("/upload.jsp").forward(req, res);
			return;
		}
		// MySQL Date Time Format
		date = date.split("T")[0]+" "+date.split("T")[1]+":00";
		System.out.println(date);
		// request bean
		requestBean rb = new requestBean();
		
		rb.setLoc(loc);
		rb.setLat(coordinates[0]);
		rb.setlon(coordinates[1]);
		rb.setsize(size);
		rb.setDate(date);
		rb.setDescription(instructions);
		
		// Database connection
		DBHelper db = new DBHelper();
		boolean result = db.uploadNewRequest(rb);
		if(!result)
		{
			req.setAttribute("error", "upload_fail");
			req.getRequestDispatcher("/upload.jsp").forward(req, res);
			return;
		}
		else {
			req.getRequestDispatcher("/index.jsp").forward(req, res);
			return;
		}
	}
}
