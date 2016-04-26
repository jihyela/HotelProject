package model;

public class CustomerVO {
	private String id;
	private String password;
	private String email;
	private String phone;
	
	public CustomerVO() {
		super();
	}

	public CustomerVO(String id, String password, String email, String phone) {
		super();
		this.id = id;
		this.password = password;
		this.email = email;
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", password=" + password + ", email="
				+ email + ", phone=" + phone + "]";
	}
	
	
}
