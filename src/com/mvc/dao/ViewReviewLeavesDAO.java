package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.bean.DBConnectionBean;
import com.mvc.bean.ReviewLeavesBean;
import com.mvc.util.DBConnection;

public class ViewReviewLeavesDAO {

	private static Connection con = null;
	private static PreparedStatement pstmt = null;

	public static String fetch_data() {
		String date = ReviewLeavesBean.getCurrentDate();

		try {
			con = (DBConnectionBean.getConnectionObject() == null) ? DBConnection.getConnection()
					: DBConnectionBean.getConnectionObject();
			String query1 = "SELECT * FROM leavereview WHERE Date=? AND Leave_Status=? ";
			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, date);
			pstmt.setInt(2, 0);
			ReviewLeavesBean.setRs(pstmt.executeQuery());

			if (ReviewLeavesBean.getRs() != null) {
				return "Success";
			} else {
				return "No Success";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "No Success";
	}
}
