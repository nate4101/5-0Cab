package beans;

import java.time.LocalDateTime;

public class LogBean {
	private String text, ip, type;
	private LocalDateTime time;
	
	public LogBean() {
	}
	
	public String getIp() {
		return ip;
	}
	public String getText() {
		return text;
	}
	public String getTime() {
		return this.time.toString().split("T")[0]+" "+this.time.toString().split("T")[1];
	}
	public String getType() {
		return type;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public void setText(String text) {
		this.text = text;
	}
	public void setTime(){
		this.time = LocalDateTime.now();
	}
	public void setTime(LocalDateTime time) {
		this.time = time;
	}
	public void setType(String type) {
		this.type = type;
	}
}
