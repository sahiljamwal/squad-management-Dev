package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.DBConnectionBean;
import com.mvc.bean.UpdateUsersBean;
import com.mvc.util.DBConnection;

public class UpdateUsersReviewDAO {

	private static Connection con = null;
	private static PreparedStatement pstmt = null;
	private static PreparedStatement pstmt1 = null;
	private static PreparedStatement pstmt2 = null;
	private static ResultSet rs = null;
	private static ResultSet rs1 = null;
	private static int rs2 = -1;

	@SuppressWarnings("unused")
	public static String runUpdate(UpdateUsersBean updBean) {
		String eid = updBean.getEid();
		String leaveType = updBean.getLeaveType();
		float noOfDays = updBean.getNo_Of_Days();
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
		String currentDate = updBean.getCurrentDate();
		String leaveProvided = null;
		if (updBean.isLeaveProvided() == true)
			leaveProvided = "Yes";
		else
			leaveProvided = "No";

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
				pstmt1 = con.prepareStatement(query2);
				pstmt1.setString(1, eid);
				pstmt1.setString(2, leaveType);
				rs1 = pstmt1.executeQuery();

				while (rs1.next()) {
					String startDateDB = rs1.getString("Start_Date");
					String endDateDB = rs1.getString("End_Date");

					if ((startDateDB.equals(startDate)) && (endDateDB.equals(endDate))) {
						return "Duplicate Record Found";
					}
				}
			}

			String query3 = "SELECT * FROM leavereview WHERE Eid=? AND Type_Of_Leave=?";
			PreparedStatement pstmt3 = con.prepareStatement(query3);
			pstmt3.setString(1, updBean.getEid());
			pstmt3.setString(2, updBean.getLeaveType());
			ResultSet rs3 = pstmt3.executeQuery();

			if (rs3 != null) {
				while (rs3.next()) {
					String eidDB = rs3.getString("Eid");
					String leaveTypeDB = rs3.getString("Type_Of_Leave");

					if (eidDB.equals(eid) && leaveType.equals(leaveTypeDB)) {
						return "Already Pending";
					}
				}
			}

			String query4 = "INSERT INTO leavereview VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt2 = con.prepareStatement(query4);
			pstmt2.setString(1, eid);
			pstmt2.setString(2, leaveType);
			pstmt2.setString(3, startDate);
			pstmt2.setString(4, endDate);
			pstmt2.setString(5, startTime);
			pstmt2.setString(6, endTime);
			pstmt2.setFloat(7, noOfDays);
			pstmt2.setString(8, reason);
			pstmt2.setFloat(9, noOfDaysFinal);
			pstmt2.setString(10, "0");
			pstmt2.setString(11, startDateToBeUpdated);
			pstmt2.setString(12, endDateToBeUpdated);
			pstmt2.setString(13, currentDate);
			pstmt2.setString(14, leaveProvided);
			rs2 = pstmt2.executeUpdate();

			if (rs2 >= 0) {
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
