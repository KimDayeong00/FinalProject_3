package com.jhta.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import org.json.JSONObject;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.project.util.ImageRecognition;

import com.jhta.project.service.MpageServiceImpl;
import com.jhta.project.service.ShopService;

import com.jhta.project.service.memberService;
import com.jhta.project.vo.MpageVo;
import com.jhta.project.vo.ShopClassVo;


@Controller
public class HomeConrtoller {
	private FileOutputStream fos;

	@Autowired ShopService service;
	@Autowired MpageServiceImpl dao;
	@Autowired memberService memberService;


	@RequestMapping("/tensor")
	public String tensor() {
		System.out.println("tensor in");
		/*
		 * ImageRecognition ir = new ImageRecognition(); String result = ir.images();
		 * System.out.println("컨트롤러 텐서 결과 12345asdf"+result);
		 */
		return "/tensor";
	}

	@RequestMapping("/")
	public String main(Model mv) {
		System.out.println("시작은 메인이지");
		List<MpageVo> list = dao.list();
		List<ShopClassVo> classvo=service.classlist();
		mv.addAttribute("list", list);
		mv.addAttribute("classvo", classvo);
		return ".main";
	}
	
	@RequestMapping(value = "/tensorSearch", method = RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String tensorSearch(@RequestParam MultipartFile media) {
		System.out.println("imagesearch controller come");
		String dog = "";

		JSONObject ob=new JSONObject();
		try {
			byte[] bytes = media.getBytes();
			ImageRecognition ir = new ImageRecognition(); 
			dog = ir.images(bytes);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*if(media.isEmpty()){

			File file = new File(media.getOriginalFilename());

			try {
				media.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ImageRecognition ir = new ImageRecognition(); 
			dog = ir.images(file);
			
			
		}*/
		System.out.println("dog:" + dog);
		System.out.println("헬로");
		ob.put("dog",dog);
		
		
		
		return ob.toString();

	}


	@RequestMapping("/admin/class")
	public String adminclass() {
		return ".admin.class";
	}

}
