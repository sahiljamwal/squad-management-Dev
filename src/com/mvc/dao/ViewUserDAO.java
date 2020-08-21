package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.DBConnectionBean;
import com.mvc.bean.ViewUserBean;
import com.mvc.util.DBConnection;

public class ViewUserDAO {
	Connection con = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;

	public String validate(ViewUserBean viewUserBean) {
		String eid = viewUserBean.getEid();
		try {
			con = (DBConnectionBean.getConnectionObject() == null) ? DBConnection.getConnection()
					: DBConnectionBean.getConnectionObject();
			String query1 = "SELECT Role FROM msitemployeedetails WHERE Eid=?";
			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, eid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				viewUserBean.setRole(rs.getString("Role"));

				System.out.print(viewUserBean.getRole());

				if (viewUserBean.getRole().equals("TEACHING")) {

					String query2 = "SELECT Email,Lname,Fname,DOJ,Designation,Branch,Role FROM msitemployeedetails WHERE Eid=?";
					PreparedStatement pstmt1 = con.prepareStatement(query2);
					pstmt1.setString(1, eid);

					String query3 = "SELECT Type_Of_Leave,Number_of_Quota,Default_Quota FROM leavequota WHERE Eid=?";
					PreparedStatement pstmt2 = con.prepareStatement(query3);
					pstmt2.setString(1, eid);

					rs1 = pstmt1.executeQuery();
					rs2 = pstmt2.executeQuery();
					while (rs1.next()) {
						viewUserBean.setEmail(rs1.getString("Email"));
						viewUserBean.setLname(rs1.getString("Lname"));
						viewUserBean.setFname(rs1.getString("Fname"));
						viewUserBean.setBranch(rs1.getString("Branch"));
						viewUserBean.setRole(rs1.getString("Role"));
						viewUserBean.setDOJ(rs1.getString("DOJ"));
						viewUserBean.setDesignation(rs1.getString("Designation"));
					}

					while (rs2.next()) {
						if (rs2.getString("Type_Of_Leave").equals("ML")) {
							viewUserBean
									.setMedicalLeave(rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
						} else if (rs2.getString("Type_Of_Leave").equals("CL")) {
							viewUserBean
									.setCasualLeave(rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
						} else if (rs2.getString("Type_Of_Leave").equals("SCL")) {
							viewUserBean.setSpecialCasualLeave(
									rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
						} else if (rs2.getString("Type_Of_Leave").equals("OD")) {
							viewUserBean
									.setOnDutyLeave(rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
						}
					}
					return viewUserBean.getRole();
				} else if (viewUserBean.getRole().equals("NON-TEACHING") || viewUserBean.getRole().equals("ADMIN")) {

					String query2 = "SELECT Email,Lname,Fname,DOJ,Designation,Role FROM msitemployeedetails WHERE Eid=?";
					PreparedStatement pstmt1 = con.prepareStatement(query2);
					pstmt1.setString(1, eid);

					String query3 = "SELECT Type_Of_Leave,Number_of_Quota,Default_Quota FROM leavequota WHERE Eid=?";
					PreparedStatement pstmt2 = con.prepareStatement(query3);
					pstmt2.setString(1, eid);
					rs1 = pstmt1.executeQuery();
					rs2 = pstmt2.executeQuery();

					while (rs1.next()) {
						viewUserBean.setEmail(rs1.getString("Email"));
						viewUserBean.setLname(rs1.getString("Lname"));
						viewUserBean.setFname(rs1.getString("Fname"));
						viewUserBean.setRole(rs1.getString("Role"));
						viewUserBean.setDOJ(rs1.getString("DOJ"));
						viewUserBean.setDesignation(rs1.getString("Designation"));
					}
					while (rs2.next()) {
						if (rs2.getString("Type_Of_Leave").equals("ML")) {
							viewUserBean
									.setMedicalLeave(rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
						} else if (rs2.getString("Type_Of_Leave").equals("CL")) {
							viewUserBean
									.setCasualLeave(rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
						} else if (rs2.getString("Type_Of_Leave").equals("EL")) {
							viewUserBean.setEL(rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
						}
					}
					return viewUserBean.getRole();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Invalid User Credentials.";
	}
}
