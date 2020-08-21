package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.DBConnectionBean;
import com.mvc.bean.DeleteUserBean;
import com.mvc.util.DBConnection;

public class DeleteUserLeavesSuperAdminDAO {
	private static Connection con = null;
	private static PreparedStatement pstmt = null;
	private static PreparedStatement pstmt1 = null;
	private static PreparedStatement pstmt2 = null;
	private static PreparedStatement pstmt3 = null;
	private static ResultSet rs = null;
	private static int rs1 = -1;
	private static int rs2 = -1;
	private static ResultSet rs3 = null;

	public static String deleteUserLeave(DeleteUserBean DeleteUserBean) {

		String eid = DeleteUserBean.getEid();

		String leaveType = DeleteUserBean.getLeaveType();
		String startDate = DeleteUserBean.getStartDate();
		String endDate = DeleteUserBean.getEndDate();

		try {
			con = (DBConnectionBean.getConnectionObject() == null) ? DBConnection.getConnection()
					: DBConnectionBean.getConnectionObject();

			String query1 = "SELECT * FROM leavededuction WHERE Eid=? AND Type_Of_Leave=? AND Start_Date= ? AND End_Date=?";
			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, eid);
			pstmt.setString(2, leaveType);
			pstmt.setString(3, startDate);
			pstmt.setString(4, endDate);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				DeleteUserBean.setNoOfDays(rs.getFloat("No_Of_Days"));
				String query2 = "DELETE FROM leavededuction WHERE Eid=? AND Type_Of_Leave=? AND Start_Date= ? AND End_Date=?";
				pstmt1 = con.prepareStatement(query2);
				pstmt1.setString(1, eid);
				pstmt1.setString(2, leaveType);
				pstmt1.setString(3, startDate);
				pstmt1.setString(4, endDate);

				rs1 = pstmt1.executeUpdate();
				if (rs1 > 0) {

					String query3 = "SELECT * FROM leavequota WHERE Eid=? AND Type_Of_Leave=?";
					pstmt2 = con.prepareStatement(query3);
					pstmt2.setString(1, eid);
					pstmt2.setString(2, leaveType);

					rs3 = pstmt2.executeQuery();
					if (rs3.next()) {
						DeleteUserBean.setDefaultQuota(rs3.getFloat("Default_Quota"));
						float newDefaultQuota = DeleteUserBean.getDefaultQuota() - DeleteUserBean.getNoOfDays();

						String query4 = "UPDATE leavequota SET Default_Quota=? WHERE Eid=? AND Type_Of_Leave=?";
						pstmt3 = con.prepareStatement(query4);
						pstmt3.setFloat(1, newDefaultQuota);
						pstmt3.setString(2, eid);
						pstmt3.setString(3, leaveType);

						rs2 = pstmt3.executeUpdate();
						System.out.print(newDefaultQuota);
						if (rs2 > 0) {
							return "Deleted Successfully";
						} else {
							return "Please check your data again";
						}
					}
				}
			} else {
				return "Please check your data again";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Please check your data again";
	}
}
