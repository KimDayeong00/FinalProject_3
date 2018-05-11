package com.jhta.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.project.dao.IntroduceDao;
import com.jhta.project.dao.MpageDao;
import com.jhta.project.service.MpageServiceImpl;
import com.jhta.project.vo.IntroduceVo;
import com.jhta.project.vo.MpageVo;

@Controller
public class MpageAdminController {
	@Autowired private MpageServiceImpl dao;
	@RequestMapping("/mpage/mpage")
	public String mpage(Model mv) {
		List<MpageVo> list = dao.list();
		mv.addAttribute("list", list);
		return ".admin.mpage.mpage";
	}
	@RequestMapping(value="/mpage/update",method=RequestMethod.POST)
	public String mpageInsert(String hcontent) {
		MpageVo vo = new MpageVo("1",hcontent);
		dao.update(vo);
		return ".admin.mpage.mpage";
	}
	
	
}
