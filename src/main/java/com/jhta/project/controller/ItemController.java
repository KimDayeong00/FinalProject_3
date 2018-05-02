package com.jhta.project.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.ShopAdminService;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopItemImageVo;
import com.jhta.project.vo.ShopItemVo;

@Controller
public class ItemController {
	
	@Resource(name="uploadPath")
    private String uploadPath;
	
@Autowired ShopAdminService service;

	@RequestMapping("/itemadd")
	public ModelAndView main() {
		ModelAndView mv=new ModelAndView(".itemadd.add");
		List<ShopClassVo> classvo= service.classlist();
	
		mv.addObject("classvo",classvo);
		
		return mv;
	}
	
	@RequestMapping("/test")
	public String test() {
	
		return ".shop.item.test";
	}
	
	@RequestMapping("/itemadd/fieldlist")
	@ResponseBody
	public HashMap<String, Object> fieldlist(ShopClassVo vo) {
		System.out.println("여기까지옴");
		int classnum = vo.getClassnum();
	//	JSONObject obj = new JSONObject();
		HashMap<String, Object> map= new HashMap<>();
		
		List<ShopClassVo> classvo= service.classlist();
		List<ShopFieldVo> fieldvo=service.fieldlist(classnum);
		map.put("fieldvo",fieldvo);
		map.put("classvo",classvo);
		System.out.println(fieldvo.toString());
		return map;
		
	}
	
	@RequestMapping("/itemadd/insert")
	public ModelAndView itemadd(ShopItemVo vo,MultipartFile file1,HttpSession session) {
		ModelAndView mv=new ModelAndView(".main");
		System.out.println(vo.toString());
		service.itemadd(vo);
		int p_num=service.maxpnum();
		System.out.println(p_num);
		
		
//전송된 파일명 얻어오기
		String orgfilename=file1.getOriginalFilename();
		//저장할 파일명 만들기(중복되지 않도록)
		String savefilename=UUID.randomUUID()+"_"+orgfilename;
		try {
			//전송된 파일을 읽어오기 위한 스트림
			InputStream is=file1.getInputStream();
			//서버에 저장하기 위한 파일 스트림객체 
			FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+ savefilename);
			//파일복사하기
			FileCopyUtils.copy(is, fos);
			fos.close();
			is.close();
			System.out.println(uploadPath +"\\"+ savefilename +" [파일업로드성공!]");
			///////////////////////DB저장/////////////////////////////////////
			ShopItemImageVo imagevo=new ShopItemImageVo(0, savefilename, p_num);
			System.out.println(imagevo.toString());
			service.imageadd(imagevo);
			return mv;
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return mv;
		}
		
		
	
	}

}
