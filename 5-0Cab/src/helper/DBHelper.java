package helper;

import java.sql.*;

import beans.userBean;

public class DBHelper {
	
	private final static String jdbcUrl = "jdbc:mysql://aalqvghb03jhze.ctsdfdgibtnp.ca-central-1.rds.amazonaws.com:3306/ebdb?user=nate4101&password=nate4101";
	private Connection connection = null;
	// Constructor initializes connection
	public DBHelper(){		
		  // Load the JDBC driver
		  try {
		    Class.forName("com.mysql.jdbc.Driver");
		  } catch (ClassNotFoundException e) {
		    throw new RuntimeException("Cannot find the driver in the classpath!", e);
		  }
		  // Create connection to RDS DB instance
		  try {
			connection = DriverManager.getConnection(jdbcUrl);
		  } catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
			}
		  /*
		  } finally {
		    System.out.println("Closing the connection.");
		    if (connection != null) try { conn.close(); } catch (SQLException ignore) {}
		  }
		  */  
	} // End getConnection()
	
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
