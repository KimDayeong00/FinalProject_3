package com.jhta.project.mail;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class SimpleMailSender {
	private MailSender ms;

	public void setMs(MailSender ms) {
		this.ms = ms;
	}

	public boolean sendMail(String title, String msg, String toEmail, String fromEmail) {
		try {
			SimpleMailMessage smm = new SimpleMailMessage();//보�?��???�??? ???? ??보�?? �??? �?�?
			smm.setSubject(title);//??목�?��??
			smm.setText(msg);//보�?��???�?
			smm.setTo(toEmail);//�????��???��???
			smm.setFrom(fromEmail);//보�?��???��???��???
			ms.send(smm);//�??�보?�기
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
