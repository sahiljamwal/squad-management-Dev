package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.AddNewEmployeeBean;
import com.mvc.bean.DBConnectionBean;
import com.mvc.util.DBConnection;

public class AddNewEmployeeDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	int rs = -1;
	ResultSet r;
	int rs1 = -1;
	int rs2 = -1;

	@SuppressWarnings("unused")
	public String validate(AddNewEmployeeBean addNewEmployeeBean) {
		String fName = addNewEmployeeBean.getFname();
		String lName = addNewEmployeeBean.getLname();
		String email = addNewEmployeeBean.getEmail();
		String password = PasswordBcrypt.hashPassword(addNewEmployeeBean.getPassword());
		String eid = addNewEmployeeBean.getEid();
		String phoneNo = addNewEmployeeBean.getPhone_no();
		String branch = addNewEmployeeBean.getBranch();
		int casualLeave = addNewEmployeeBean.getCasualLeave();
		int medicalLeave = addNewEmployeeBean.getMedicalLeave();
		int specialCasualLeave = addNewEmployeeBean.getSpecialCasualLeave();
		int onDutyLeaves = addNewEmployeeBean.getOnDutyLeave();
		int elLeaves = addNewEmployeeBean.getElLeave();
		String role = addNewEmployeeBean.getRole();
		String designation = addNewEmployeeBean.getDesignation();
		String DOJ = addNewEmployeeBean.getDOJ();

		try {

			
			con = (DBConnectionBean.getConnectionObject() == null) ? DBConnection.getConnection()
					: DBConnectionBean.getConnectionObject();

			String query1 = "INSERT INTO msitemployeedetails VALUES(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(query1);

			pstmt.setString(1, fName);
			pstmt.setString(2, lName);
			pstmt.setString(3, eid);
			pstmt.setString(4, email);
			pstmt.setString(5, branch);
			pstmt.setString(6, designation);
			pstmt.setString(7, role);
			pstmt.setString(8, phoneNo);
			pstmt.setString(9, DOJ);

			rs = pstmt.executeUpdate();

			String query2 = "INSERT INTO msitlogin VALUES(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(query2);

			pstmt.setString(1, fName);
			pstmt.setString(2, lName);
			pstmt.setString(3, eid);
			pstmt.setString(4, email);
			pstmt.setString(5, password);
			pstmt.setString(6, role);

			rs1 = pstmt.executeUpdate();
			if (role.equals("TEACHING")) {
				String msg2 = "INSERT INTO leavequota VALUES (?,?,?,?,?,?),(?,?,?,?,?,?),(?,?,?,?,?,?),(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(msg2);
				pstmt.setString(1, addNewEmployeeBean.getEid());
				pstmt.setString(2, "CL");
				pstmt.setString(3, addNewEmployeeBean.getDOJ());
				pstmt.setString(4, "2019-12-31");
				pstmt.setInt(5, addNewEmployeeBean.getCasualLeave());
				pstmt.setInt(6, 0);

				pstmt.setString(7, addNewEmployeeBean.getEid());
				pstmt.setString(8, "ML");
				pstmt.setString(9, addNewEmployeeBean.getDOJ());
				pstmt.setString(10, "9999-12-31");
				pstmt.setInt(11, addNewEmployeeBean.getMedicalLeave());
				pstmt.setInt(12, 0);

				pstmt.setString(13, addNewEmployeeBean.getEid());
				pstmt.setString(14, "SCL");
				pstmt.setString(15, addNewEmployeeBean.getDOJ());
				pstmt.setString(16, "2019-12-31");
				pstmt.setInt(17, addNewEmployeeBean.getSpecialCasualLeave());
				pstmt.setInt(18, 0);

				pstmt.setString(19, addNewEmployeeBean.getEid());
				pstmt.setString(20, "OD");
				pstmt.setString(21, addNewEmployeeBean.getDOJ());
				pstmt.setString(22, "2019-12-31");
				pstmt.setInt(23, addNewEmployeeBean.getOnDutyLeave());
				pstmt.setInt(24, 0);

				rs2 = pstmt.executeUpdate();
			} else if (role.equals("NON-TEACHING") || role.equals("ADMIN")) {
				String msg2 = "INSERT INTO leavequota VALUES (?,?,?,?,?,?),(?,?,?,?,?,?),(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(msg2);
				pstmt.setString(1, addNewEmployeeBean.getEid());
				pstmt.setString(2, "CL");
				pstmt.setString(3, addNewEmployeeBean.getDOJ());
				pstmt.setString(4, "2019-12-31");
				pstmt.setInt(5, addNewEmployeeBean.getCasualLeave());
				pstmt.setInt(6, 0);

				pstmt.setString(7, addNewEmployeeBean.getEid());
				pstmt.setString(8, "ML");
				pstmt.setString(9, addNewEmployeeBean.getDOJ());
				pstmt.setString(10, "9999-12-31");
				pstmt.setInt(11, addNewEmployeeBean.getMedicalLeave());
				pstmt.setInt(12, 0);

				pstmt.setString(13, addNewEmployeeBean.getEid());
				pstmt.setString(14, "EL");
				pstmt.setString(15, addNewEmployeeBean.getDOJ());
				pstmt.setString(16, "2019-12-31");
				pstmt.setInt(17, addNewEmployeeBean.getElLeave());
				pstmt.setInt(18, 0);

				rs2 = pstmt.executeUpdate();
			}

			if (rs > 0 && rs1 > 0 && rs2 > 0) {
				return "Successfully Added New User";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "There was some error connecting to Database.";
		}
		return "There was some error connecting to Database.";
	}
}
