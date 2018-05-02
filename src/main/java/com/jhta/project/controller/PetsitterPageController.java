package com.jhta.project.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.DisableDateService;
import com.jhta.project.vo.DisableDateVo;

@Controller
public class PetsitterPageController {
	@Autowired DisableDateService service;
	private String url = ".petsitter_mypage.mypetsitter.petsitter_info";
	private String alertUrl = ".petsitter_mypage.alert";
	
	@RequestMapping("/mypetsitter")
	public ModelAndView pageMove(String page, String dtld, HttpSession session) {
		ModelAndView mv=new ModelAndView(url);
		String ps_email = (String) session.getAttribute("login");
		if(page==null) {
			page = "list";
			dtld = "reservation";
		}
		
		List<DisableDateVo> disablelist = service.getDisable(ps_email);

		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("disableList",disablelist);
		return mv;
	}
	
	@RequestMapping("/disableSet")
	public ModelAndView disableSet(String disdate, String[] dayCheck, HttpSession session) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String ps_email = (String) session.getAttribute("login");
		String disday = "";
		for(int i=0;i<dayCheck.length;i++) {
			disday += dayCheck[i];
			if(i!=(dayCheck.length-1)) {
				disday += ",";
			}
		}
		DisableDateVo vo=new DisableDateVo(disday,disdate,ps_email);
		int n = service.updateDis(vo);
		mv.addObject("page","list");
		mv.addObject("dtld","reservationSet");
		if(n<0) {
			mv.addObject("msg","오류로 인해 실패하였습니다");
		}else{
			mv.addObject("msg","설정이 완료되었습니다");
		}
		
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		
		mv.addObject("url",path+"/mypetsitter");
		return mv;
	}
}
