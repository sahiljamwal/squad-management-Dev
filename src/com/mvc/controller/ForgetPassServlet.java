package com.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.ForgetPassBean;
import com.mvc.dao.ForgetPassDAO;

@WebServlet(name = "ForgetPassServlet", urlPatterns = { "/forget_servlet" })
public class ForgetPassServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String email = request.getParameter("email");
		ForgetPassBean forgetPassBean = new ForgetPassBean();
		forgetPassBean.setEmail(email);

		String result = ForgetPassDAO.reset(forgetPassBean);
		System.out.println("Pass Reset Successfully.");
		if (result.equals("Successfully Changed Password.")) {
			request.getSession(false);
			request.setAttribute("successMessageReset", "Email has been sent with a new pass.");
			RequestDispatcher rd = request.getRequestDispatcher("/forgetPass.jsp");
			rd.forward(request, response);
		} else {
			request.getSession(false);
			String errorMessage = result.equals("There was some error contacting Database.")
					? "Error Connecting to Database."
					: "No Email found within our database.";
			request.setAttribute("errorMessageReset", errorMessage);
			RequestDispatcher rd = request.getRequestDispatcher("/forgetPass.jsp");
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