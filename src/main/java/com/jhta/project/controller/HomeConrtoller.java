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

	}
	
	
	@RequestMapping("/mypage")
	public ModelAndView pageMove(String page, String dtld) {
		ModelAndView mv=new ModelAndView(".petsitter_mypage.mypetsitter.petsitter_info");
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		return mv;
	}
	

}

