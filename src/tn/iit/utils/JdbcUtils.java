package tn.iit.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JdbcUtils {

	private static PreparedStatement preparedStatement;
	private static Statement statement;
	private static Connection connection;

	static {
		try {

			Class c = Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/gestens", "root", "");
			statement = connection.createStatement();
		} catch (SQLException ex) {
			Logger.getLogger(JdbcUtils.class.getName()).log(Level.SEVERE, null, ex);
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(JdbcUtils.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	public static Statement getStatement() {
		return statement;
	}
	
	public static PreparedStatement getPreparedStatement() {
		return preparedStatement;
	}
	
	public static Connection getConnection() {
		return connection;
	}


}