package data;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Product;
import model.SignIn;
import model.SignUp;


public class DBWorker {
	private final static String INSERT = "INSERT INTO users(login, name, password, age, gender, comments, address, amigo) VALUES (?,?,?,?,?,?,?,?)";
	private final static String SELECTALL = "SELECT * FROM products";
	private final static String IDFORM = "SELECT * FROM products WHERE id=?";
	private final static String GET_CATEGORY = "SELECT * FROM products WHERE category=?";
	
	
	private SignUp signUp;
	private SignIn signIn;
	private String registration;
	private boolean checkLogin;
	private String message;
	private String userName;
	private String existLogin = "";
	private String existPassword = "";
	private String access;
	private boolean show;
	private String currentpassword;

	private static final String SALT = "SALT";

	public DBWorker() {
	}

	public DBWorker(SignUp signUp) {
		this.signUp = signUp;
	}

	public DBWorker(SignIn signIn) {
		this.signIn = signIn;
	}

	public boolean insert() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		Connection conn = null;

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/iteaweb?" + "user=root&password=");
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(INSERT);
			// запрос в БД
			stmt.setString(1, signUp.getLogin());
			stmt.setString(2, signUp.getName());
			stmt.setString(3, toHexString(hashSHA(signUp.getPassword())));
			stmt.setInt(4, signUp.getAge());
			stmt.setString(5, signUp.getGender());
			stmt.setString(6, signUp.getComments());
			stmt.setString(7, signUp.getAddress());
			stmt.setString(8, signUp.getAmigo());
			stmt.execute();

		} catch (SQLException ex) {

			ex.printStackTrace();
			return false;
		} finally {

			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException sqlEx) {
					sqlEx.printStackTrace();
				}

				stmt = null;
			}

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return true;
	}

	public String getRegistration() {

		return insert() ? "success" : "fault";
	}

	public boolean getCheckLogin() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		Connection conn = null;

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/iteaweb?" + "user=root&password=");
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT login FROM users WHERE login='" + signUp.getLogin() + "'");
			rs.next();
			existLogin = rs.getString("login");
		} catch (SQLException ex) {
			existLogin = "notExist";
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sqlEx) {
					sqlEx.printStackTrace();
				}

				rs = null;
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException sqlEx) {
					sqlEx.printStackTrace();
				}

				stmt = null;
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return (signUp.getLogin().equals(existLogin));
	}


	public String getUserName() {

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		Connection conn = null;

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/iteaweb?" + "user=root&password=");
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT name FROM users WHERE login='" + signIn.getLogin() + "'");
			rs.next();
			userName = rs.getString("name");
		} catch (SQLException ex) {
			userName = "";
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sqlEx) {
					sqlEx.printStackTrace();
				}

				rs = null;
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException sqlEx) {
					sqlEx.printStackTrace();
				}

				stmt = null;
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return userName;
	}

	public boolean isShow() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		Connection conn = null;

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/iteaweb?" + "user=root&password=");
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery("SELECT login, password FROM users WHERE login='" + signIn.getLogin()
					+ "' AND password='" + toHexString(hashSHA(signIn.getPassword())) + "'");
			rs.next();
			existLogin = rs.getString("login");
			existPassword = rs.getString("password");
			System.out.println("Log "+ existLogin);
			System.out.println("Pass "+existPassword);

		} catch (SQLException ex) {
			existLogin = "notExist";
			existPassword = "notExist";
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sqlEx) {
					sqlEx.printStackTrace();
				}

				rs = null;
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException sqlEx) {
					sqlEx.printStackTrace();
				}

				stmt = null;
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return (signIn.getLogin().equals(existLogin) && !(existPassword.equals("notExist")));
	}

	public String getAccess() {
		return isShow() ? "Successfully logged" : "Incorrect username or password";
	}
	
	public static byte[] hashSHA(String strToHash) {
		 MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}  

	        return md.digest((strToHash+SALT).getBytes(StandardCharsets.UTF_8));  
	    	
	    }
	 
	 public static String toHexString(byte[] hash) 
	    { 
	        // Convert byte array into signum representation  
	        BigInteger number = new BigInteger(1, hash);  
	  
	        // Convert message digest into hex value  
	        StringBuilder hexString = new StringBuilder(number.toString(16));  
	  
	        // Pad with leading zeros 
	        while (hexString.length() < 32)  
	        {  
	            hexString.insert(0, '0');  
	        }  
	  
	        return hexString.toString();  
	    } 
	 
	 


		public List<Product> getProducts() {
			List<Product> productList = new ArrayList<Product>();

			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

			Connection conn = null;

			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost/iteaweb?" + "user=root&password=");
			} catch (SQLException ex) {
				ex.printStackTrace();
			}

			Statement stmt = null;
			ResultSet rs = null;

			try {

				stmt = conn.createStatement();
				rs = stmt.executeQuery(SELECTALL);
				while (rs.next()) {
					Product product = new Product();
					product.setId(rs.getInt("id"));
					product.setName(rs.getString("name"));
					product.setPrice(rs.getInt("price"));
					product.setDescription(rs.getString("description"));
					product.setCategory(rs.getString("category"));
					productList.add(product);
				}

			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException sqlEx) {
						sqlEx.printStackTrace();
					}

					rs = null;
				}

				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException sqlEx) {
						sqlEx.printStackTrace();
					}

					stmt = null;
				}
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			return productList;
		}
		
		public Product getProduct(int id) {
			Product product = null;

			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

			Connection conn = null;

			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost/iteaweb?" + "user=root&password=");
			} catch (SQLException ex) {
				ex.printStackTrace();
			}

			PreparedStatement stmt = null;
			ResultSet rs = null;

			try {

				stmt = conn.prepareStatement(IDFORM);
				stmt.setInt(1, id);
				rs = stmt.executeQuery();
				if(rs.next()) {
					product = new Product();
					product.setId(rs.getInt("id"));
					product.setName(rs.getString("name"));
					product.setPrice(rs.getInt("price"));
					product.setDescription(rs.getString("description"));
					product.setCategory(rs.getString("category"));
				}

			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException sqlEx) {
						sqlEx.printStackTrace();
					}

					rs = null;
				}

				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException sqlEx) {
						sqlEx.printStackTrace();
					}

					stmt = null;
				}
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			return product;
		}
		
		public List<Product> getProductsCategory(String category) {
			List<Product> productList = new ArrayList<Product>();

			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

			Connection conn = null;

			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost/iteaweb?" + "user=root&password=");
			} catch (SQLException ex) {
				ex.printStackTrace();
			}

			PreparedStatement stmt = null;
			ResultSet rs = null;

			try {

				stmt = conn.prepareStatement(GET_CATEGORY);
				stmt.setString(1, category);
				rs = stmt.executeQuery();
				while(rs.next()) {
					Product product = new Product();
					product.setId(rs.getInt("id"));
					product.setName(rs.getString("name"));
					product.setPrice(rs.getInt("price"));
					product.setDescription(rs.getString("description"));
					product.setCategory(rs.getString("category"));
					productList.add(product);
				}

			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException sqlEx) {
						sqlEx.printStackTrace();
					}

					rs = null;
				}

				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException sqlEx) {
						sqlEx.printStackTrace();
					}

					stmt = null;
				}
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			return productList;
		}
		
		public static void main(String[] args) {
			System.out.println(new DBWorker().getProductsCategory("machines"));
		}
	 

}
