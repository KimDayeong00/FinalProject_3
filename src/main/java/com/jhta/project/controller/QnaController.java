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
import org.springframework.web.bind.annotation.RequestMethod;
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
			//System.out.println(mv);
			
			return ".qna.qna";
//		}
	}
//	@RequestMapping(value="/qna/insert",method=RequestMethod.POST)
//	public String insert(QnaVo vo, HttpSession session, Model mv) {
//		String m_email = (String)session.getAttribute("login");
//		
//		int qnum = service.maxnum()+1;
//		//System.out.println(qnum);
//		int refer = qnum;
//		
//		QnaVo vo1 = new QnaVo(qnum, vo.getTitle(), vo.getContent(), null, 0, refer, 0, 0, vo.getP_num());
//		service.insert(vo1);
//		
//		List<QnaVo> vo2 = service.qnagetlist(m_email);
//		for(QnaVo vvo:vo2) {
//			mv.addAttribute("qnum", vvo.getQnum());
//			mv.addAttribute("title", vvo.getTitle());
//			mv.addAttribute("content", vvo.getContent());
//			mv.addAttribute("regdate", vvo.getRegdate());
//			mv.addAttribute("p_num", vvo.getP_num());
//			//System.out.println("제이슨피넘 : " + vvo.getP_num());
//		}	
//		return "redirect:/qna/qna";
//	}

	
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

	
	@RequestMapping("/qna/adminqna")
	public String adminlist(Model mv) {
			List<QnaVo> list = service.qnaList();
			mv.addAttribute("adminlist",list);
			
			return ".admin.qna.adminqna";
	}
	
	@RequestMapping(value="/qna/admininsert",method=RequestMethod.GET)
	public String admininsert(int qnum, String title, String content, int refer, int lev, int step, int p_num) {
		QnaVo vo1 = new QnaVo(0, title, content, null, 0, refer, lev, step, 0);
		System.out.println("vo1값:" + vo1.getRefer());
		System.out.println("vo1값:" + vo1.getContent());
		service.adminupdate(vo1);
		lev=lev+1;
		step=step+1;
		
		qnum = service.maxnum()+1;
		
		QnaVo vo2 = new QnaVo(qnum, title, content, null, 0, refer, lev, step, p_num);
		System.out.println("값들어가나:" + vo2.getRefer());
		service.insert(vo2);
		
		return "redirect:/admin/qna/adminqna";
	}
	

//	@RequestMapping(value="/qna/admininsert",produces="application/json;charset=utf-8")
//	@ResponseBody
//	public String admininsert(@RequestParam("qnum")int qnum, @RequestParam("title")String title, @RequestParam("content")String content, @RequestParam("refer")int refer, @RequestParam("lev")int lev, @RequestParam("step")int step, @RequestParam("p_num")int p_num) {
//		
//		QnaVo vo1 = new QnaVo(0, title, content, null,0,refer,lev,step,0);
//		System.out.println("vo1값:" + vo1.getRefer());
//		System.out.println("vo1값:" + vo1.getContent());
//		service.adminupdate(vo1);
//		lev=lev+1;
//		step=step+1;
//		
//		qnum = service.maxnum()+1;
//		
//		QnaVo vo2 = new QnaVo(qnum, title, content, null, 0, refer, lev, step, p_num);
//		System.out.println("값들어가나:" + vo2.getRefer());
//		service.insert(vo2);
//		
//		List<QnaVo> vo = service.qnaList();
//		JSONArray arr = new JSONArray();
//		for(QnaVo vvo:vo) {
//			JSONObject obj = new JSONObject();
//			obj.put("qnum", vvo.getQnum());
//			obj.put("title", vvo.getTitle());
//			obj.put("content", vvo.getContent());
//			obj.put("regdate", vvo.getRegdate());
//			obj.put("p_num", vvo.getP_num());
//			//System.out.println("제이슨피넘 : " + vvo.getP_num());
//			arr.put(obj);
//		}
//		
//		System.out.println("제이슨" + arr);
//		
//		return arr.toString();
//	}
  
}