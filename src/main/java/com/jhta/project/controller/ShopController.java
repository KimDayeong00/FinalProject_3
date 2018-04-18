package com.jhta.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.ShopService;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopFilterContentVo;
import com.jhta.project.vo.ShopFilterTypeVo;
import com.jhta.project.vo.ShopItemVo;

@Controller
public class ShopController {
	@Autowired ShopService service;
	@RequestMapping("/shop/home")
	public ModelAndView home() {
		ModelAndView mv=new ModelAndView(".shop");
		List<ShopClassVo> classvo=service.classlist();
		mv.addObject("classvo",classvo);
		return mv;
	}
	
	@RequestMapping("/item/itemlist")
	public ModelAndView list(ShopClassVo vo,ShopFieldVo vo2,ShopFilterContentVo vo3) {
		int classnum=vo.getClassnum();
		int fieldnum=vo2.getFieldnum();
		int ft_num=vo3.getFt_num();
		System.out.println("대분류클래스넘버:"+classnum);
		System.out.println("중분류습식건식필드넘버:"+fieldnum);
		ModelAndView mv=new ModelAndView(".shop.item.itemlist");
		List<ShopFieldVo> fieldvo=service.fieldlist(classnum);
		List<ShopItemVo> itemvo=service.itemlist(classnum);
		List<ShopFilterTypeVo> filtertypevo=service.filtertype(fieldnum);
		List<ShopFilterContentVo> filtercontentvo=service.filtercontent(ft_num);
		System.out.println(filtercontentvo.toString());
		mv.addObject("filtertypevo",filtertypevo);
		mv.addObject("fieldvo",fieldvo);
		mv.addObject("itemvo",itemvo);
		mv.addObject("filtercontentvo",filtercontentvo);
		return mv;
	
	}
}
