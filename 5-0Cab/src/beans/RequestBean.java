package beans;
/*
 * requestBean, used for all data in a request Object
 * id : PK UUID : Generated server side on creation
 * location: string : location of pickup, typically an auto-suggest from bing maps
 * size : int : request size
 * lat : double : latitude of pickup
 * lon : double : longitude of pickup
 * timestamp : localdate-time string : time request is made for, primary sort by feature
 * details : string : additional details for the request provided by user
 * status : unsigned int : status of the request ...
 * 		0 : request created (created)
 * 		1 : request accepted by dispatcher (in progress)
 * 		2 : cab arrived (roughly) at pickup location (complete-able)
 * completed : boolean : query parameter, 
 */
public class RequestBean {
private String id, location, display_time, details, cabs;
private int size, state;
private long sorted_time;
private double lat, lon;
private boolean completed;
public String getId() {
	return id;
}
public void setId(String l) {
	this.id=l;
}
public String getLocation() {
	return location;
}
public void setLocation(String e) {
	this.location = e;
}
public int getSize() {
	return size;
}

public void setSize(int f) {
	this.size = f;
}
public double getLat() {
	return lat;
}

public void setLat(double p) {
	this.lat = p;
}

public double getLon() {
	return lon;
}

public void setLon(double f) {
	this.lon = f;
}
public String getDisplay_time() {
	return display_time;
}
public void setDisplay_time(String l) {
	this.display_time = l;
}
public long getSorted_time() {
	return sorted_time;
}
public void setSorted_time(long time_sort) {
	this.sorted_time = time_sort;
}
public String getDetails(){
	return details;
}
public void setDetails(String l) {
	this.details=l;
}
public int getState(){
	return state;
}
public void setState(int l) {
	this.state=l;
}
public boolean getCompleted() {
	return completed;
}
public void setCompleted(boolean l){
	this.completed=l;
}
public String getCabs() {
	return cabs;
}
public void setCabs(String l) {
	this.cabs=l;
}

}

