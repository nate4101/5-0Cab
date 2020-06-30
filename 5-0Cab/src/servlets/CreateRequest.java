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

import beans.LogBean;
import beans.RequestBean;
import beans.LogBean.logtype;
import helper.DBHelper;

public class CreateRequest extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public CreateRequest ()
	{
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter printWriter = res.getWriter();
		
		printWriter.println("You Shouldn't be here... but hello!");
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
		rb.setDisplay_time(dateFormat[0]+" "+dateFormat[1]);
		rb.setSize(Integer.parseInt(size));
		rb.setDetails(instructions);
		System.out.println("Request:");
		System.out.println(id+"|"+loc+"|"+size+"|"+coordinates[0]+"|"+coordinates[1]+"|"+time.toString()+"|"+instructions+"|");
		// Remote address : https://stackoverflow.com/questions/11683246/get-ip-address-of-client-in-jsp
		String ip = req.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = req.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = req.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = req.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = req.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = req.getRemoteAddr();  
        }
		// Database connection
		DBHelper db = new DBHelper(ip);
		try {
			boolean result = db.create_req(rb);
			if(!result)
			{
				req.setAttribute("error", "upload_fail");
				req.getRequestDispatcher("/uploadRequest.jsp").forward(req, res);
				return;
			}
			else {
				db.create_log(new LogBean("New Request to: "+loc, ip, logtype.EndUser));
				req.setAttribute("cookie", id);
				req.setAttribute("success", "Successful Request made");
				req.getRequestDispatcher("/uploadRequest.jsp").forward(req, res);
				return;
			}
		} catch (Exception e) {
			req.setAttribute("error", "database connection error refresh and try again");
			req.getRequestDispatcher("/index.jsp").forward(req, res);
		} finally {
			db.closeConnection();
		}
	}
}
