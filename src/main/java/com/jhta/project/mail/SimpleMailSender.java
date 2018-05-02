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
			SimpleMailMessage smm = new SimpleMailMessage();//ë³´ë?¼ë???ì§??? ???? ??ë³´ë?? ê°??? ê°?ì²?
			smm.setSubject(title);//??ëª©ì?¤ì??
			smm.setText(msg);//ë³´ë?¼ë???ì§?
			smm.setTo(toEmail);//ë°????¬ë???´ë???
			smm.setFrom(fromEmail);//ë³´ë?´ë???¬ë???´ë???
			ms.send(smm);//ë©??¼ë³´?´ê¸°
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
