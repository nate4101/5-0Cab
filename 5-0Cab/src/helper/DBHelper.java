package helper;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.List;

import beans.RequestBean;
import beans.CabBean;
import beans.LogBean;
import beans.LogBean.logtype;
/**
 * DB Helper Class
 * @author Nate4101
 * @param - jdbcURL contains path to AWS MySQL relational Database
 * @Note - Close the connection when done.
 */
public class DBHelper {
	
	private final static String jdbcUrl = EnviromentVariables.jdbcUrl;
	private Connection connection = null;
	private String ip = null;
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
	public DBHelper(String Ip) {
		this.ip = Ip;
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
	public boolean create_cab(CabBean bean) {
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL create_cab(?,?,?)}");
			stmnt.setString(1, bean.getGeotab_serial_number());
			stmnt.setInt(2, bean.getCapacity());
			stmnt.setInt(3, bean.getCab_number());
			int result = stmnt.executeUpdate();
			if(result>0) {
				create_log(new LogBean("Create cab: ("+bean.getGeotab_serial_number()+", "+bean.getCapacity()+", "+bean.getCab_number()+").", ip, logtype.Database_Create));
				return true;
			}
			else {
				create_log(new LogBean("Create cab Failure: ("+bean.getGeotab_serial_number()+", "+bean.getCapacity()+", "+bean.getCab_number()+").", ip, logtype.Database_Error));
				return false;
			}
		} catch (Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * Add a log to the database
	 * @param bean log bean to add to database
	 * @return true for success
	 */
	public boolean create_log(LogBean bean) {
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL create_log(?,?,?,?)}");
			stmnt.setString(1, bean.getText());
			stmnt.setString(2, bean.getTime());
			if(bean.getIp()==null)
				bean.setIp("Unknown Source");
			stmnt.setString(3, bean.getIp());
			stmnt.setString(4, bean.getType());
			int result = stmnt.executeUpdate();
			return(result>0);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * Call create_req sql statement
	 * @param bean a request bean to insert into database
	 * @return true or false for succcess
	 */
	public boolean create_req(RequestBean bean)
	{
		try {
		CallableStatement stmnt = connection.prepareCall("{CALL create_req(?,?,?,?,?,?,?)}");
		stmnt.setString(1, bean.getId());
		stmnt.setString(2, bean.getLocation());
		stmnt.setInt(3, bean.getSize());
		stmnt.setDouble(4, bean.getLat());
		stmnt.setDouble(5, bean.getLon());
		stmnt.setString(6, bean.getDisplay_time());
		stmnt.setString(7, bean.getDetails());
		int result = stmnt.executeUpdate();
		if(result>0) {
			create_log(new LogBean("Create req: (id:"+bean.getId()+").", ip, logtype.Database_Create));
			return true;
		}
		else {
			create_log(new LogBean("Create req: (id:"+bean.getId()+") already exists.", ip, logtype.Database_Error));
			return false;
		}
		}
		catch(Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * Call create_session sql statement
	 * @param session a new geotab authentication
	 * @return true or false for succcess
	 */
	public boolean create_session(String session)
	{
		try {
		CallableStatement stmnt = connection.prepareCall("{CALL create_session(?)}");
		stmnt.setString(1, session);
		int result = stmnt.executeUpdate();
		if(result>0) {
			create_log(new LogBean("New geotab authentication.", ip, logtype.Database_Create));
			return true;
		}
		else {
			create_log(new LogBean("New geotab session database failure.", ip, logtype.Database_Error));
			return false;
		}
		}
		catch(Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * Delete a cab object... ie) we have no way to represent its location
	 * @param cab_num int cab num
	 * @return true for success, false for error
	 */
	public boolean delete_cab(String cab_num)
	{
		try {
			CallableStatement stmnt = connection.prepareCall("Call delete_cab(?)");
			stmnt.setString(1, cab_num);
			int result = stmnt.executeUpdate();
			if(result>0) {
				create_log(new LogBean("Deleted cab: "+cab_num, ip, logtype.Database_Delete));
				return true;
			}
			else {
				create_log(new LogBean("Delete Failure for cab: "+cab_num, ip, logtype.Database_Error));
				return false;
			}
			}
			catch(Exception e) {
				create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
				e.printStackTrace();
				return false;
			}
	}
	
	/**
	 * Delete a request by id
	 * @param req_id : UUID of request to delete
	 * @return true of false based on success
	 */
	public boolean delete_req(String req_id)
	{
		try {
			CallableStatement stmnt = connection.prepareCall("Call delete_req(?)");
			stmnt.setString(1, req_id);
			int result = stmnt.executeUpdate();
			if(result>0) {
				create_log(new LogBean("Deleted req: "+req_id, ip, logtype.Database_Delete));
				return true;
			}
			else {
				create_log(new LogBean("Delete Failure for req: "+req_id, ip, logtype.Database_Error));
				return false;
			}
			}
			catch(Exception e) {
				create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
				e.printStackTrace();
				return false;
			}
	}
	/**
	 * Retrieve a boolean indicating whether the dispatcher is online
	 * @return true: online, false: offline, null: error
	 */
	public boolean retrieve_admin_dispatcherOnline() {
		ResultSet results;
		try {
			CallableStatement stmnt = connection.prepareCall("{Call retrieve_admin_dispatcherOnline()}");
			results = stmnt.executeQuery();
			results.first();
			return results.getBoolean(0);
		} catch (Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * Get the serial number as a string for a gps cab_num
	 * @param cabnum the number on the cab to get the gps serial number for
	 * @return serial number if it can be found, null otherwise
	 */
	public String retrieve_cab_byCab_Num(int cabnum) {
		ResultSet results;
		try {
			CallableStatement stmnt = connection.prepareCall("{Call retrieve_cab_byCab_Num(?)}");
			stmnt.setInt(1, cabnum);
			results = stmnt.executeQuery();
			results.first();
			return results.getString(0);
		} catch (Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return null;
		}
	}
	
	public String retrieve_cab_byId(String idString) {
		ResultSet results;
		try {
			CallableStatement stmnt = connection.prepareCall("{Call retrieve_cab_byId(?)}");
			stmnt.setString(1, idString);
			results = stmnt.executeQuery();
			results.first();
			return results.getString(0);
		} catch (Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * Retrieve all cab objects, convertible to JSON
	 * @return list of cabBeans, empty if none, null if error
	 */
	public List<CabBean> retrieve_cabs_all(){
		List<CabBean> cabBeans = new ArrayList<>();
		CabBean rb;
		ResultSet results;
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL retrieve_cabs_all()}");
			results = stmnt.executeQuery();
			int rowcount = 0;
			while(results.next())
			{
				rb = new CabBean();
				rb.setCab_number(results.getInt(1));
				rb.setGeotab_serial_number(results.getString(2));
				rb.setCapacity(results.getInt(3));
				cabBeans.add(rb);
				rowcount ++;
			}
			create_log(new LogBean("Retrieve all cabs , result length: "+rowcount, ip, logtype.Database_Retrieve));
			return cabBeans;
		}
		catch(Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * Get all logs from the system, parsable into json, good for datatables
	 * @return List of LogBeans ( time, entry, ip, logtype)
	 */
	public List<LogBean> retrieve_logs_all(){
		List<LogBean> logBeans = new ArrayList<>();
		LogBean rb;
		ResultSet results;
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL retrieve_logs_all()}");
			results = stmnt.executeQuery();
			int rowcount = 0;
			while(results.next())
			{
				rb = new LogBean();
				rb.setTime(results.getString(1));
				rb.setText(results.getString(2));
				rb.setIp(results.getString(3));
				rb.setType(results.getString(4));
				logBeans.add(rb);
				rowcount ++;
			}
			create_log(new LogBean("Retrieve all logs , result length: "+rowcount, ip, logtype.Database_Retrieve));
			return logBeans;
		}
		catch(Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * Retrieve on requestbean
	 * @param id UUID to search for
	 * @return request bean of that object, null if error
	 */
	public RequestBean retrieve_req_byID(String id)
	{
		RequestBean rb;
		ResultSet results;
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL retrieve_req_byID(?)}");
			stmnt.setString(1, id);
			results = stmnt.executeQuery();
			while(results.next())
			{
				rb = new RequestBean();
				rb.setId(results.getString("id"));
				rb.setLocation(results.getString("location"));
				rb.setSize(results.getInt("size"));
				rb.setLat(results.getDouble("lat"));
				rb.setLon(results.getDouble("lon"));
				rb.setDisplay_time(results.getString("time_display"));
				String convertableString = results.getString("time_raw").split("\\s+")[0]+"T"+results.getString("time_raw").split("\\s+")[1];
				rb.setSorted_time(LocalDateTime.parse(convertableString).toEpochSecond(ZoneOffset.UTC));
				rb.setDetails(results.getString("details"));
				rb.setState(results.getInt("state"));
				rb.setCompleted(results.getBoolean("completed"));
				rb.setCabs(results.getString("cabs"));
				create_log(new LogBean("Retrieve req: "+rb.getId(), ip, logtype.Database_Retrieve));
				return rb;
			}
			create_log(new LogBean("Retrieve req failed for id: "+id, ip, logtype.Database_Error));
			return null;
		}
		catch(Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * Retrieve all Requests as a list of RequestBeans
	 * @return array of RequestBeans matching this description
	 * null if error
	 */
	public List<RequestBean> retrieve_reqs_all()
	{
		List<RequestBean> reqsBeans = new ArrayList<>();
		RequestBean rb;
		ResultSet results;
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL retrieve_reqs_all()}");
			results = stmnt.executeQuery();
			int rowcount = 0;
			while(results.next())
			{
				rb = new RequestBean();
				rb.setId(results.getString("id"));
				rb.setLocation(results.getString("location"));
				rb.setSize(results.getInt("size"));
				rb.setLat(results.getDouble("lat"));
				rb.setLon(results.getDouble("lon"));
				rb.setDisplay_time(results.getString("time_display"));
				System.out.println("Database time_display: "+results.getString("time_display"));
				String convertableString = results.getString("time_raw").split("\\s+")[0]+"T"+results.getString("time_raw").split("\\s+")[1];
				long sortTime = LocalDateTime.parse(convertableString).toEpochSecond(ZoneOffset.UTC);
				System.out.println("Database time_sort: "+ sortTime);
				rb.setSorted_time(sortTime);
				System.out.println("Database time_sort: "+ rb.getSorted_time());
				//System.out.println(rb.getSorted_time());
				rb.setDetails(results.getString("details"));
				rb.setState(results.getInt("state"));
				rb.setCompleted(results.getBoolean("completed"));
				rb.setCabs(results.getString("cabs"));
				reqsBeans.add(rb);
				rowcount++;
			}
			create_log(new LogBean("Retrieve "+rowcount+"requests", ip, logtype.Database_Retrieve));
			return reqsBeans;
		}
		catch(Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * Retrieve all requests made to the system 
	 * @param completed ={true,false} 
	 * @return list of RequestBeans 
	 * null if error
	 */
	public List<RequestBean> retrieve_reqs_byCompleted(boolean completed)
	{
		List<RequestBean> reqsBeans = new ArrayList<>();
		RequestBean rb;
		ResultSet results;
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL retrieve_reqs_byCompleted(?)}");
			stmnt.setBoolean(1, completed);
			results = stmnt.executeQuery();
			int rowcount = 0;
			while(results.next())
			{
				rb = new RequestBean();
				rb.setId(results.getString("id"));
				rb.setLocation(results.getString("location"));
				rb.setSize(results.getInt("size"));
				rb.setLat(results.getDouble("lat"));
				rb.setLon(results.getDouble("lon"));
				rb.setDisplay_time(results.getString("time_display"));
				String convertableString = results.getString("time_raw").split("\\s+")[0]+"T"+results.getString("time_raw").split("\\s+")[1];
				rb.setSorted_time(LocalDateTime.parse(convertableString).toEpochSecond(ZoneOffset.UTC));
				rb.setDetails(results.getString("details"));
				rb.setState(results.getInt("state"));
				rb.setCompleted(results.getBoolean("completed"));
				rb.setCabs(results.getString("cabs"));
				reqsBeans.add(rb);
				rowcount ++;
			}
			create_log(new LogBean("Retrieve reqs by complete, result length: "+rowcount, ip, logtype.Database_Retrieve));
			return reqsBeans;
		}
		catch(Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * Retrieve all reqs where state is that value, null if error
	 * @param state int = {0,1,2,3} => {new, confirmed, completed, declined}
	 * @return list of request beans where state is state
	 */
	public List<RequestBean> retrieve_reqs_byState(int state)
	{
		if(state<0 || state>3)
		{
			create_log(new LogBean("Retrieve reqs by state error, state: "+state, ip, logtype.Database_Error));
			return null;
		}
		List<RequestBean> reqsBeans = new ArrayList<>();
		RequestBean rb;
		ResultSet results;
		try {
			CallableStatement stmnt = connection.prepareCall("{CALL retrieve_reqs_byState(?)}");
			stmnt.setInt(1, state);
			results = stmnt.executeQuery();
			int rowcount = 0;
			while(results.next())
			{
				rb = new RequestBean();
				rb.setId(results.getString("id"));
				rb.setLocation(results.getString("location"));
				rb.setSize(results.getInt("size"));
				rb.setLat(results.getDouble("lat"));
				rb.setLon(results.getDouble("lon"));
				rb.setDisplay_time(results.getString("time_display"));
				String convertableString = results.getString("time_raw").split("\\s+")[0]+"T"+results.getString("time_raw").split("\\s+")[1];
				rb.setSorted_time(LocalDateTime.parse(convertableString).toEpochSecond(ZoneOffset.UTC));
				rb.setDetails(results.getString("details"));
				rb.setState(results.getInt("state"));
				rb.setCompleted(results.getBoolean("completed"));
				rb.setCabs(results.getString("cabs"));
				reqsBeans.add(rb);
				rowcount ++;
			}
			create_log(new LogBean("Retrieve reqs by state, result length: "+rowcount, ip, logtype.Database_Retrieve));
			return reqsBeans;
		}
		catch(Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * Retrieve a string containing the current authentication token for geotab
	 * @return string: auth_token null if error
	 */
	public String retrieve_sessions_authentication() {
		ResultSet results;
		try {
			CallableStatement stmnt = connection.prepareCall("{Call retrieve_sessions_activeSession()}");
			results = stmnt.executeQuery();
			results.first();
			return results.getString(0);
		} catch (Exception e) {
			create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * Update admin of id's, user and pass
	 * @param id - boolean, 0 for admin, 1 for dispatcher
	 * @param email - new email for security purpose
	 * @param pass - new pass
	 * @return true if success, false otherwise
	 */
	public boolean update_admin_login(boolean id, String email, String pass, String secureID) {
		if(!(secureID==EnviromentVariables.adminSessionID))
		{
			create_log(new LogBean("Unauthorized User tried to update Admin Login", ip, logtype.Admin_Error));
			return false;
		}
		try {
			CallableStatement stmnt = connection.prepareCall("Call update_admin_login(?,?,?)");
			stmnt.setBoolean(1, id);
			stmnt.setString(2, email);
			stmnt.setString(3, pass);
			int result = stmnt.executeUpdate();
			if(result>0) {
				create_log(new LogBean("Updated Admin Login for: "+id, ip, logtype.Admin));
				return true;
			}
			else {
				create_log(new LogBean("Failed to Update Admin Login: "+id, ip, logtype.Database_Error));
				return false;
			}
			}
			catch(Exception e) {
				create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
				e.printStackTrace();
				return false;
			}
	}
	
	/**
	 * Update a gps-cab details pair
	 * @param geo geotab serial num on gps
	 * @param cab_size new cab size, no error check
	 * @param cab_num new cab number for dispatcher to see
	 * @return true if succesful false otherwise
	 */
	public boolean update_cab_bySerialNum(String geo, int cab_size, int cab_num) {
		try {
			CallableStatement stmnt = connection.prepareCall("Call update_cab_bySerialNum(?,?,?)");
			stmnt.setString(1, geo);
			stmnt.setInt(2, cab_size);
			stmnt.setInt(3, cab_num);
			int result = stmnt.executeUpdate();
			if(result>0) {
				create_log(new LogBean("Updated Cab details for gps: "+geo, ip, logtype.Admin));
				return true;
			}
			else {
				create_log(new LogBean("Failed to Update gps: "+geo, ip, logtype.Database_Error));
				return false;
			}
			}
			catch(Exception e) {
				create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
				e.printStackTrace();
				return false;
			}
	}
	
	/**
	 * Set the dispatchers status to online or offline
	 * @param online - online or offline
	 * @return ture if succesful, false otherwise
	 */
	public boolean update_dispatcherOnline(boolean online) {
		try {
			CallableStatement stmnt = connection.prepareCall("Call update_dispatcherOnline(?)");
			stmnt.setBoolean(1, online);
			int result = stmnt.executeUpdate();
			if(result>0) {
				create_log(new LogBean("Dispatcher logged "+ (online==true?"in.":"out."), ip, logtype.Dispatcher));
				return true;
			}
			else {
				create_log(new LogBean("Failed to Update dispatcher online: ", ip, logtype.Database_Error));
				return false;
			}
			}
			catch(Exception e) {
				create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
				e.printStackTrace();
				return false;
			}
	}
	/**
	 * Update a request to complete: updates text, state to 2 and completed to true
	 * @param uuid request id to update
	 * @return true is succesful
	 */
	public boolean update_req_complete(String uuid) {
		try {
			CallableStatement stmnt = connection.prepareCall("Call update_req_complete(?)");
			stmnt.setString(1, uuid);
			int result = stmnt.executeUpdate();
			if(result>0) {
				create_log(new LogBean("Request updated to complete id: "+ uuid, ip, logtype.Dispatcher));
				return true;
			}
			else {
				create_log(new LogBean("Failed to complete request id: "+uuid, ip, logtype.Database_Error));
				return false;
			}
			}
			catch(Exception e) {
				create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
				e.printStackTrace();
				return false;
			}
	}
	
	/**
	 * Update a request to confirmed including a list of cabs to serve the request
	 * @param uuid
	 * @param cabs comma seperated list of ints representing cab nums
	 * @return
	 */
	public boolean update_req_confirm(String uuid, String cabs) {
		try {
			CallableStatement stmnt = connection.prepareCall("Call update_req_confirm(?,?)");
			stmnt.setString(1, uuid);
			stmnt.setString(2, cabs);
			int result = stmnt.executeUpdate();
			if(result>0) {
				create_log(new LogBean("Request updated to confirm id: "+ uuid+" , cabs: "+cabs, ip, logtype.Dispatcher));
				return true;
			}
			else {
				create_log(new LogBean("Failed to confirm request id: "+uuid, ip, logtype.Database_Error));
				return false;
			}
			}
			catch(Exception e) {
				create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
				e.printStackTrace();
				return false;
			}
	}
	/**
	 * Decline a request with a message
	 * @param uuid - request id to decline
	 * @param reason - reason declined
	 * @return true for success, false otherwise
	 */
	public boolean update_req_decline(String uuid, String reason) {
		try {
			CallableStatement stmnt = connection.prepareCall("Call update_req_decline(?,?)");
			stmnt.setString(1, uuid);
			stmnt.setString(2, reason);
			int result = stmnt.executeUpdate();
			if(result>0) {
				create_log(new LogBean("Request declined: "+ uuid, ip, logtype.Dispatcher));
				return true;
			}
			else {
				create_log(new LogBean("Failed to decline request id: "+uuid, ip, logtype.Database_Error));
				return false;
			}
			}
			catch(Exception e) {
				create_log(new LogBean("Database exception: "+e.toString(), ip, logtype.Database_Error));
				e.printStackTrace();
				return false;
			}
	}
}
