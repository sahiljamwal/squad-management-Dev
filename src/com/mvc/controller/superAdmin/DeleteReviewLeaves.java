package com.mvc.controller.superAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.DeleteReviewBean;
import com.mvc.bean.ReviewLeavesBean;
import com.mvc.dao.DeleteReviewLeavesDAO;

@WebServlet(name = "RejectLeaveServlet", urlPatterns = { "/DeleteReview" })
public class DeleteReviewLeaves extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int target = Integer.parseInt(request.getParameter("counterValue"));
		String eid = request.getParameter("Eid" + target);
		String typeOfLeave = request.getParameter("Type_Of_Leave" + target);
		String startDate = request.getParameter("Start_Date" + target);
		String endDate = request.getParameter("End_Date" + target);

		DeleteReviewBean deleteBean = new DeleteReviewBean();
		deleteBean.setCount(target);
		deleteBean.setEid(eid);
		deleteBean.setLeaveType(typeOfLeave);
		deleteBean.setStartDate(startDate);
		deleteBean.setEndDate(endDate);

		String deleteResult = DeleteReviewLeavesDAO.doDelete(deleteBean);

		if (deleteResult.equals("Success")) {
			HttpSession session = request.getSession(false);
			session.setAttribute("ReviewResultSet", ReviewLeavesBean.getRs());

			RequestDispatcher rd = request.getRequestDispatcher("reviewLeavesResult.jsp");
			rd.forward(request, response);
		} else {
			HttpSession session = request.getSession(false);
			session.setAttribute("ReviewResultSet", ReviewLeavesBean.getRs());

			RequestDispatcher rd = request.getRequestDispatcher("reviewLeaves.jsp");
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
