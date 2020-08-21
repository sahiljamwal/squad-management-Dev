package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.bean.DBConnectionBean;
import com.mvc.bean.DeleteUserBean;
import com.mvc.util.DBConnection;

public class DeleteUserReviewDAO {

	private static Connection con = null;
	private static PreparedStatement pstmt = null;
	private static int rs = -1;

	public static String doDelete(DeleteUserBean dub) {

		String eid = dub.getEid();
		String leaveType = dub.getLeaveType();
		String startDate = dub.getStartDate();
		String endDate = dub.getEndDate();

		try {
			con = (DBConnectionBean.getConnectionObject() == null) ? DBConnection.getConnection()
					: DBConnectionBean.getConnectionObject();
			String query = "DELETE FROM leaveReview WHERE Eid=? AND Type_Of_Leave=? AND Start_Date=? AND End_Date=?";

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, eid);
			pstmt.setString(2, leaveType);
			pstmt.setString(3, startDate);
			pstmt.setString(4, endDate);

			rs = pstmt.executeUpdate();

			if (rs >= 0)
				return "Deleted Successfully";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Please check your data again";
	}
}
