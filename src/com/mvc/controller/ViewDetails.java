package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.ProfileBean;
import com.mvc.bean.ViewDetailsBean;
import com.mvc.dao.ViewDetailsDAO;

@WebServlet(name = "ViewDetailsServlet", urlPatterns = { "/View_Leave_Details" })
public class ViewDetails extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("static-access")
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String Eid = ProfileBean.getEid();
			String StartDate = request.getParameter("StartDate");
			String EndDate = request.getParameter("EndDate");

			ViewDetailsBean viewDetailsBean = new ViewDetailsBean();
			viewDetailsBean.setEid(Eid);
			viewDetailsBean.setStartDate(StartDate);
			viewDetailsBean.setEndDate(EndDate);

			ViewDetailsDAO viewDetailsDAO = new ViewDetailsDAO();

			String msg = viewDetailsDAO.viewDetails(viewDetailsBean);

			if (msg.equals("Successful")) {
				HttpSession session = request.getSession(false);
				session.setAttribute("ResultSet", viewDetailsBean.getResultSet());

				RequestDispatcher rd = request.getRequestDispatcher("/viewDetails.jsp");
				rd.forward(request, response);
			} else {
				HttpSession session = request.getSession(false);
				session.setAttribute("ResultSet", viewDetailsBean.getResultSet());

				RequestDispatcher rd = request.getRequestDispatcher("/viewDetails.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
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
