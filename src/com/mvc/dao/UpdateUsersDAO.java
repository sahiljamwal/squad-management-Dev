package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.DBConnectionBean;
import com.mvc.bean.UpdateUsersBean;
import com.mvc.util.DBConnection;

public class UpdateUsersDAO {

	private static Connection con = null;
	private static PreparedStatement pstmt = null;
	private static PreparedStatement pstmt1 = null;
	private static PreparedStatement pstmt2 = null;
	private static ResultSet rs = null;
	private static int rs1 = -1;
	private static int rs2 = -1;

	public static String runUpdate(UpdateUsersBean updBean) {

		String eid = updBean.getEid();
		float noOfDays = updBean.getNo_Of_Days();
		String leaveType = updBean.getLeaveType();
		String startDate = updBean.getStartDate();
		String endDate = updBean.getEndDate();
		String startTime = updBean.getStartTime();
		String endTime = updBean.getEndTime();
		String reason = updBean.getReason();
		String currentYear = updBean.getCurrentYear();
		float subtractResult = -1;
		String startDateToBeUpdated = null;
		String endDateToBeUpdated = null;
		float noOfDaysFinal = 0;
		float defaultQuota = 0;

		try {
			con = (DBConnectionBean.getConnectionObject() == null) ? DBConnection.getConnection()
					: DBConnectionBean.getConnectionObject();

			String query1 = "SELECT * FROM leavequota WHERE Eid=? AND Type_Of_Leave=? ";
			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, eid);
			pstmt.setString(2, leaveType);

			rs = pstmt.executeQuery();

			if (rs == null) {
				return "Invalid Eid";
			}

			while (rs.next()) {

				String currentYearDB = rs.getString("Start_Date");
				currentYearDB = currentYearDB.substring(0, 4);

				if (currentYearDB.equals(currentYear)) {
					subtractResult = (rs.getFloat("Number_of_Quota") - rs.getFloat("Default_Quota"));
					noOfDaysFinal = rs.getFloat("Default_Quota") + noOfDays;
					startDateToBeUpdated = rs.getString("Start_Date");
					endDateToBeUpdated = rs.getString("End_Date");
					defaultQuota = rs.getFloat("Number_of_Quota");

					break;
				}
			}

			if (rs != null && noOfDays <= subtractResult) {
				String query2 = "SELECT * FROM leavededuction WHERE Eid=? AND Type_Of_Leave=?";
				PreparedStatement pstmt4 = con.prepareStatement(query2);
				pstmt4.setString(1, eid);
				pstmt4.setString(2, leaveType);

				ResultSet rs4 = pstmt4.executeQuery();
				while (rs4.next()) {
					String startDateDB = rs4.getString("Start_Date");
					String endDateDB = rs4.getString("End_Date");

					if ((startDateDB.equals(startDate)) && (endDateDB.equals(endDate))) {
						return "Duplicate Record Found";
					}
				}

				String query3 = "INSERT INTO leavededuction VALUES(?,?,?,?,?,?,?,?)";
				pstmt1 = con.prepareStatement(query3);
				pstmt1.setString(1, eid);
				pstmt1.setString(2, leaveType);
				pstmt1.setString(3, startDate);
				pstmt1.setString(4, endDate);
				pstmt1.setString(5, startTime);
				pstmt1.setString(6, endTime);
				pstmt1.setFloat(7, noOfDays);
				pstmt1.setString(8, reason);

				rs1 = pstmt1.executeUpdate();

				String query4 = "UPDATE leavequota SET Default_Quota=? WHERE Eid=? AND Type_Of_Leave=? AND Start_Date=? AND End_Date=?";
				pstmt2 = con.prepareStatement(query4);
				pstmt2.setFloat(1, noOfDaysFinal);
				pstmt2.setString(2, eid);
				pstmt2.setString(3, leaveType);
				pstmt2.setString(4, startDateToBeUpdated);
				pstmt2.setString(5, endDateToBeUpdated);

				updBean.setRemaining_Leaves(defaultQuota - noOfDaysFinal);

				if (defaultQuota == noOfDaysFinal) {
					// SendMailLeaveExhausted.send(updBean);
				}

				rs2 = pstmt2.executeUpdate();

				if (rs1 >= 0 && rs2 >= 0) {
					if (updBean.getEmail() != null)
						// SendMailUpdate.send(updBean);
						return "Success";
				}
			} else {
				return "No Success";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "No Success";
	}
}
