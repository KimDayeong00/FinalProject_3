package com.jhta.project.controller;

import java.security.Provider.Service;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.ShopService;
import com.jhta.project.vo.ShopClassVo;
@Controller
public class HomeConrtoller {
	@Autowired ShopService service;
	@RequestMapping("/")
	public String main() {
		return ".main";
	}

	
	@RequestMapping("/login")
	public String login() {
		return "/members/login";
	}
	
	@RequestMapping("/admin/class")
	public String adminclass() {
		return ".admin.class";
	}
}
