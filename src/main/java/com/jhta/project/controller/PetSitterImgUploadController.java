package com.jhta.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

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
	@Resource(name="uploadPath1")
    private String uploadPath;
	@RequestMapping(value="/ps_imgTest",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String ps_imgTest(MultipartHttpServletRequest multifile) {
		String root = multifile.getSession().getServletContext().getRealPath("/");
		String path = root+"resources\\petimage\\";
		String ps_email = (String) multifile.getSession().getAttribute("login");
		HashMap<String, Object> map=new HashMap<>();
		List<MultipartFile> filelist=multifile.getFiles("multifile");
		System.out.println("파일파일파일 : "+multifile.getFiles("multifile"));
		System.out.println(" path : "+path);
		map.put("ps_email",ps_email);
		for(MultipartFile mf : filelist) {
			String pimg_orgfilename=mf.getOriginalFilename();	
			String filename=UUID.randomUUID()+"_"+pimg_orgfilename;
			String pimg_savefilename=uploadPath+filename;
			System.out.println("pimg_orgfilename : "+pimg_orgfilename);
			System.out.println("filename : "+filename);
			System.out.println("pimg_savefilename : "+pimg_savefilename);
			try {
				System.out.println("pimg_savefilename : "+pimg_savefilename);
				mf.transferTo(new File(pimg_savefilename));
				map.put("pimg_savefilename",filename);
				map.put("pimg_orgfilename",pimg_orgfilename);
				petsitterImgService.insert(map);
			}catch(IllegalStateException ie) {
				ie.printStackTrace();
			}catch(IOException io) {
				io.printStackTrace();
			}
		}
		JSONObject ob=new JSONObject();
		List<PetSitterImageVo> ps_imgVo = petsitterImgService.getImg(ps_email);
		ob.put("ps_imgVo", ps_imgVo);
		return ob.toString();
	}
	@RequestMapping("/imgdelete")
	public String imgdelete(int pimg_num) {
		petsitterImgService.delete(pimg_num);
		
		return "redirect:/mypage";
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
		/*int n = petsitterImgService.insert(vo);*/
		String msg = "fail";
		/*if(n>0) {
			msg = "success";
		}*/
		
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
