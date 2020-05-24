package model;

public class SignUp {

    private String login;
    private String name;
    private String password;
    private int age;
    private String gender;
    private String address;
    private String comments;
    private String amigo;
    
    
    public SignUp(String login, String name, String password, int age, String gender, String address, String comments,
			String amigo) {
		this.login = login;
		this.name = name;
		this.password = password;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.comments = comments;
		this.amigo = amigo;
	}

	public SignUp() {
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getAmigo() {
		return amigo;
	}

	public void setAmigo(String amigo) {
		this.amigo = amigo;
	}
    
   
    

}
