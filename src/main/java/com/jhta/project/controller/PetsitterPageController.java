package com.jhta.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.DisableDateService;
import com.jhta.project.service.PetSitterImageService;
import com.jhta.project.service.PetSitterImageServiceImpl;
import com.jhta.project.service.PetsitterOptionService;
import com.jhta.project.vo.DisableDateVo;
import com.jhta.project.vo.PetSitterImageVo;
import com.jhta.project.vo.PetsitterOptionVo;

@Controller
public class PetsitterPageController {
	@Autowired DisableDateService service;
	@Autowired PetsitterOptionService service2;
	@Autowired PetSitterImageServiceImpl imageService;
	private String url = ".petsitter_mypage.mypetsitter.petsitter_info";
	private String alertUrl = ".petsitter_mypage.alert";
	
	@RequestMapping("/mypetsitter")
	public ModelAndView pageMove(String page, String dtld, HttpSession session) {
		ModelAndView mv=new ModelAndView(url);
		String ps_email = (String) session.getAttribute("login");
		if(page==null) {
			page = "list";
			dtld = "reservation";
		}
		
		List<DisableDateVo> disablelist = service.getDisable(ps_email);
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("disableList",disablelist);
		
		return mv;
	}
	
	@RequestMapping("/disableSet")
	public ModelAndView disableSet(String disdate, String[] dayCheck, HttpSession session) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String ps_email = (String) session.getAttribute("login");
		String disday = "";
		for(int i=0;i<dayCheck.length;i++) {
			disday += dayCheck[i];
			if(i!=(dayCheck.length-1)) {
				disday += ",";
			}
		}
		DisableDateVo vo=new DisableDateVo(disday,disdate,ps_email);
		int n = service.updateDis(vo);
		mv.addObject("page","list");
		mv.addObject("dtld","reservationSet");
		if(n<0) {
			mv.addObject("msg","오류로 인해 실패하였습니다");
		}else{
			mv.addObject("msg","설정이 완료되었습니다");
		}
		
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		
		mv.addObject("url",path+"/mypetsitter");
		return mv;
	}
	
	@RequestMapping(value="/psinfoSet", method=RequestMethod.GET)
	public ModelAndView psinfoSetView(String page, String dtld, HttpSession session) {
		ModelAndView mv=new ModelAndView(url);
		String ps_email = (String) session.getAttribute("login");
		System.out.println("이메일"+ps_email);
		
		PetsitterOptionVo optionVo = service2.getOption(ps_email);
		List<PetSitterImageVo> ps_imgVo = imageService.getImg(ps_email);
		
		mv.addObject("optionVo",optionVo);
		mv.addObject("ps_imgVo",ps_imgVo);
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		
		return mv;
	}
	
	@RequestMapping(value="/psinfoSet", method=RequestMethod.POST)
	public ModelAndView psinfoSet(String checkinStart, String checkinEnd, String checkoutStart,
			String checkoutEnd, String houseSelect, String houseType, String yardSelect, String familySelect, String familyNum, 
			String childSelect, String childNum, String subway, String otherpetSelect, String otherpetNum, HttpSession session) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String ps_email = (String) session.getAttribute("login");
		String po_space = houseSelect;
		int po_yard = Integer.parseInt(yardSelect);
		int po_child = Integer.parseInt(childSelect);
		int po_family = Integer.parseInt(familySelect);
		int po_otherpet = Integer.parseInt(otherpetSelect);
		if(houseSelect.equals("기타")) {
			po_space = houseType; 
		}
		if(po_child==1) {
			po_child = Integer.parseInt(childNum);
		}
		if(po_family==1) {
			po_family = Integer.parseInt(familyNum);
		}
		if(po_otherpet==1) {
			po_otherpet = Integer.parseInt(otherpetNum);
		}
		
		PetsitterOptionVo vo=new PetsitterOptionVo(ps_email,checkinStart,checkinEnd,checkoutStart,checkoutEnd,po_space,subway,
				po_yard,po_child,po_family,po_otherpet);
		int n = service2.updatePsInfoSet(vo);
		
		if(n<0) {
			mv.addObject("msg","오류로 인해 실패하였습니다");
		}else{
			mv.addObject("msg","설정이 완료되었습니다");
		}
		
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		
		//mv.addObject("ps_email",ps_email);
		mv.addObject("page","sitterInfo");
		mv.addObject("dtld","psInfoSet");
		mv.addObject("ps_email",ps_email);
		mv.addObject("url",path+"/psinfoSet");
		
		return mv;
	}
	
	@RequestMapping(value="/ps_imgTest",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String ps_imgTest(MultipartHttpServletRequest multi) {
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root+"resources/upload/";
		String ps_email = (String) multi.getSession().getAttribute("login");
		
		String savefilename = "";
		String orgfilename = "";
		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()) {
			String uploadFile = files.next();
			
			MultipartFile mf = multi.getFile(uploadFile);
			orgfilename = mf.getOriginalFilename();
			savefilename=UUID.randomUUID() +"_" + orgfilename;
			
			try {
				mf.transferTo(new File(path+savefilename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("filename:"+savefilename);
		int pimg_num = Integer.parseInt(multi.getParameter("pimg_num"));
		
		PetSitterImageVo vo=new PetSitterImageVo(pimg_num,ps_email , savefilename, orgfilename);
		int n = imageService.insert(vo);
		String msg = "fail";
		if(n>0) {
			msg = "success";
		}
		
		JSONObject ob=new JSONObject();
		ob.put("msg", msg);
		ob.put("pimg_num",vo.getPimg_num());
		ob.put("pimg_savefilename", vo.getPimg_savefilename());
		return ob.toString();
	}
}
