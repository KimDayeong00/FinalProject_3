package com.jhta.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
	
	@RequestMapping("/mypage")
	public ModelAndView pageMove() {
		ModelAndView mv=new ModelAndView(".mypage.mypage");
		
		return mv;
	}
	
	@RequestMapping("/myPetInfo")
	public ModelAndView myPetInfo(String page, String dtld,HttpSession session) {
		ModelAndView mv=new ModelAndView(".mypage.myPetInfo");
		String m_email = (String) session.getAttribute("login");
		
		
		
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		return mv;
	}
	
	@RequestMapping("/mypageShop")
	public ModelAndView myPageShop() {
		ModelAndView mv=new ModelAndView(".mypage.mypageShop");
		
		return mv;
	}
}
