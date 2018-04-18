package com.jhta.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberController {

	@RequestMapping("/login")
	public String login() {
		return "/members/login";
	}
	
	@RequestMapping("/register")
	public String register() {
		return ".members.terms";
	}
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		return ".members.joinForm";
	}
	
}
