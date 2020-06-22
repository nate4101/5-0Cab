package beans;

/*
 * CabBean, used for all data in a cab Object
 * geotab_serial_number: PK : serial number for geotab GPS installed in vehicle
 * capacity: int : carrying capacity 
 * cab_number : cab number on vehicle
 */
public class CabBean {
private String geotab_serial_number, cab_number;
private int capacity;

public String getGeotab_serial_number() {
	return geotab_serial_number;
}

public void setGeotab_serial_number(String e) {
	this.geotab_serial_number = e;
}

public int getCapacity() {
	return capacity;
}

public void setCapacity(int p) {
	this.capacity = p;
}

public String getCab_number() {
	return cab_number;
}

public void setCab_number(String f) {
	this.cab_number = f;
}

}
