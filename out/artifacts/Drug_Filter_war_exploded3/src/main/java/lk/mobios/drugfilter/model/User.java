package lk.mobios.drugfilter.model;

public class User {
	
	private String id;
	private String name;
	private String address;
	private String mobileNo;
	private String nic;
	private String email;
	private String password;
	private String otp;
	private String verified;
	private int otpUpdateCount;
	
	public User(String id, String name, String address, String mobileNo, String nic, String email, String password,
			String otp, String verified) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.mobileNo = mobileNo;
		this.nic = nic;
		this.email = email;
		this.password = password;
		this.otp = otp;
		this.verified = verified;
	}
	
	

	public User(String id, String name, String address, String mobileNo, String nic, String email, String password,
			String otp, String verified, int otpUpdateCount) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.mobileNo = mobileNo;
		this.nic = nic;
		this.email = email;
		this.password = password;
		this.otp = otp;
		this.verified = verified;
		this.otpUpdateCount = otpUpdateCount;
	}



	public User() {
		super();
	}
	
	public User(Object user) {
		super();
		user = new User();
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
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

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	public String getVerified() {
		return verified;
	}

	public void setVerified(String verified) {
		this.verified = verified;
	}



	public int getOtpUpdateCount() {
		return otpUpdateCount;
	}



	public void setOtpUpdateCount(int otpUpdateCount) {
		this.otpUpdateCount = otpUpdateCount;
	}

	
	
	
	

}
