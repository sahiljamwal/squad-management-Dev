package com.mvc.util;

import java.io.IOException;

import com.mvc.bean.ContactUsBean;
import com.mvc.bean.ForgetPassBean;
import com.mvc.bean.SendMailBean;
import com.mvc.bean.SendMailUpdateBean;
import com.sendgrid.*;

public class SendMailSendGrid {

	public static void sendMailRegistration(SendMailBean sendMailBean) throws IOException {
		Email from = new Email(System.getenv("mailEmail"));
		Email to = new Email(sendMailBean.getEmail());
		String subject = "Welcome To Project Attendance";
		String message = "Hi! " + sendMailBean.getFname()
				+ " you have been Successfully Registered on our site. \n You may start using the site.";
		Content content = new Content("text/plain", message);
		Mail mail = new Mail(from, subject, to, content);

		SendGrid sg = new SendGrid(System.getenv("sendGridMailAPI"));
		Request request = new Request();
		try {
			request.setMethod(Method.POST);
			request.setEndpoint("mail/send");
			request.setBody(mail.build());
			Response response = sg.api(request);
			System.out.println(response.getStatusCode());
			System.out.println(response.getBody());
			System.out.println(response.getHeaders());
		} catch (IOException ex) {
			throw ex;
		}
	}

	public static void sendMailContact(ContactUsBean contactUsBean) throws IOException {
		Email from = new Email(System.getenv("mailEmail"));
		Email to = new Email(System.getenv("mailEmail"));
		String subject = contactUsBean.getSubject();
		String message = "Hi Admin \n" + contactUsBean.getName() + " has contacted with the following message:\n"
				+ contactUsBean.getMessage();
		Content content = new Content("text/plain", message);
		Mail mail = new Mail(from, subject, to, content);

		SendGrid sg = new SendGrid(System.getenv("sendGridMailAPI"));
		Request request = new Request();
		try {
			request.setMethod(Method.POST);
			request.setEndpoint("mail/send");
			request.setBody(mail.build());
			Response response = sg.api(request);
			System.out.println(response.getStatusCode());
			System.out.println(response.getBody());
			System.out.println(response.getHeaders());
		} catch (IOException ex) {
			throw ex;
		}
	}

	public static void sendMailLeavesExhausted(SendMailUpdateBean updBean) throws IOException {
		Email from = new Email(System.getenv("mailEmail"));
		Email to = new Email(updBean.getEmail());
		String subject = "Leaves Exhausted";
		String message = "Hi! There \n Your " + updBean.getLeaveType() + " Leaves has been exhausted. \n"
				+ "Please Visit the site for Detailed Summary of Leave.";
		Content content = new Content("text/plain", message);
		Mail mail = new Mail(from, subject, to, content);

		SendGrid sg = new SendGrid(System.getenv("sendGridMailAPI"));
		Request request = new Request();
		try {
			request.setMethod(Method.POST);
			request.setEndpoint("mail/send");
			request.setBody(mail.build());
			Response response = sg.api(request);
			System.out.println(response.getStatusCode());
			System.out.println(response.getBody());
			System.out.println(response.getHeaders());
		} catch (IOException ex) {
			throw ex;
		}
	}

	public static void sendMailPassReset(ForgetPassBean forgetPassBean) throws IOException {
		Email from = new Email(System.getenv("mailEmail"));
		Email to = new Email(forgetPassBean.getEmail());
		String subject = "Password Reset Successfully";
		String message = "Hi! You have Successfully reuested a new password from us. \n Here's the" + " new password "
				+ forgetPassBean.getNewpass() + " \n Please use this pass "
				+ " without quotes to login to your account and Change Password to your account.";
		Content content = new Content("text/plain", message);
		Mail mail = new Mail(from, subject, to, content);

		SendGrid sg = new SendGrid(System.getenv("sendGridMailAPI"));
		Request request = new Request();
		try {
			request.setMethod(Method.POST);
			request.setEndpoint("mail/send");
			request.setBody(mail.build());
			Response response = sg.api(request);
			System.out.println(response.getStatusCode());
			System.out.println(response.getBody());
			System.out.println(response.getHeaders());
		} catch (IOException ex) {
			throw ex;
		}
	}

	public static void sendMailLeavesUpdated(SendMailUpdateBean updBean) throws IOException {
		Email from = new Email(System.getenv("mailEmail"));
		Email to = new Email(updBean.getEmail());
		String subject = "Leaves Updated Successfully";
		String message = "";
		if (updBean.getLeaveProvided() == "Yes") {
			message += "Hi! There \n Your " + updBean.getLeaveType() + " Leaves have been sanctioned from "
					+ updBean.getStartDate() + " to " + updBean.getEndDate() + " for the following Reason:"
					+ updBean.getReason() + "\n" + "Your Remaining Leaves for " + updBean.getLeaveType()
					+ " Type of Leave is :" + updBean.getLeavesLeft()
					+ "\n Please Visit the site for Detailed Summary of Leave.";
		} else {
			message += "Hi! There \n Your " + updBean.getLeaveType() + " Leaves have been sanctioned from "
					+ updBean.getStartDate() + " to " + updBean.getEndDate() + " for the following Reason:"
					+ updBean.getReason()
					+ "\n But Your Leave Application has not been provided Kindly Submit the Application at the earliest possible date. \n"
					+ "Your Remaining Leaves for " + updBean.getLeaveType() + " Type of Leave is :"
					+ updBean.getLeavesLeft() + "\n Please Visit the site for Detailed Summary of Leave.";
		}
		Content content = new Content("text/plain", message);
		Mail mail = new Mail(from, subject, to, content);

		SendGrid sg = new SendGrid(System.getenv("sendGridMailAPI"));
		Request request = new Request();
		try {
			request.setMethod(Method.POST);
			request.setEndpoint("mail/send");
			request.setBody(mail.build());
			Response response = sg.api(request);
			System.out.println(response.getStatusCode());
			System.out.println(response.getBody());
			System.out.println(response.getHeaders());
		} catch (IOException ex) {
			throw ex;
		}
	}

}
