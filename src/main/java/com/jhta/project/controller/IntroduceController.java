package com.jhta.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.project.dao.IntroduceDao;
import com.jhta.project.vo.IntroduceVo;

@Controller
public class IntroduceController {
	@Autowired private IntroduceDao dao;
	@RequestMapping("/introduce/getinfo")
	public String introduce(Model mv) {
		List<IntroduceVo> list = dao.list();
		mv.addAttribute("list", list);
		return ".introduce.introduce";
	}
	
	/*@RequestMapping(value="/introduce/update",method=RequestMethod.POST)
	public String introduceInsert(String hcontent) {
		IntroduceVo vo = new IntroduceVo("1",hcontent);
		dao.update(vo);
		return ".admin.introduce.introduce";
	}*/
	
	
}
