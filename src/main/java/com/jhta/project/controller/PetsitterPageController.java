package com.jhta.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetsitterPageController {
	
	@RequestMapping("/mypetsitter")
	public ModelAndView pageMove(String page, String dtld) {
		ModelAndView mv=new ModelAndView(".petsitter_mypage.mypetsitter.petsitter_info");
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		return mv;
	}
}
