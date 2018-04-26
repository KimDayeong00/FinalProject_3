package com.jhta.project.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.AdminService;
import com.jhta.project.vo.ShopClassVo;

@Controller
public class AdminController {
	@Autowired AdminService service;
	
	@RequestMapping(value = "/admin/classList",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String home() {

		JSONArray arr = new JSONArray();
		List<ShopClassVo> classvo=service.classList();
		
		System.out.println(classvo);
		
		for(ShopClassVo vo:classvo) {
			JSONObject ob = new JSONObject();
			ob.put("classnum", vo.getClassnum());
			ob.put("name", vo.getName());
			arr.put(ob);
		}	
		return arr.toString();
	}
	
	@RequestMapping(value = "/admin/classInsert/{name}", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String classInsert(@PathVariable("name")String name) {
		ShopClassVo vo = new ShopClassVo(0, name);
		int n = service.classInsert(vo);
		ShopClassVo vvo = service.classGetinfo(name);
		JSONObject ob = new JSONObject();
		if(n>0) {
			ob.put("classnum", vvo.getClassnum());
			ob.put("name", vvo.getName());
		}
		return ob.toString();
	}
	
	@RequestMapping(value = "/admin/classGetinfo", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ShopClassVo classGetinfo(String name) {
		ShopClassVo vo = service.classGetinfo(name);
//		JSONObject ob = new JSONObject();
//		ob.put("classnum", vo.getClassnum());
//		ob.put("name", vo.getName());
		return vo;
	}
		
	@RequestMapping(value = "/admin/classDelete", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String classDelete(int classnum) {
		int n = service.classDelete(classnum);
		System.out.println("delete : " + n);
		JSONArray arr = new JSONArray();
		if(n>0) {
			List<ShopClassVo> classvo=service.classList();
			
			for(ShopClassVo vo:classvo) {
				JSONObject ob = new JSONObject();
				ob.put("classnum", vo.getClassnum());
				ob.put("name", vo.getName());
				arr.put(ob);
			}	
		}
		return arr.toString();	
	}
	
	@RequestMapping(value = "/admin/classUpdateOk", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String classUpdateOk(int classnum, String name) {
		ShopClassVo vo = new ShopClassVo(classnum, name);
		int n = service.classUpdateOk(vo);
		JSONArray arr = new JSONArray();
		if(n>0) {
			List<ShopClassVo> classvo=service.classList();
			
			for(ShopClassVo vvo:classvo) {
				JSONObject ob = new JSONObject();
				ob.put("classnum", vvo.getClassnum());
				ob.put("name", vvo.getName());
				arr.put(ob);
			}	
		}
		System.out.println(arr);
		return arr.toString();	
	}
}
