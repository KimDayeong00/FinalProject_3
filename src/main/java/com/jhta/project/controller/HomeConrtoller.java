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
		return ".menu.menu";
	}
	@RequestMapping("/shop/home")
	public String home() {
		return ".shop.home";
	}
}
