package beans;

import java.time.LocalDateTime;

public class LogBean {
	// For logtypes
	public static enum logtype { EndUser, EndUser_Error, Dispatcher, Dispatcher_Error, Admin, Admin_Error, System, System_Error, Database_Create, Database_Delete, Database_Retrieve, Database_Update, Database_Error};
	private String text, ip;
	private logtype type;
	private String time;
	
	public LogBean() {
	}
	public LogBean(String text, String ip, logtype lt) {
		this.text = text;
		this.ip = ip;
		LocalDateTime lcl = LocalDateTime.now();
		this.time = lcl.toString().split("T")[0]+" "+lcl.toString().split("T")[1];
		this.type = lt;
	}
	
	public String getIp() {
		return ip;
	}
	public String getText() {
		return text;
	}
	public String getTime() {
		return this.time;
	}
	public String getType() {
		return type.toString();
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public void setText(String text) {
		this.text = text;
	}
	public void setTime(){
		LocalDateTime lcl = LocalDateTime.now();
		this.time = lcl.toString().split("T")[0]+" "+lcl.toString().split("T")[1];
	}
	public void setTime(String localDateTimeFormatted){
		this.time = localDateTimeFormatted;
	}
	public void setTime(LocalDateTime time) {
		this.time = time.toString().split("T")[0]+" "+time.toString().split("T")[1];
	}
	public void setType(logtype type) {
		this.type = type;
	}
	public void setType(String type) {
		this.type = logtype.valueOf(type);
	}
}
