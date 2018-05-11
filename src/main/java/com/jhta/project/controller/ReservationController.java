package com.jhta.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController {
	
	@RequestMapping("/reservation")
	public ModelAndView reservation(String bk_startdate, String bk_enddate, String smallPet, String bigPet, String ps_price, String ps_day) {
		ModelAndView mv=new ModelAndView(".booking.booking");
		
		int petCount = Integer.parseInt(smallPet)+Integer.parseInt(bigPet);
		int price = Integer.parseInt(ps_price)*Integer.parseInt(ps_day);
		int tax = (int) (price*0.1);
		int allPrice = price+tax;
		
		mv.addObject("bk_startdate",bk_startdate);
		mv.addObject("bk_enddate",bk_enddate);
		mv.addObject("ps_price",ps_price);
		mv.addObject("ps_day",ps_day);
		mv.addObject("price",price);
		mv.addObject("allPrice",allPrice);
		mv.addObject("tax",tax);
		mv.addObject("petCount",petCount);
	
		return mv;
	}
}
