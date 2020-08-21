package com.mvc.controller.superAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.ReviewLeavesBean;
import com.mvc.dao.ViewReviewLeavesDAO;

@WebServlet(name = "ViewReviewServlet", urlPatterns = { "/ViewReview" })
public class ViewReviewLeaves extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ReviewLeavesBean.setCurrentDate(request.getParameter("currentDate"));

		String fetchResult = ViewReviewLeavesDAO.fetch_data();

		if (fetchResult.equals("Success")) {
			HttpSession session = request.getSession(false);
			session.setAttribute("ReviewResultSet", ReviewLeavesBean.getRs());

			RequestDispatcher rd = request.getRequestDispatcher("reviewLeavesResult.jsp");
			rd.forward(request, response);
		} else {
			HttpSession session = request.getSession(false);
			session.setAttribute("ReviewResultSet", ReviewLeavesBean.getRs());
			request.setAttribute("errorMessageNoData", "No data found for this date on server.");

			RequestDispatcher rd = request.getRequestDispatcher("reviewLeaves.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

}
