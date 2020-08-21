package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.DBConnectionBean;
import com.mvc.bean.ViewDetailsBean;
import com.mvc.util.DBConnection;

public class ViewDetailsDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public String viewDetails(ViewDetailsBean vdb) throws SQLException {

		String eid = vdb.getEid();
		String startDate = vdb.getStartDate();
		String endDate = vdb.getEndDate();

		con = (DBConnectionBean.getConnectionObject() == null) ? DBConnection.getConnection()
				: DBConnectionBean.getConnectionObject();
		String query1 = "SELECT * FROM leavededuction WHERE Eid=? AND Start_Date BETWEEN ? AND ?";

		pstmt = con.prepareStatement(query1);
		pstmt.setString(1, eid);
		pstmt.setString(2, startDate);
		pstmt.setString(3, endDate);
		rs = pstmt.executeQuery();

		if (rs != null) {
			ViewDetailsBean.setResultSet(rs);
			return "Successful";
		} else {
			return "Not Successful";
		}
	}
}
