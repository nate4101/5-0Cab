package helper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import beans.RequestBean;
import beans.CabBean;
/**
 * DB Helper Class
 * @author Nate4101
 * @param - jdbURL contains path to AWS MySQL relational Database
 */
public class DBHelper {
	
	/**
	 * Ideally move to local storage and retrive from a file, keep it hidden from end users, or github...
	 */
	private final static String jdbcUrl = "jdbc:mysql://fivezerocabdb.cq6c0sods0tf.ca-central-1.rds.amazonaws.com:3306/cab?user=nate4101&password=fivezerocab";
	private Connection connection = null;
	/*
	 * Constructor initializes connection
	 */
	public DBHelper(){		
		  // Load the JDBC driver
		  try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
		  } catch (ClassNotFoundException e) {
		    throw new RuntimeException("Cannot find the driver in the classpath!", e);
		  }
		  // Create connection to RDS DB instance
		  try {
			connection = DriverManager.getConnection(jdbcUrl);
		  } 
		  catch (SQLException ex) {
			  System.out.println("SQLException: " + ex.getMessage());
			  System.out.println("SQLState: " + ex.getSQLState());
			  System.out.println("VendorError: " + ex.getErrorCode());
			}
		   
	} 
	/**
	 * Call to close connection, returns true if successful, false otherwise
	 */
	public boolean closeConnection() {
			try {
				connection.close();
				return true;
			}
			catch(Exception ex) {
				ex.printStackTrace();
				return false;
			}				
	}
	/**
	 * Upload request to db table req
	*/
	public boolean uploadNewRequest(RequestBean bean)
	{
		try {
		CallableStatement stmnt = connection.prepareCall("{CALL create_req(?,?,?,?,?,?,?)}");
		stmnt.setString(1, bean.getId());
		stmnt.setString(2, bean.getLocation());
		stmnt.setInt(3, bean.getSize());
		stmnt.setDouble(4, bean.getLat());
		stmnt.setDouble(5, bean.getLon());
		stmnt.setString(6, bean.getReq_time());
		stmnt.setString(7, bean.getDetails());
		int result = stmnt.executeUpdate();
		return(result>0);
		}
		catch(Exception exc) {
			exc.printStackTrace();
		}
		return false;
	}

	/**
	 * 
	 * @param state = {0,1,2,3} => {uploaded, confirmed, completed, denied}
	 * @param completed ={true,false}
	 * @return array of RequestBeans matching this description
	 * null if error
	 */
	public List<RequestBean> retreiveAllRequests(int state, boolean completed)
	{
		List<RequestBean> reqsBeans = new ArrayList<>();
		RequestBean rb;
		ResultSet results;
		if( state<0 || state>3)
			return null;
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL retreive_select_reqs(?,?)}");
			stmnt.setInt(1, state);
			stmnt.setBoolean(2, completed);
			results = stmnt.executeQuery();
			while(results.next())
			{
				rb = new RequestBean();
				rb.setId(results.getString("id"));
				rb.setLocation(results.getString("location"));
				rb.setSize(results.getInt("size"));
				rb.setLat(results.getDouble("lat"));
				rb.setLon(results.getDouble("lon"));
				rb.setReq_time(results.getString("req_time"));
				rb.setDetails(results.getString("details"));
				rb.setState(results.getInt("state"));
				rb.setCompleted(results.getBoolean("completed"));
				rb.setCabs(results.getString("cabs"));
				reqsBeans.add(rb);
			}
			return reqsBeans;
		}
		catch(Exception exc) {
			exc.printStackTrace();
			return null;
		}
	}
	/**
	 * 
	 * @return List of all RequestBeans sorted by date
	 */
	public List<RequestBean> retreiveAllRequests()
	{
		List<RequestBean> reqsBeans = new ArrayList<>();
		RequestBean rb;
		ResultSet results;
		
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL retreive_all_req()}");
			results = stmnt.executeQuery();
			while(results.next())
			{
				rb = new RequestBean();
				rb.setId(results.getString("id"));
				rb.setLocation(results.getString("location"));
				rb.setSize(results.getInt("size"));
				rb.setLat(results.getDouble("lat"));
				rb.setLon(results.getDouble("lon"));
				rb.setReq_time(results.getString("req_time"));
				rb.setDetails(results.getString("details"));
				rb.setState(results.getInt("state"));
				rb.setCompleted(results.getBoolean("completed"));
				rb.setCabs(results.getString("cabs"));
				reqsBeans.add(rb);
			}
			return reqsBeans;
		}
		catch(Exception exc) {
			exc.printStackTrace();
			return null;
		}
	}
	public RequestBean retreiveRequest(String id)
	{
		RequestBean rb;
		ResultSet results;
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL retreive_req(?)}");
			stmnt.setString(1, id);
			results = stmnt.executeQuery();
			while(results.next())
			{
				rb = new RequestBean();
				rb.setId(results.getString("id"));
				rb.setLocation(results.getString("location"));
				rb.setLat(results.getDouble("lat"));
				rb.setLon(results.getDouble("lon"));
				rb.setReq_time(results.getString("req_time"));
				rb.setDetails(results.getString("details"));
				rb.setState(results.getInt("state"));
				rb.setCompleted(results.getBoolean("completed"));
				rb.setCabs(results.getString("cabs"));
				return rb;
			}
			return null;
		}
		catch(Exception exc) {
			exc.printStackTrace();
			return null;
		}
	}
}
