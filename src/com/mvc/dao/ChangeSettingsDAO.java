package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.ChangeSettingsBean;
import com.mvc.bean.DBConnectionBean;
import com.mvc.util.DBConnection;

public class ChangeSettingsDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	int rs1 = -1;
	ResultSet rs2 = null;

	public String validate(ChangeSettingsBean changeSettingsBean) {
		String Eid = changeSettingsBean.getEid();
		String newPassword = changeSettingsBean.getNewpassword();

		try {
			con = (DBConnectionBean.getConnectionObject() == null) ? DBConnection.getConnection()
					: DBConnectionBean.getConnectionObject();
			String query = "UPDATE msitlogin SET Password=? WHERE Eid=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, PasswordBcrypt.hashPassword(newPassword));
			pstmt.setString(2, Eid);
			rs1 = pstmt.executeUpdate();

			if (rs1 > 0) {
				query = "SELECT Role FROM msitlogin WHERE Eid=?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, Eid);
				rs2 = pstmt.executeQuery();

				while (rs2.next()) {
					String role = rs2.getString("Role");
					return role;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "There was some error connecting to DB.";
		}
		return "There was some error connecting to DB.";

	}

}
