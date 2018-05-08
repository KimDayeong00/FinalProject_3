package com.jhta.project.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.project.service.QnaService;
import com.jhta.project.util.PageUtil;
import com.jhta.project.vo.PayboardVo;
import com.jhta.project.vo.QnaVo;
import com.jhta.project.vo.ShopItemVo;

@Controller
public class QnaController {
	@Autowired private QnaService service;
	
	@RequestMapping("/qna/faq")
	public String faq() {
		return ".qna.faq";
	}

	@RequestMapping("/qna/qna")
	public String list(@RequestParam(value="pageNum",defaultValue="1")int pageNum,String field,String keyword,Model mv,HttpSession session) {
		
		String m_email = (String)session.getAttribute("login");
		System.out.println(m_email);
		
//		if(m_mail==null) {
//			return ".members.login";
//		}else {
			HashMap<String,Object> map=new HashMap<String, Object>();
			map.put("field",field);
			map.put("keyword",keyword);
			
			int totalRowCount=service.getCount(map);
			
			PageUtil pu=new PageUtil(pageNum, 10,10, totalRowCount);
			
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());
			map.put("m_email",m_email);
			
			List<QnaVo> list = service.list(map);
			List<QnaVo> vo = service.qnagetlist(m_email);
			List<ShopItemVo> vvo = service.orderiteminfo(m_email);
			
			mv.addAttribute("orderiteminfo", vvo);
			mv.addAttribute("qnagetlist", vo);
			mv.addAttribute("qnalist",list);
			mv.addAttribute("pu",pu);
			mv.addAttribute("field",field);
			mv.addAttribute("keyword",keyword);
			System.out.println(mv);
			
			return ".qna.qna";
//		}
	}
	@RequestMapping(value="/qna/insert",produces="application/json;charset=utf-8")
	@ResponseBody
	public String insert(@RequestParam("p_num")int p_num, @RequestParam("title")String title, @RequestParam("content")String content, HttpSession session) {
		String m_email = (String)session.getAttribute("login");
		
		QnaVo vo1 = new QnaVo(0,title, content, null,0,0,0,0,p_num);
		service.insert(vo1);
		
		List<QnaVo> vo = service.qnagetlist(m_email);
		JSONArray arr = new JSONArray();
		for(QnaVo vvo:vo) {
			JSONObject obj = new JSONObject();
			obj.put("qnum", vvo.getQnum());
			obj.put("title", vvo.getTitle());
			obj.put("content", vvo.getContent());
			obj.put("regdate", vvo.getRegdate());
			obj.put("p_num", vvo.getP_num());
			System.out.println("제이슨피넘 : " + vvo.getP_num());
			arr.put(obj);
		}
		
		System.out.println("제이슨" + arr);
		
		return arr.toString();
	}
	
	
	
	@RequestMapping("/qna/adminqna")
	public String adminlist(@RequestParam(value="pageNum",defaultValue="1")int pageNum,String field,String keyword,Model mv,HttpSession session) {

//		if(m_mail==null) {
//			return ".members.login";
//		}else {
			HashMap<String,Object> map=new HashMap<String, Object>();
			map.put("field",field);
			map.put("keyword",keyword);
			
			int totalRowCount=service.getCount(map);
			
			PageUtil pu=new PageUtil(pageNum, 10,10, totalRowCount);
			
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());
		
			List<QnaVo> list = service.adminlist(map);
			
			mv.addAttribute("adminlist",list);
			mv.addAttribute("pu",pu);
			mv.addAttribute("field",field);
			mv.addAttribute("keyword",keyword);
			System.out.println(mv);
			
			return ".qna.adminqna";
//		}
	}
}
