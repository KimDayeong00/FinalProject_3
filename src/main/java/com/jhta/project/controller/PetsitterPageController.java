package com.jhta.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetsitterPageController {
	
	@RequestMapping("/mypetsitter")
	public ModelAndView pageMove(String page) {
		ModelAndView mv=new ModelAndView(".mypage.petsitter_info");
		
		mv.addObject("page",page);
		return mv;
	}
}
