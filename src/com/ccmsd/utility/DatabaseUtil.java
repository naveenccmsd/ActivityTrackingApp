package com.ccmsd.utility;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseUtil {

	private static Connection connection = null;
	public static Connection getConnection() throws ClassNotFoundException,
			IOException, SQLException {
		final Properties prop = new Properties();
		final InputStream inputStream = DatabaseUtil.class.getClassLoader().getResourceAsStream("Database.properties");
		prop.load(inputStream);
		final String driver = prop.getProperty("driver");
		final String url = prop.getProperty("url");
		final String user = prop.getProperty("user");
		final String password = prop.getProperty("pass");
		Class.forName(driver);
		connection = DriverManager.getConnection(url, user, password);
		return connection;
	}
}
