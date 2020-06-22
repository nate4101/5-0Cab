package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.RequestBean;

import helper.DBHelper;

public class CreateRequest extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public CreateRequest ()
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
		String id = UUID.randomUUID().toString();
		String loc = req.getParameter("loc");
		String coordinates[] = req.getParameter("coordinates").split(",");
		String size = req.getParameter("size");
		String date = req.getParameter("date");
		String instructions = req.getParameter("instructions")==""?"N/A":req.getParameter("instructions");
		
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
		if(concatString.contains("drop")||concatString.contains("=")||concatString.contains("table")||concatString.contains(";"))
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
		RequestBean rb = new RequestBean();
		rb.setId(id);
		rb.setLocation(loc);
		rb.setLat(Double.parseDouble(coordinates[0]));
		rb.setLon(Double.parseDouble(coordinates[1]));
		rb.setSize(Integer.parseInt(size));
		rb.setReq_time(date);
		rb.setDetails(instructions);
		System.out.println("Request:");
		System.out.println(id+"|"+loc+"|"+size+"|"+coordinates[0]+"|"+coordinates[1]+"|"+date+"|"+instructions+"|");
		// Database connection
		DBHelper db = new DBHelper();
		try {
			boolean result = db.uploadNewRequest(rb);
			if(!result)
			{
				req.setAttribute("error", "upload_fail");
				req.getRequestDispatcher("/uploadRequest.jsp").forward(req, res);
				return;
			}
			else {
				req.setAttribute("cookie", id);
				req.getRequestDispatcher("/index.jsp").forward(req, res);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			db.closeConnection();
		}
	}
}
