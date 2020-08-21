package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mvc.bean.DBConnectionBean;

public class DBConnection {

	private static Connection con = null;

	public static Connection getConnection() {
		try {

			String dbDriver = System.getenv("dbDriver");
			String dbURL = System.getenv("dbURLProd");
			String dbUserName = System.getenv("dbUserNameProd");
			String dbPassword = System.getenv("dbPasswordProd");

			Class.forName(dbDriver);
			con = DriverManager.getConnection(dbURL, dbUserName, dbPassword);
			DBConnectionBean.setConnectionObject(con);

			System.out.println("Connection established" + con);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}
}
