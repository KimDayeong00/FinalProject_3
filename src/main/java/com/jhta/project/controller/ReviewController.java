package com.jhta.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public ModelAndView reviewForm(String ps_email, String bk_num) {
		System.out.println(ps_email+bk_num);
		ModelAndView mv=new ModelAndView("/mypage/reviewForm");
		
		mv.addObject("ps_email",ps_email);
		mv.addObject("bk_num",Integer.parseInt(bk_num));
		
		return mv;
	}
	
//	@RequestMapping(value="/reviewInsert", method=RequestMethod.POST)
//	public ModelAndView reviewInsert(String r_content,String r_score, String ps_email, String bk_num, HttpSession session) {
//		ModelAndView mv=new ModelAndView();
//		String m_email = (String) session.getAttribute("login");
//		
//		ReviewVo vo=new ReviewVo(0,r_content,Integer.parseInt(r_score),null,m_email,ps_email,Integer.parseInt(bk_num));
//		int n = rvService.insertReview(vo);
//		rvService.updateBk_rv(Integer.parseInt(bk_num));
//		
//		mv.setView(new RedirectView("/mypagePrevlist?"));
//		mv.addObject("dtld","prevReservation");
//		mv.addObject("session",session);
//		
//		return mv;
//	}
//	
	@RequestMapping(value="/reviewInsert", method=RequestMethod.POST)
	public String reviewInsert(String r_content,String r_score, String ps_email, String bk_num, HttpSession session,Model mv) {
	
		String m_email = (String) session.getAttribute("login");
		System.out.println("gggggggggggggg");
		
		ReviewVo vo=new ReviewVo(0,r_content,Integer.parseInt(r_score),null,m_email,ps_email,Integer.parseInt(bk_num));
		int n = rvService.insertReview(vo);
		rvService.updateBk_rv(Integer.parseInt(bk_num));
		System.out.println("n:" + n);
		//mv.setView(new RedirectView("/mypagePrevlist?"));
		//mv.addObject("dtld","prevReservation");
		//mv.addObject("session",session);
		mv.addAttribute("popup","1");
		//return "redirect:/mypagePrevlist?dtld=prevReservation&popup=1" ;
		return "/mypage/reviewForm";
	}
	
}
