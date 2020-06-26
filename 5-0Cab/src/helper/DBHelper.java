package helper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import beans.RequestBean;
import beans.CabBean;
import beans.LogBean;
/**
 * DB Helper Class
 * @author Nate4101
 * @param - jdbcURL contains path to AWS MySQL relational Database
 * @Note - Close the connection when done.
 */
public class DBHelper {
	
	private final static String jdbcUrl = EnviromentVariables.jdbcURL;
			private Connection connection = null;
	
	/**
	 * Default Constructor creates a connection to the database
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
	 * Create a new cab object
	 * @param bean a cab bean with the details
	 * @return 0 for no changes, or 1 for success
	 */
	public boolean create_Cab(CabBean bean) {
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL create_cab(?,?,?)}");
			stmnt.setString(1, bean.getGeotab_serial_number());
			stmnt.setInt(2, bean.getCapacity());
			stmnt.setString(3, bean.getCab_number());
			int result = stmnt.executeUpdate();
			return(result>0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean create_Log(LogBean bean) {
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL create_log(?,?,?,?)}");
			stmnt.setString(1, bean.getText());
			stmnt.setString(2, bean.getTime());
			stmnt.setString(3, bean.getIp());
			stmnt.setString(4, bean.getType());
			int result = stmnt.executeUpdate();
			return(result>0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * Create New Request In the system
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
		catch(Exception e) {
			e.printStackTrace();
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
