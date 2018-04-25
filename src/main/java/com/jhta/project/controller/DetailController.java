package com.jhta.project.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.PetsitterOptionService;
import com.jhta.project.vo.PetsitterOptionVo;

@Controller
public class DetailController {
	@Autowired private PetsitterOptionService service;
	
	@RequestMapping("/detail")
	public ModelAndView detail(String ps_email) {
		ModelAndView mv=new ModelAndView(".detail");
		PetsitterOptionVo vo = service.getOption("A@B.COM");
		List<String> imgList = service.getImg("A@B.COM");
		mv.addObject("vo",vo);
		mv.addObject("imgList",imgList);
		return mv;
	}
	
}
