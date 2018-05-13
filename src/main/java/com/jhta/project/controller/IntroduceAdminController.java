package com.jhta.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.project.dao.IntroduceDao;
import com.jhta.project.service.IntroduceServiceImpl;
import com.jhta.project.vo.IntroduceVo;

@Controller
public class IntroduceAdminController {
	@Autowired private IntroduceServiceImpl dao;
	@RequestMapping("/introduce/introduce")
	public String introduce(Model mv) {
		List<IntroduceVo> list = dao.list();
		mv.addAttribute("list", list);
		return ".admin.introduce.introduce";
	}
	@RequestMapping(value="/introduce/update",method=RequestMethod.POST)
	public String introduceInsert(String hcontent) {
		IntroduceVo vo = new IntroduceVo("1",hcontent);
		dao.update(vo);
		return ".admin.introduce.introduce";
	}
	
	
}
