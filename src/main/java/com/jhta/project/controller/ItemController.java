/*package com.jhta.project.controller;

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

import com.jhta.project.service.ShopAdminServiceImpl;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopItemImageVo;
import com.jhta.project.vo.ShopItemVo;

@Controller
public class ItemController {
	
	@Resource(name="uploadPath")
    private String uploadPath;
	
@Autowired ShopAdminServiceImpl service;

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
		System.out.println("�ш린源�吏���");
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
		
		
//���〓�� ���쇰� �살�댁�ㅺ린
		String orgfilename=file1.getOriginalFilename();
		//���ν�� ���쇰� 留��ㅺ린(以�蹂듬��吏� ����濡�)
		String savefilename=UUID.randomUUID()+"_"+orgfilename;
		try {
			//���〓�� ���쇱�� �쎌�댁�ㅺ린 ���� �ㅽ�몃┝
			InputStream is=file1.getInputStream();
			//��踰��� ���ν��湲� ���� ���� �ㅽ�몃┝媛�泥� 
			FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+ savefilename);
			//���쇰났�ы��湲�
			FileCopyUtils.copy(is, fos);
			fos.close();
			is.close();
			System.out.println(uploadPath +"\\"+ savefilename +" [���쇱��濡����깃났!]");
			HashMap<String, Object> map=new HashMap<>();
			map.put("savefilename", savefilename);
			map.put("p_num",p_num);
			///////////////////////DB����/////////////////////////////////////
			service.itemimage(map);
			return mv;
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return mv;
		}
		
		
	
	}

}
*/