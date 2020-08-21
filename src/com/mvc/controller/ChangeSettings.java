package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.ChangeSettingsBean;
import com.mvc.dao.ChangeSettingsDAO;

@WebServlet(name = "ChangePassword", urlPatterns = { "/Change_Settings" })
public class ChangeSettings extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String oldPassword = request.getParameter("Password");
		String newPassword = request.getParameter("Newpassword");

		ChangeSettingsBean changeSettingsBean = new ChangeSettingsBean();

		HttpSession session = request.getSession(false);
		String eid = (String) session.getAttribute("eid");
		changeSettingsBean.setEid(eid);
		changeSettingsBean.setPassword(oldPassword);
		changeSettingsBean.setNewpassword(newPassword);

		ChangeSettingsDAO cg = new ChangeSettingsDAO();
		String userValidate = cg.validate(changeSettingsBean);

		if (userValidate.equals("TEACHING") || userValidate.equals("NON-TEACHING") || userValidate.equals("ADMIN")
				|| userValidate.equals("SUPER-ADMIN")) {
			request.setAttribute("successMessageChange", "Password Changed Succesfully");
			RequestDispatcher rd = request.getRequestDispatcher("/changeSettings.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("errorMessageChange", "Couldn't update your record .Please check your data.");
			RequestDispatcher rd = request.getRequestDispatcher("/changeSettings.jsp");
			rd.forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}
}
