package com.jhta.project.controller;

import java.io.File;
import java.util.Iterator;
import java.util.UUID;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jhta.project.service.PetSitterImageServiceImpl;
import com.jhta.project.vo.PetSitterImageVo;

@Controller
public class PetSitterImgUploadController {
	@Autowired PetSitterImageServiceImpl petsitterImgService;
	
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
		int n = petsitterImgService.insert(vo);
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
	
	@RequestMapping(value="/ppetImgUpload",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String ppetImgUpload(MultipartHttpServletRequest multi) {
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
		int n = petsitterImgService.insert(vo);
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
	
	@RequestMapping(value="/myPetImgUpload",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String myPetImgUpload(MultipartHttpServletRequest multi) {
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root+"resources/upload/";
		String m_email = (String) multi.getSession().getAttribute("login");
		String msg = "success";
		
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
				msg="fail";
			}
		}
		System.out.println("filename:"+savefilename);
		//int pimg_num = Integer.parseInt(multi.getParameter("pimg_num"));
		
		JSONObject ob=new JSONObject();
		ob.put("msg", msg);
		//ob.put("pimg_num",vo.getPimg_num());
		ob.put("pi_orgfilename", orgfilename);
		ob.put("pi_savefilename", savefilename);
		return ob.toString();
	}
	
}
