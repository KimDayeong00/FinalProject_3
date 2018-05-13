package com.jhta.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jhta.project.service.ReviewService;
import com.jhta.project.vo.ReviewVo;

@Controller
public class ReviewController {
	@Autowired ReviewService rvService;
	
	@RequestMapping(value="/reviewInsert", method=RequestMethod.GET)
	public String reviewForm(String ps_email, String bk_num) {
		System.out.println(ps_email+bk_num);
		
		return "/mypage/reviewForm";
	}
	
	@RequestMapping(value="/reviewInsert", method=RequestMethod.POST)
	public ModelAndView reviewInsert(String r_content,String r_score, String ps_email, String bk_num, HttpSession session) {
		ModelAndView mv=new ModelAndView();
		String m_email = (String) session.getAttribute("login");
		
		ReviewVo vo=new ReviewVo(0,r_content,Integer.parseInt(r_score),null,m_email,ps_email,Integer.parseInt(bk_num));
		int n = rvService.insertReview(vo);
		
		mv.setView(new RedirectView("/mypagePrevlist?method=list"));
		mv.addObject("dtld","prevReservation");
		mv.addObject("session",session);
		
		return mv;
	}
	
}
