package com.mvc.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.DBConnectionBean;
import com.mvc.bean.ForgetPassBean;
import com.mvc.util.DBConnection;
import com.mvc.util.SendMailSendGrid;

public class ForgetPassDAO {

	static Connection con = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs;

	@SuppressWarnings("unused")
	public static String reset(ForgetPassBean forgetPassBean) throws IOException {

		String email = forgetPassBean.getEmail();

		String query1 = "SELECT Email FROM msitlogin WHERE Email=?";
		String query2 = "UPDATE msitlogin SET Password=? WHERE Email=?";

		try {
			con = (DBConnectionBean.getConnectionObject() == null) ? DBConnection.getConnection()
					: DBConnectionBean.getConnectionObject();
			pstmt = con.prepareStatement(query1);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String newGeneratedPassword = GeneratePassword.generate();
				forgetPassBean.setNewpass(newGeneratedPassword);
				pstmt = con.prepareStatement(query2);
				pstmt.setString(1, PasswordBcrypt.hashPassword(forgetPassBean.getNewpass()));
				pstmt.setString(2, email);
				int res = pstmt.executeUpdate();
				SendMailSendGrid.sendMailPassReset(forgetPassBean);

				return "Successfully Changed Password.";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "There was some error contacting Database.";
		}
		return "No Such Email Found.";
	}
}
