package com.mvc.controller.superAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.DeleteUserBean;
import com.mvc.dao.DeleteUserLeavesSuperAdminDAO;

@WebServlet(name = "DeleteUserLeaveServlet", urlPatterns = { "/DeleteUserLeavesSA_Servlet" })
public class DeleteUserLeavesSuperAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unused")
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DeleteUserBean deleteUserBean = new DeleteUserBean();

		String eid = request.getParameter("Eid");

		String role = request.getParameter("Role");
		deleteUserBean.setEid(eid);

		if (role.equals("ADMIN")) {
			String leaveType = request.getParameter("type_of_leave_ADMIN");
			deleteUserBean.setLeaveType(leaveType);
		} else if (role.equals("TEACHING")) {
			String leaveType = request.getParameter("type_of_leave_TEACHING");
			deleteUserBean.setLeaveType(leaveType);
		} else {
			String leaveType = request.getParameter("type_of_leave_NON-TEACHING");
			deleteUserBean.setLeaveType(leaveType);
		}

		String duration = request.getParameter("duration");
		deleteUserBean.setDuration(duration);

		if (duration.equals("FULL_DAY")) {
			String startDate = request.getParameter("start_date_FULLDAY");
			String endDate = request.getParameter("end_date_FULLDAY");

			deleteUserBean.setStartDate(startDate);
			deleteUserBean.setEndDate(endDate);
		} else {
			String startDate = request.getParameter("start_date_HALFDAY");

			deleteUserBean.setStartDate(startDate);
			deleteUserBean.setEndDate(startDate);
		}

		String doUpdateStatus = DeleteUserLeavesSuperAdminDAO.deleteUserLeave(deleteUserBean);

		if (doUpdateStatus.equals("Deleted Successfully")) {
			HttpSession session = request.getSession(false);
			request.setAttribute("successMessageDeleteSA", "Leaves Deleted Successfully.");

			RequestDispatcher rd = request.getRequestDispatcher("/deleteUserLeavesSA.jsp");
			rd.forward(request, response);
		} else if (doUpdateStatus.equals("Please check your data again")) {
			HttpSession session = request.getSession(false);
			request.setAttribute("errorMessageDeleteSA", "Please check your data again.");

			RequestDispatcher rd = request.getRequestDispatcher("/deleteUserLeavesSA.jsp");
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
