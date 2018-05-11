package com.jhta.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.project.service.MpageServiceImpl;
import com.jhta.project.service.ShopService;
import com.jhta.project.service.memberService;
import com.jhta.project.vo.MpageVo;
import com.jhta.project.vo.ShopClassVo;


@Controller
public class HomeConrtoller {

	@Autowired ShopService service;
	@Autowired MpageServiceImpl dao;
	@Autowired memberService memberService;

	@RequestMapping("/")
	public String main(Model mv) {
		List<MpageVo> list = dao.list();
		List<ShopClassVo> classvo=service.classlist();
		mv.addAttribute("list", list);
		mv.addAttribute("classvo", classvo);
		return ".main";
	}

	@RequestMapping("/admin/class")
	public String adminclass() {
		return ".admin.class";
	}

}
