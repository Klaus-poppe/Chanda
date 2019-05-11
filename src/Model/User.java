package Model;

public class User {
	

private int uid;
private String password;
private String name;
private String address;
private String email;
private String phone;


public int getUid() {						//Returns user id 
	return uid;
}
public void setId(int id) {					//Sets user id of new user
	this.uid = id;
}
public String getPassword() {				//Returns password of registered user
	return password;
}
public void setPassword(String password) {	//Sets password of new user
	this.password = password;
}

public String getName() {					//Returns name of user
	return name;
}
public void setName(String name) {			//Sets name of user from form
	this.name = name;
}
public String getEmail() {					//Returns email id of user
	return email;
}
public void setEmail(String email) {		//Sets email of user from form
	this.email = email;
}
public String getPhone() {					//Returns phone no. of user 
	return phone;
}
public void setPhone(String phone) {		//Sets phone no. of user from form
	this.phone = phone;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}




}
