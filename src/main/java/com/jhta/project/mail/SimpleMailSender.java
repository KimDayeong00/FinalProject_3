package com.jhta.project.mail;

import org.springframework.stereotype.Component;

@Component
public class SimpleMailSender {
	/* @Autowired
	    private JavaMailSender mailSender;
	    
	    public void sendEmail(EmailForm emailFomr) throws Exception{
	        //���� �߼� ��� ����
	        MimeMessage msg = mailSender.createMimeMessage();
	        msg.setSubject(emailFomr.getSubject()); //���� ����
	        msg.setText(emailFomr.getContent());
	        msg.setRecipient(RecipientType.TO, new InternetAddress(emailFomr.getReceiver()));
	        mailSender.send(msg);
	    }
	
	*/

}
