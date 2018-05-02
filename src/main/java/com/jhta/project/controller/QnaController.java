package com.jhta.project.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.project.service.QnaService;
import com.jhta.project.util.PageUtil;
import com.jhta.project.vo.QnaVo;

@Controller
public class QnaController {
	@Autowired private QnaService service;
	
	@RequestMapping("/qna/faq")
	public String faq() {
		return ".qna.faq";
	}
	
	
	@RequestMapping("/qna/qna")
	public String list(@RequestParam(value="pageNum",defaultValue="1")int pageNum,String field,String keyword,Model mv,HttpSession session) {
		
		String email = (String)session.getAttribute("login");
		System.out.println(email);
		
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("field",field);
		map.put("keyword",keyword);
		
		int totalRowCount=service.getCount(map);
		
		PageUtil pu=new PageUtil(pageNum, 10,10, totalRowCount);
		
		map.put("startRow", pu.getStartRow());
		map.put("endRow",pu.getEndRow());
	
		List<QnaVo> list=service.list(map);
	
		mv.addAttribute("qnalist",list);
		mv.addAttribute("pu",pu);
		mv.addAttribute("field",field);
		mv.addAttribute("keyword",keyword);
		System.out.println(mv);
		
		return ".qna.qna";
	}
}
