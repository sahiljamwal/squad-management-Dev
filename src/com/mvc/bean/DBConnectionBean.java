package com.mvc.bean;

import java.sql.Connection;

public class DBConnectionBean {
	private static Connection connectionObject = null;

	public static Connection getConnectionObject() {
		return connectionObject;
	}

	public static void setConnectionObject(Connection connectionObject) {
		DBConnectionBean.connectionObject = connectionObject;
	}
}
