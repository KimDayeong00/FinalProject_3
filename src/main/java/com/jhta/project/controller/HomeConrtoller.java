package com.jhta.project.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class HomeConrtoller {
	
	@RequestMapping("/")
	public String main() {
		return ".main";
<<<<<<< HEAD
	}
	@RequestMapping("/shop/home")
	public String home() {
		return ".shop.home";
	}
	
	@RequestMapping("/petsitterPage")
	public String petsitterPage() {
		return ".mypage.petsitter_info";
	}
=======
	}

	
	@RequestMapping("/login")
	public String login() {
		return "/members/login";
}

>>>>>>> branch 'jg' of https://github.com/KimDayeong00/FinalProject_3.git
}
