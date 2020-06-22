package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import beans.RequestBean;
import helper.DBHelper;

public class RetreiveRequests extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String stateString = request.getParameter("state");
		System.out.println(stateString);
		String completedString = request.getParameter("completed");
		System.out.println(completedString);
		String id = request.getParameter("id");
		// Error checking
		String concatString = id+stateString+completedString;
		concatString=concatString.toLowerCase();
		if(concatString.contains("drop")||concatString.contains("=")||concatString.contains("table")||concatString.contains(";"))
		{
			System.out.println("Possible SQL attack");
			request.setAttribute("error", "Error in retreive: Unexpected Keyword or Character found in request. Details logged");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		List<RequestBean> rbs = new ArrayList<RequestBean>();
		RequestBean rb = new RequestBean();
		JSONObject jo = new JSONObject();
		JSONArray ja = new JSONArray();
		DBHelper db = new DBHelper();
		if(id!=null) {
			try {
				rb=db.retreiveRequest(id);
				jo = new JSONObject(rb);
				response.setContentType("text/json");
			    response.setCharacterEncoding("UTF-8");
				response.getWriter().println(jo.toString());
				return;
			} catch (Exception e) {
				response.setContentType("text/json");
			    response.setCharacterEncoding("UTF-8");
			    response.getWriter().write("Database Error");
			    return;
			}
			finally {
				db.closeConnection();
			}
		}
		else 
		{
			// If both are null try and retreive all requests
			if(stateString==null && completedString==null)
			{
				try {
					rbs = db.retreiveAllRequests();
					for (RequestBean b : rbs) {
						jo = new JSONObject(b);
						ja.put(jo);
					}
					jo=new JSONObject();
					jo.put("data", ja);
					response.setContentType("text/json");
				    response.setCharacterEncoding("UTF-8");
				    response.getWriter().write(jo.toString());
				    return;
				} catch (Exception e) {
					response.setContentType("text/json");
				    response.setCharacterEncoding("UTF-8");
				    response.getWriter().write("Database Error");
				    return;
				}
				finally {
					db.closeConnection();
				}
			}
			// If either is null, then error
			else {
				if(stateString==null || completedString==null)
				{
					response.setContentType("application/json");
				    response.setCharacterEncoding("UTF-8");
				    response.getWriter().write("Invalid Paramaters");
				    return;
				}
				// Finally try and retreive requests following state and completed
				else {
					int state = Integer.parseInt(stateString);
					boolean completed = Boolean.parseBoolean(completedString);
					try {
						rbs = db.retreiveAllRequests(state,completed);
						for (RequestBean b : rbs) {
							jo = new JSONObject(b);
							ja.put(jo);
						}
						jo=new JSONObject();
						jo.put("data", ja);
						response.setContentType("text/json");
					    response.setCharacterEncoding("UTF-8");
					    response.getWriter().write(jo.toString());
					    return;
					} catch (Exception e) {
						response.setContentType("text/json");
					    response.setCharacterEncoding("UTF-8");
					    response.getWriter().write("Database Error");
					    return;
					}
					finally {
						db.closeConnection();
					}
				}
			   
			}
		}
	}
}
