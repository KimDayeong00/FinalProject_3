package com.jhta.project.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.project.mail.EmailForm;
import com.jhta.project.mail.SimpleMailSender;

@Controller
public class mailController {
	 /* @Autowired
      private SimpleMailSender emailSender;
          
      @RequestMapping(value="send",method=RequestMethod.GET)
      public String formback() {
          return ".members.mailform";
      }
      
      
      @RequestMapping(value="send",method=RequestMethod.POST)
      public String submit(EmailForm form) throws Exception{
          emailSender.sendEmail(form);
          return ".members.success";
      }*/
}
