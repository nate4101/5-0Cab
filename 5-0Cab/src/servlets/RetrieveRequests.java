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

import beans.LogBean;
import beans.LogBean.logtype;
import beans.RequestBean;
import helper.DBHelper;

public class RetrieveRequests extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String stateString = request.getParameter("state");
		//System.out.println(stateString);
		String completedString = request.getParameter("completed");
		//System.out.println(completedString);
		String idString = request.getParameter("id");
		// Include a formatted time?
		String formatString = request.getParameter("formatted");
		
		List<RequestBean> rbs = new ArrayList<RequestBean>();
		RequestBean rb = new RequestBean();
		JSONObject jo = new JSONObject();
		JSONArray ja = new JSONArray();
		DBHelper db = new DBHelper();
		// Remote address : https://stackoverflow.com/questions/11683246/get-ip-address-of-client-in-jsp
		String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }
        //db.create_log(new LogBean("Retrieve Request With Paramater: id="+idString+", state="+stateString+"completed="+completedString, ip, logtype.EndUser));
		// Prioritize get request by id for a single case lookup of assigned cabs
		if(idString!=null) {
			try {
				rb=db.retrieve_req_byID(idString);
				jo = new JSONObject(rb);
				if(Boolean.parseBoolean(formatString))
				{
					jo.remove("display_time");
					jo.remove("sorted_time");
					JSONObject timeFormat = new JSONObject().put("display", rb.getDisplay_time()).put("sort", rb.getSorted_time());
					jo.putOpt("time", timeFormat);
				}
				response.setContentType("text/json");
			    response.setCharacterEncoding("UTF-8");
				response.getWriter().println(jo.toString());
				return;
			} catch (Exception e) {
				db.create_log(new LogBean("Retrieve Request Failure: id="+idString+", state="+stateString+"completed="+completedString, ip, logtype.EndUser_Error));
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
			if(completedString!=null) {
				// Secondly retrieve by completed, completed == false is most useful for dispatcher
				try {
					rbs = db.retrieve_reqs_byCompleted(Boolean.parseBoolean(completedString));
					for (RequestBean b : rbs) {
						jo = new JSONObject(b);
						if(Boolean.parseBoolean(formatString))
						{
							jo.remove("display_time");
							jo.remove("sorted_time");
							JSONObject timeFormat = new JSONObject().put("display", rb.getDisplay_time()).put("sort", rb.getSorted_time());
							jo.putOpt("time", timeFormat);
						}
						ja.put(jo);
					}
					jo=new JSONObject();
					jo.put("data", ja);
					response.setContentType("text/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(jo.toString());
					return;
				} catch (Exception e) {
					db.create_log(new LogBean("Retrieve Request Failure: id="+idString+", state="+stateString+"completed="+completedString, ip, logtype.EndUser_Error));
					response.setContentType("text/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write("Database Error");
					return;
				}
				finally {
					db.closeConnection();
				}
			}
			else {
				if(stateString!=null)
				{
					try {
						rbs = db.retrieve_reqs_byState(Integer.parseInt(stateString));
						for (RequestBean b : rbs) {
							jo = new JSONObject(b);
							if(Boolean.parseBoolean(formatString))
							{
								jo.remove("display_time");
								jo.remove("sorted_time");
								JSONObject timeFormat = new JSONObject().put("display", rb.getDisplay_time()).put("sort", rb.getSorted_time());
								jo.putOpt("time", timeFormat);
							}
							ja.put(jo);
						}
						jo=new JSONObject();
						jo.put("data", ja);
						response.setContentType("text/json");
						response.setCharacterEncoding("UTF-8");
						response.getWriter().write(jo.toString());
						return;
					} catch (Exception e) {
						db.create_log(new LogBean("Retrieve Request Failure: id="+idString+", state="+stateString+"completed="+completedString, ip, logtype.EndUser_Error));
						response.setContentType("text/json");
						response.setCharacterEncoding("UTF-8");
						response.getWriter().write("Database Error");
						return;
					}
					finally {
						db.closeConnection();
					}
				}
				else {
					try {
						rbs = db.retrieve_reqs_all();
						for (RequestBean b : rbs) {
							jo = new JSONObject(b);
							if(Boolean.parseBoolean(formatString))
							{
								System.out.println("Json before reformating: "+jo.toString());
								jo.remove("display_time");
								jo.remove("sorted_time");
								JSONObject tF = new JSONObject();
								tF.put("sort", b.getSorted_time());
								tF.put("display",b.getDisplay_time());
								jo.putOpt("time", tF);
								System.out.println("Json after reformating: "+jo.toString());
							}
							ja.put(jo);
						}
						jo=new JSONObject();
						jo.put("data", ja);
						response.setContentType("text/json");
						response.setCharacterEncoding("UTF-8");
						response.getWriter().write(jo.toString());
						return;
					} catch (Exception e) {
						db.create_log(new LogBean("Retrieve Request Failure: id="+idString+", state="+stateString+"completed="+completedString, ip, logtype.EndUser_Error));
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
