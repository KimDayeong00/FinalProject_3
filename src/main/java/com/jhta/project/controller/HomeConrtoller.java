package com.jhta.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.project.service.ShopService;
@Controller
public class HomeConrtoller {

	@Autowired ShopService service;

	@RequestMapping("/")

	public String main() {
		return ".main";
	}
	
//	@RequestMapping("/login")
//	public String login() {
//		return "/members/login";
//	}
	
	@RequestMapping("/admin/class")
	public String adminclass() {
		return ".admin.class";
	}

}
