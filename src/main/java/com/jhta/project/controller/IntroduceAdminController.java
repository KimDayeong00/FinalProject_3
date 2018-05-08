package com.jhta.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroduceAdminController {

	@RequestMapping("/introduce/introduce")
	public String introduce() {
		return ".admin.introduce.introduce";
	}
	
	
}
