package com.mvc.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.AddNewEmployeeBean;
import com.mvc.bean.SendMailBean;
import com.mvc.dao.AddNewEmployeeDAO;
import com.mvc.dao.SendMailDAO;

@WebServlet(name = "AddUserServlet", urlPatterns = { "/Add_new_Employee" })
public class AddNewEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fName = request.getParameter("Fname").trim();
		String lName = request.getParameter("Lname").trim();
		String eid = request.getParameter("Eid").trim();
		String email = request.getParameter("Email").trim();
		String password = request.getParameter("Password");
		String phoneNo = request.getParameter("Phone_no").trim();
		String DOJ = request.getParameter("DOJ");
		String role = request.getParameter("Role");

		AddNewEmployeeBean addNewEmployeeBean = new AddNewEmployeeBean();
		addNewEmployeeBean.setFname(fName);
		addNewEmployeeBean.setLname(lName);
		addNewEmployeeBean.setEmail(email);
		addNewEmployeeBean.setPassword(password);
		addNewEmployeeBean.setEid(eid);
		addNewEmployeeBean.setPhone_no(phoneNo);
		addNewEmployeeBean.setDOJ(DOJ);
		addNewEmployeeBean.setRole(role);

		if (role.equals("TEACHING")) {
			String designation = request.getParameter("DesignationTeaching");
			String branch = request.getParameter("BranchTeaching");
			int casualLeaves = Integer.parseInt(request.getParameter("CasualLeaveTeaching"));
			int medicalLeaves = Integer.parseInt(request.getParameter("MedicalLeavesTeaching"));
			int specialCasualLeaves = Integer.parseInt(request.getParameter("SpecialCasualLeaveTeaching"));
			int onDutyLeaves = Integer.parseInt(request.getParameter("OnDutyLeaveTeaching"));

			addNewEmployeeBean.setBranch(branch);
			addNewEmployeeBean.setDesignation(designation);
			addNewEmployeeBean.setCasualLeave(casualLeaves);
			addNewEmployeeBean.setMedicalLeave(medicalLeaves);
			addNewEmployeeBean.setSpecialCasualLeave(specialCasualLeaves);
			addNewEmployeeBean.setOnDutyLeave(onDutyLeaves);
		} else if (role.equals("NON-TEACHING") || role.equals("ADMIN")) {
			String designation = request.getParameter("DesignationNonTeaching");
			int casualLeaves = Integer.parseInt(request.getParameter("CasualLeaveNonTeaching"));
			int medicalLeaves = Integer.parseInt(request.getParameter("MedicalLeavesNonTeaching"));
			int elLeaves = Integer.parseInt(request.getParameter("ElLeavesNonTeaching"));

			addNewEmployeeBean.setDesignation(designation);
			addNewEmployeeBean.setCasualLeave(casualLeaves);
			addNewEmployeeBean.setMedicalLeave(medicalLeaves);
			addNewEmployeeBean.setElLeave(elLeaves);
		}

		AddNewEmployeeDAO addNewEmployeeDAO = new AddNewEmployeeDAO();
		String userValidate = addNewEmployeeDAO.validate(addNewEmployeeBean);

		if (userValidate.equals("Successfully Added New User")) {
			request.setAttribute("successmessage", "User Added successfully");
			SendMailBean sendMailbean = new SendMailBean();
			sendMailbean.setEmail(email);
			sendMailbean.setFname(fName);
			SendMailDAO.sendMail(sendMailbean);
			RequestDispatcher rd = request.getRequestDispatcher("/addNewEmployee.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("errormessage", "Couldn't Add your record .Please check your data.");
			RequestDispatcher rd = request.getRequestDispatcher("/addNewEmployee.jsp");
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
