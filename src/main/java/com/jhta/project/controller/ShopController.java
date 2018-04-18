package com.jhta.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.ShopService;
import com.jhta.project.vo.ShopClassVo;

@Controller
public class ShopController {
	@Autowired ShopService service;
	@RequestMapping("/shop/home")
	public ModelAndView home() {
		ModelAndView mv=new ModelAndView(".shop");
		List<ShopClassVo> classvo=service.classlist();
		mv.addObject("classvo",classvo);
		return mv;
	}
	
	@RequestMapping("/item/itemlist")
	public String list() {
		
		return ".shop.item.itemlist";
	}
}
