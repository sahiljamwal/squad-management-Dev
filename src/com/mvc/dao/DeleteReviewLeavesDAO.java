package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.bean.DBConnectionBean;
import com.mvc.bean.DeleteReviewBean;
import com.mvc.bean.ReviewLeavesBean;
import com.mvc.util.DBConnection;

public class DeleteReviewLeavesDAO {

	private static Connection con = null;
	private static PreparedStatement pstmt = null;
	private static PreparedStatement pstmt1 = null;
	private static int res = -1;

	public static String doDelete(DeleteReviewBean deleteBean) {

		String eid = deleteBean.getEid();
		String leaveType = deleteBean.getLeaveType();
		String startDate = deleteBean.getStartDate();
		String endDate = deleteBean.getEndDate();

		try {
			con = (DBConnectionBean.getConnectionObject() == null) ? DBConnection.getConnection()
					: DBConnectionBean.getConnectionObject();

			String query1 = "DELETE FROM leaveReview WHERE Eid=? AND Type_Of_Leave=? AND Start_Date=? AND End_Date=?";
			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, eid);
			pstmt.setString(2, leaveType);
			pstmt.setString(3, startDate);
			pstmt.setString(4, endDate);

			res = pstmt.executeUpdate();

			if (res >= 0) {
				String query2 = "SELECT * FROM leaveReview WHERE Date=? AND Leave_Status=? ";
				pstmt1 = con.prepareStatement(query2);
				pstmt1.setString(1, ReviewLeavesBean.getCurrentDate());
				pstmt1.setInt(2, 0);

				ReviewLeavesBean.setRs(pstmt1.executeQuery());

				if (ReviewLeavesBean.getRs() != null)
					return "Success";
				else
					return "NoSuccess";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "NoSuccess";
	}
}
