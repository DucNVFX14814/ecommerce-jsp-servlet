package model;

public class Account {
	private String email, password;
	private int role;
	private String name, address, phone;

	public Account() {
		
	}
	
	public Account(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public Account(String email, String password, int role, String name, String address, String phone) {
		this.email = email;
		this.password = password;
		this.role = role;
		this.name = name;
		this.address = address;
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Account [email=" + email + ", password=" + password + ", role=" + role + ", name=" + name + ", address="
				+ address + ", phone=" + phone + "]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
}
