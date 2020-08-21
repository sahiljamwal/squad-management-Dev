package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.DBConnectionBean;
import com.mvc.bean.LoginBean;
import com.mvc.bean.ProfileBean;
import com.mvc.util.DBConnection;

public class LoginDAO {

	Connection con = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;

	@SuppressWarnings("static-access")
	public String validate(LoginBean loginbean) {
		String eid = loginbean.getEid();
		String passwordFromUser = loginbean.getPassword();
		ProfileBean profileBean = new ProfileBean();
		profileBean.setEid(eid);

		try {
			con = (DBConnectionBean.getConnectionObject() == null) ? DBConnection.getConnection()
					: DBConnectionBean.getConnectionObject();
			pstmt = con.prepareStatement("SELECT Eid,Password,Role FROM msitlogin WHERE Eid = ?");
			pstmt.setString(1, eid);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String passwordHashFromDB = rs.getString("Password");
				if (PasswordBcrypt.checkPassword(passwordFromUser, passwordHashFromDB)) {
					String role = rs.getString("Role");
					profileBean.setRole("role");
					if (role.equals("TEACHING")) {
						PreparedStatement pstmt1 = con.prepareStatement(
								"SELECT Email,Lname,Fname,DOJ,Designation,Branch,Role,Phone_No FROM msitemployeedetails WHERE Eid=?");
						pstmt1.setString(1, eid);
						PreparedStatement pstmt2 = con.prepareStatement(
								"SELECT Type_Of_Leave,Number_of_Quota,Default_Quota FROM leavequota WHERE Eid=?");
						pstmt2.setString(1, eid);

						rs1 = pstmt1.executeQuery();
						rs2 = pstmt2.executeQuery();
						while (rs1.next()) {
							profileBean.setEmail(rs1.getString("Email"));
							profileBean.setLname(rs1.getString("Lname"));
							profileBean.setFname(rs1.getString("Fname"));
							profileBean.setBranch(rs1.getString("Branch"));
							profileBean.setRole(rs1.getString("Role"));
							profileBean.setDOJ(rs1.getString("DOJ"));
							profileBean.setDesignation(rs1.getString("Designation"));
							ProfileBean.setPhone_No(rs1.getString("Phone_No"));
						}
						while (rs2.next()) {
							if (rs2.getString("Type_Of_Leave").equals("ML")) {
								profileBean.setTotalMedicalLeave(rs2.getFloat("Number_of_Quota"));
								profileBean.setRemainingMedicalLeave(
										rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
							} else if (rs2.getString("Type_Of_Leave").equals("CL")) {
								profileBean.setTotalCasualLeave(rs2.getFloat("Number_of_Quota"));
								profileBean.setRemainingCasualLeave(
										rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
							} else if (rs2.getString("Type_Of_Leave").equals("SCL")) {
								profileBean.setTotalSpecialCasualLeave(rs2.getFloat("Number_of_Quota"));
								profileBean.setRemainingSpecialCasualLeave(
										rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
							} else if (rs2.getString("Type_Of_Leave").equals("OD")) {
								profileBean.setTotalOnDutyLeave(rs2.getFloat("Number_of_Quota"));
								profileBean.setRemainingOnDutyLeave(
										rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
							}
						}
						return role;
					} else if (role.equals("NON-TEACHING")) {
						PreparedStatement pstmt1 = con.prepareStatement(
								"SELECT Email,Lname,Fname,DOJ,Designation,Role,Phone_No FROM msitemployeedetails WHERE Eid=?");
						pstmt1.setString(1, eid);
						PreparedStatement pstmt2 = con.prepareStatement(
								"SELECT Type_Of_Leave,Number_of_Quota,Default_Quota FROM leavequota WHERE Eid=?");
						pstmt2.setString(1, eid);

						rs1 = pstmt1.executeQuery();
						rs2 = pstmt2.executeQuery();
						while (rs1.next()) {
							profileBean.setEmail(rs1.getString("Email"));
							profileBean.setLname(rs1.getString("Lname"));
							profileBean.setFname(rs1.getString("Fname"));
							profileBean.setRole(rs1.getString("Role"));
							profileBean.setDOJ(rs1.getString("DOJ"));
							profileBean.setDesignation(rs1.getString("Designation"));
							profileBean.setPhone_No(rs1.getString("Phone_No"));
						}
						while (rs2.next()) {
							if (rs2.getString("Type_Of_Leave").equals("ML")) {
								profileBean.setTotalMedicalLeave(rs2.getFloat("Number_of_Quota"));
								profileBean.setRemainingMedicalLeave(
										rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
							} else if (rs2.getString("Type_Of_Leave").equals("CL")) {
								profileBean.setTotalCasualLeave(rs2.getFloat("Number_of_Quota"));
								profileBean.setRemainingCasualLeave(
										rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
							} else if (rs2.getString("Type_Of_Leave").equals("EL")) {
								profileBean.setTotalEL(rs2.getFloat("Number_of_Quota"));
								profileBean.setRemainingEL(
										rs2.getFloat("Number_of_Quota") - rs2.getFloat("Default_Quota"));
							}
						}
						return role;
					} else if (role.equals("ADMIN")) {
						return role;
					} else if (role.equals("SUPER-ADMIN")) {
						return role;
					}
				} else {
					return "Invalid User Credentials.";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "User Not Found.";
	}
}
