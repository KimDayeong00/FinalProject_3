package com.jhta.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.project.service.MpageServiceImpl;
import com.jhta.project.service.ShopService;
import com.jhta.project.vo.MpageVo;
@Controller
public class HomeConrtoller {

	@Autowired ShopService service;
	@Autowired MpageServiceImpl dao;
	@RequestMapping("/")

	public String main(Model mv) {
		List<MpageVo> list = dao.list();
		mv.addAttribute("list", list);
		return ".main";
	}
	
//	@RequestMapping("/login")
//	public String login() {
//		return "/members/login";
//	}
	
	@RequestMapping("/admin/class")
	public String adminclass() {
		return ".admin.class";
	}

}
