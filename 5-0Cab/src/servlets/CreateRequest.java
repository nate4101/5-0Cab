package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.LocalTime;
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
		String instructions = req.getParameter("instructions")==""?"N/A":req.getParameter("instructions");
		
		// Error check
		if(coordinates==null||Integer.parseInt(size)<1) {
			req.setAttribute("error", "Error in Upload: Please use Bing AutoSuggest to fill in Location");
			req.getRequestDispatcher("/upload.jsp").forward(req, res);
			return;
		}
		if(!(loc.contains("North Bay")||loc.contains("Callander")||loc.contains("Sturgeon")||
				loc.contains("Corbiel")||loc.contains("Mattawa")||loc.contains("Astorfield")||
				loc.contains("Temiskaming")||loc.contains("Bonfield")||loc.contains("Nipissing")||
				loc.contains("Powassan")||loc.contains("Redbridge")
				)) {
			System.out.println("Bad Location");
			req.setAttribute("error", "Error in Location:"+loc+". Try calling us to book for your location!");
			req.getRequestDispatcher("/upload.jsp").forward(req, res);
			return;
		}
		LocalDateTime time = LocalDateTime.now();
		String dateFormat[] = time.toString().split("T");
		// request bean
		RequestBean rb = new RequestBean();
		rb.setId(id);
		rb.setLocation(loc);
		rb.setLat(Double.parseDouble(coordinates[0]));
		rb.setLon(Double.parseDouble(coordinates[1]));
		rb.setReq_time(dateFormat[0]+" "+dateFormat[1]);
		rb.setSize(Integer.parseInt(size));
		rb.setDetails(instructions);
		System.out.println("Request:");
		System.out.println(id+"|"+loc+"|"+size+"|"+coordinates[0]+"|"+coordinates[1]+"|"+time.toString()+"|"+instructions+"|");
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
				req.getRequestDispatcher("/activeRequest.jsp").forward(req, res);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			db.closeConnection();
		}
	}
}
