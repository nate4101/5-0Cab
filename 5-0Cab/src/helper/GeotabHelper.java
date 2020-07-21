package helper;

import java.io.IOException;
import java.time.LocalDateTime;

import org.json.JSONException;
import org.json.JSONObject;

import beans.LogBean;
import beans.LogBean.logtype;

public class GeotabHelper {

	private String credentials = null;
	private double lattitude;
	private double longitude;
	private String ip;
	// Confederation containing the path
	private String path;
	/**
	 * Default Constructor
	 * @param Ip - Ip address of the end-user creating this request
	 */
	public GeotabHelper(String Ip) {
		DBHelper db = new DBHelper(Ip);
		credentials = db.retrieve_sessions_authentication();
		db.closeConnection();
		this.ip=Ip;
	}
	/**
	 * Authenticate this object with the correct path, and credentials object.
	 * @return true if successful false otherwise
	 */
	private boolean authenticate() {
		// Used for db calls;
		DBHelper db = new DBHelper(ip);
		// Help make calls over URL
		JSONhelper jh = new JSONhelper();
		JSONObject authJSON = null;
		try {
			//TODO move this to enviroment variables
			authJSON = jh.readJsonFromUrl(EnviromentVariables.geotabAuthenticateURL);
			db.create_log(new LogBean("New Credentials generate at: "+LocalDateTime.now().toString(), this.ip, logtype.EndUser));
		} catch (Exception e) {
			e.printStackTrace();
			db.create_log(new LogBean("Error creating new Authentication: "+e.toString(), this.ip, logtype.EndUser_Error));
			return false;
		}
		JSONObject results = authJSON.getJSONObject("results");
		if(results==null) {
			return false;
		}
		else {
			// TODO Retreive Path and Credentials Objects, store them as strings to be used later
		}
	}
	/**
	 * Get the coordinates of a gps Serial number
	 * @param gpsSerialNum
	 * @return String containing comma seperated coordinates ie) "4.73423, 45.3432" (without " ")
	 * @Note - Assumes it exists
	 */
	public String getCoordinates(String gpsSerialNum) {
		//TODO Write this code
		return null;
	}
	
}
