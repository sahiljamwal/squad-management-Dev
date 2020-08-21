package com.mvc.dao;

import java.io.IOException;

import com.mvc.bean.SendMailBean;
import com.mvc.util.SendMailSendGrid;

public class SendMailDAO {

	public static void sendMail(SendMailBean sendMailBean) throws IOException {
		SendMailSendGrid.sendMailRegistration(sendMailBean);
		System.out.println("Mail Sent Successfully!!.");
	}
}
