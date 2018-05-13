package com.jhta.project.mail;

import org.springframework.stereotype.Component;

@Component
public class SimpleMailSender {
	/* @Autowired
	    private JavaMailSender mailSender;
	    
	    public void sendEmail(EmailForm emailFomr) throws Exception{
	        //皋老 惯价 扁瓷 力傍
	        MimeMessage msg = mailSender.createMimeMessage();
	        msg.setSubject(emailFomr.getSubject()); //皋老 力格
	        msg.setText(emailFomr.getContent());
	        msg.setRecipient(RecipientType.TO, new InternetAddress(emailFomr.getReceiver()));
	        mailSender.send(msg);
	    }
	
	*/

}
