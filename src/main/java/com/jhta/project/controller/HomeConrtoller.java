package com.jhta.project.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.ShopService;
import com.jhta.project.service.memberService;
import com.jhta.project.vo.ShopClassVo;


@Controller
public class HomeConrtoller {


	@Autowired ShopService service;
	@Autowired memberService memberService;
	@RequestMapping("/")
	public ModelAndView home() {
		System.out.println("맨처음 들어옴");
		ModelAndView mv=new ModelAndView(".main");
		List<ShopClassVo> classvo=service.classlist();
		System.out.println(classvo.toString());
		mv.addObject("classvo",classvo);
		return mv;
	}


	@RequestMapping("/admin/class")
	public String adminclass() {
		return ".admin.class";
	}

}
