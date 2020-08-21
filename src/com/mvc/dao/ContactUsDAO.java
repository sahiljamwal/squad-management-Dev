package com.mvc.dao;

import java.io.IOException;

import com.mvc.bean.ContactUsBean;
import com.mvc.util.SendMailSendGrid;

public class ContactUsDAO {

	public static String sendMail(ContactUsBean contactUsBean) throws IOException {

		SendMailSendGrid.sendMailContact(contactUsBean);
		System.out.println("Message Sent Successfully.");
		return "Send";
	}
}
