package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
	private final String url = "jdbc:sqlserver://localhost:1433;databaseName=ShoppingDB;encrypt=false";
	private final String userID = "sa";
	private final String password = "sa";
	
	public Connection getConnection() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
	}


	public static void main(String[] args) {
		DBContext db = new DBContext();
		Connection conn = null;
		try {
			conn = db.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println(conn);
	}

}
