package helper;

import java.sql.*;

import beans.requestBean;
import beans.updateRequestBean;
import beans.userBean;
import beans.dispatchBean;
/**
 * DB Helper Class
 * @author Nate4101
 * @param - jdbURL contains path to AWS MySQL relational Database
 */
public class DBHelper {
	
	private final static String jdbcUrl = "jdbc:mysql://aalqvghb03jhze.ctsdfdgibtnp.ca-central-1.rds.amazonaws.com:3306/cab?user=five0cab&password=fivezerocabdbpass";
	private Connection connection = null;
	// Constructor initializes connection
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
	 * Upload request to db table cab 
	*/
	public boolean uploadRequest(requestBean bean)
	{
		try {
		CallableStatement stmnt = connection.prepareCall("{CALL insert_req(?,?,?,?,?)}");
		stmnt.setString(1, bean.getlocation());
		stmnt.setString(2, bean.getpassengers());
		stmnt.setString(3, bean.getdescription());
		stmnt.setString(4, bean.getname());
		stmnt.setString(5, bean.getphone());
		int result = stmnt.executeUpdate();
		return(result>0);
		}
		catch(Exception exc) {
			exc.printStackTrace();
		}
		finally {
			try {
				connection.close();
			}
			catch(Exception ex) {
				ex.printStackTrace();
			}				
		}
		return false;
	}
	//Update a request in table: cab
	public boolean updateRequest(updateRequestBean bean)
	{
		try {
		CallableStatement stmnt = connection.prepareCall("{CALL update_req(?,?)}");
		stmnt.setString(1, bean.getID());
		stmnt.setString(2, bean.getcabnum());
		int result = stmnt.executeUpdate();
		return(result>0);
		}
		catch(Exception exc) {
			exc.printStackTrace();
		}
		finally {
			try {
				connection.close();
			}
			catch(Exception ex) {
				ex.printStackTrace();
			}				
		}
		return false;
	}
	
	public dispatchBean retreiveRequest()
	{
		dispatchBean dspBean = new dispatchBean();
		ResultSet results;
		try 
		{
			Statement statement = connection.createStatement();
			String query = "SELECT req_id, req_location, req_num_passengers, req_description, req_timestamp from req where req_confirmed = 0";
			results = statement.executeQuery(query);
			String ID = "";
			String location = "";
			String num_pas = "";
			String desc = "";
			String time = "";
			// should be changed to while.
			// use key value maps for data stored in a list for json
			if(results.next())
			{
				ID = results.getString("req_id");
				location = results.getString("req_location");
				num_pas = results.getString("req_num_passengers");
				desc = results.getString("req_description");
				time = results.getString("req_timestamp").substring(11); // get only the time;
				
				dspBean.setID(ID);
				dspBean.setLocation(location);
				dspBean.setnumber(num_pas);
				dspBean.setSpecial(desc);
				dspBean.setTime(time);	
			}
		}catch(Exception exc) {
			exc.printStackTrace();
			}finally {
				try {
					connection.close();
				}catch(Exception ex) {
						ex.printStackTrace();
					}				
				}
		return dspBean;
	}

	
	
	// Register a UserBean...
	// Checks if email already exists, registers otherwise.
	public boolean registerUser(userBean user)
	{
		 if(connection == null)
			 return false;
		 else
		 {
			 String fName = user.getuserfName();
			 String lName = user.getuserlName();
			 String email = user.getuserEmail();
			 String password = user.getuserPass();
			 String role = user.getuserRole();
			 PreparedStatement preparedStatement = null;
		 try
		 {
			 String query = "insert into Users(UserID,FName,LName,email,pass,role) values (NULL,?,?,?,?,?)"; //Insert user details into the table 'Users'
			 preparedStatement = connection.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
			 preparedStatement.setString(1, fName);
			 preparedStatement.setString(2, lName);
			 preparedStatement.setString(3, email);
			 preparedStatement.setString(4, password);
			 preparedStatement.setString(5, role);
			 int i= preparedStatement.executeUpdate();
			 if (i!=0)  //Just to ensure data has been inserted into the database
				 return true; 
		 }
		 catch(SQLException e){ e.printStackTrace(); }
		 return false;
		 }
	}	
	// Returns userbean associated with email, and pass if exists and is correct
	public userBean checkLoginCredentials(String email, String pass)
	{
		ResultSet results;
		try 
		{
			Statement statement = connection.createStatement();
			String query = "SELECT FName,LName,email,pass,role from Users";
			results = statement.executeQuery(query);
			String dbUserEmail = "";
			String dbUserPass = "";
			while(results.next())
			{
				dbUserEmail = results.getString("email");
				dbUserPass = results.getString("pass");
				if(email.equals(dbUserEmail) && pass.equals(dbUserPass))
				{
					String dbFName = results.getString("FName");
					String dbLName =results.getString("LName");
					String dbRole = results.getString("role");
					
					userBean user = new userBean();
					
					user.setuserfName(dbFName);
					user.setuserlName(dbLName);
					user.setuserRole(dbRole);
					
					return user;
				}
			}
		}
		catch(SQLException e) {e.printStackTrace();}
		
		return null;
	}
}
