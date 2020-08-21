package com.mvc.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.ViewUserBean;
import com.mvc.dao.ViewUserDAO;

@WebServlet(name = "ViewUserServlet", urlPatterns = { "/View_User" })
public class ViewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unused")
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String eid = request.getParameter("Eid");

		ViewUserBean viewUserBean = new ViewUserBean();

		viewUserBean.setEid(eid);

		ViewUserDAO viewUserDAO = new ViewUserDAO();
		String userValidate = viewUserDAO.validate(viewUserBean);
		System.out.println(userValidate);

		if (userValidate.equals("TEACHING")) {
			HttpSession session = request.getSession();
			session.setAttribute("email", viewUserBean.getEmail());
			session.setAttribute("fname", viewUserBean.getFname());
			session.setAttribute("lname", viewUserBean.getLname());
			session.setAttribute("role", viewUserBean.getRole());
			session.setAttribute("branch", viewUserBean.getBranch());
			session.setAttribute("eid", viewUserBean.getEid());
			session.setAttribute("Designation", viewUserBean.getDesignation());
			session.setAttribute("DOJ", viewUserBean.getDOJ());
			session.setAttribute("casualLeave", viewUserBean.getCasualLeave());
			session.setAttribute("specialCasualLeave", viewUserBean.getSpecialCasualLeave());
			session.setAttribute("medicalLeave", viewUserBean.getMedicalLeave());
			session.setAttribute("onDutyLeave", viewUserBean.getOnDutyLeave());
			RequestDispatcher rd = request.getRequestDispatcher("/viewUserResult.jsp");
			rd.forward(request, response);
		}

		else if (userValidate.equals("NON-TEACHING") || userValidate.equals("ADMIN")) {
			HttpSession session = request.getSession();
			session.setAttribute("email", viewUserBean.getEmail());
			session.setAttribute("fname", viewUserBean.getFname());
			session.setAttribute("lname", viewUserBean.getLname());
			session.setAttribute("role", viewUserBean.getRole());
			session.setAttribute("eid", viewUserBean.getEid());
			session.setAttribute("Designation", viewUserBean.getDesignation());
			session.setAttribute("DOJ", viewUserBean.getDOJ());
			session.setAttribute("casualLeave", viewUserBean.getCasualLeave());
			session.setAttribute("medicalLeave", viewUserBean.getMedicalLeave());
			session.setAttribute("EL", viewUserBean.getEL());
			RequestDispatcher rd = request.getRequestDispatcher("/viewUserResult.jsp");
			rd.forward(request, response);
		} else {
			HttpSession session = request.getSession();
			request.setAttribute("errormessage", "Couldn't View the record .Please check  Eid again.");
			RequestDispatcher rd = request.getRequestDispatcher("/viewUser.jsp");
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
