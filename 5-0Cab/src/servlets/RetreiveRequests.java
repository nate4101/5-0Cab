package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.AbstractDocument.Content;

import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import beans.dispatchBean;
import helper.DBHelper;

public class RetreiveRequests extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		dispatchBean content = new dispatchBean();
		DBHelper db = new DBHelper();
		content = db.retreiveRequest();
		ArrayList<String> list = new ArrayList<String>();
	    list.add(content.getnumber());
	    list.add(content.getLocation());
	    list.add(content.getSpecial());
	    list.add(content.getTime());
	    list.add(content.getID());
	    list.add(content.getID());
	    String json = new Gson().toJson(list);

	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);}
	
}
