package beans;

// Class UserBean 
// Strings: email, pass, f/l names, role
// getters and setters for each

public class userBean {
private String userEmail, userPass, userfName, userlName, userRole;

public String getuserEmail() {
	return userEmail;
}

public void setuserEmail(String e) {
	this.userEmail = e;
}

public String getuserPass() {
	return userPass;
}

public void setuserPass(String p) {
	this.userPass = p;
}

public String getuserfName() {
	return userfName;
}

public void setuserfName(String f) {
	this.userfName = f;
}

public String getuserlName() {
	return userlName;
}

public void setuserlName(String l) {
	this.userlName = l;
}

public String getuserRole() {
	return userRole;
}

public void setuserRole(String r) {
	this.userRole = r;
}

}
