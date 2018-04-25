package com.jhta.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.ShopService;
import com.jhta.project.util.PageUtil;
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
		System.out.println("맨처음 들어옴");
		ModelAndView mv=new ModelAndView(".shop");
		List<ShopClassVo> classvo=service.classlist();
		System.out.println(classvo.toString());
		mv.addObject("classvo",classvo);
		return mv;
	}
	
	@RequestMapping("/item/classitemlist")
	public ModelAndView classitemlist(@RequestParam(value="pageNum",defaultValue="1")int pageNum,ShopClassVo vo,ShopFieldVo vo2) {
		System.out.println("들어옴");
		int classnum=vo.getClassnum();
		System.out.println("���댁�����???"+pageNum);
		ModelAndView mv=new ModelAndView(".shop.item.itemlist");
		HashMap<String, Object> map=new HashMap<String,Object>();
		int totalRowCount=service.classcnt(classnum);
		PageUtil pu=new PageUtil(pageNum,24,10,totalRowCount);
		System.out.println("������"+pu.getStartRow());
		System.out.println("����"+pu.getEndRow());
		map.put("startRow", pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		map.put("classnum",classnum);
		List<ShopFieldVo> fieldvo=service.fieldlist(classnum);
		List<ShopClassVo> classvo=service.classlist();
		List<ShopItemVo> itemvo=service.classitemlist(map);
		System.out.println(itemvo.toString());
		
		mv.addObject("pgchk","class");
		mv.addObject("classnum",classnum);
		mv.addObject("pu",pu);
		mv.addObject("itemvo",itemvo);
		mv.addObject("classvo",classvo);
		mv.addObject("fieldvo",fieldvo);
		return mv;
	}
	
	@RequestMapping("/item/fielditemlist")
	public ModelAndView fielditemlist(@RequestParam(value="pageNum",defaultValue="1")int pageNum,ShopClassVo vo,ShopFieldVo vo2) {
		ModelAndView mv=new ModelAndView(".shop.item.itemlist");
		int classnum=vo.getClassnum();
		int fieldnum=vo2.getFieldnum();
		HashMap<Object,Object> map2=new HashMap<>();
		int totalRowCount=service.fieldcnt(fieldnum);
		PageUtil pu=new PageUtil(pageNum,24,10,totalRowCount);
		map2.put("startRow",pu.getStartRow());
		map2.put("endRow",pu.getEndRow());
		map2.put("fieldnum",fieldnum);
		List<ShopFieldVo> fieldvo=service.fieldlist(classnum);
		List<ShopClassVo> classvo=service.classlist();
		List<ShopItemVo> itemvo=service.fielditemlist(map2);
		List<ShopFilterTypeVo> filtertypevo=service.filtertype(fieldnum);
		HashMap<Object, Object> map=new HashMap<>();
		for(ShopFilterTypeVo filter:filtertypevo) {
			int ft_num=filter.getFt_num();
			List<ShopFilterContentVo> filtercontentvo=service.filtercontent(ft_num);
			map.put(filter.getFt_num(), filtercontentvo);
		}
		mv.addObject("pgchk","field");
		mv.addObject("pu",pu);
		mv.addObject("itemvo",itemvo);
		mv.addObject("classvo",classvo);
		mv.addObject("filtertypevo",filtertypevo);
		mv.addObject("fieldvo",fieldvo);
		mv.addObject("fieldnum",fieldnum);
		mv.addObject("classnum",classnum);
		mv.addObject("map",map);
		return mv;
	}

	@RequestMapping("/item/itemlist")
	@ResponseBody
	public HashMap<Object, Object> list(@RequestParam(value="pageNum",defaultValue="1")int pageNum,ShopClassVo vo,ShopFieldVo vo2,@RequestParam(value="fc_num",defaultValue="0")int fc_num,String sql) {
		int classnum=vo.getClassnum();
		int fieldnum=vo2.getFieldnum();
		HashMap<Object,Object> map2=new HashMap<>();
		List<ShopFieldVo> fieldvo=service.fieldlist(classnum);
		List<ShopFilterTypeVo> filtertypevo=service.filtertype(fieldnum);
		HashMap<Object, Object> map=new HashMap<>();
		System.out.println(sql);
		map2.put("sql", sql);
		map2.put("classnum", classnum);
		map2.put("fieldnum", fieldnum);
		map2.put("fc_num",fc_num);
		int totalRowCount=service.itemcnt(map2);
		PageUtil pu=new PageUtil(pageNum,24,10,totalRowCount);
		map2.put("startRow",pu.getStartRow());
		map2.put("endRow",pu.getEndRow());
		List<ShopItemVo> itemvo=service.itemlist(map2);
		System.out.println(itemvo);
		for(ShopFilterTypeVo filter:filtertypevo) {
			int ft_num=filter.getFt_num();
			List<ShopFilterContentVo> filtercontentvo=service.filtercontent(ft_num);
			map.put(filter.getFt_num(), filtercontentvo);
		}
		List<ShopClassVo> classvo=service.classlist();
		map.put("pgchk","item");
		map.put("pu", pu);
		map.put("classvo",classvo);
		map.put("filtertypevo",filtertypevo);
		map.put("fieldvo",fieldvo);
		map.put("itemvo",itemvo);
		map.put("fieldnum",fieldnum);
		map.put("classnum",classnum);
	
		return map;
	
	}
	
	@RequestMapping("/item/itemlist1")
	@ResponseBody
	public HashMap<Object, Object> list1(@RequestParam(value="fc_name",defaultValue="abc")String fc_name) {
		int classnum=1;
		int fieldnum=1;
	
		List<ShopFieldVo> fieldvo=service.fieldlist(classnum);
		List<ShopFilterTypeVo> filtertypevo=service.filtertype(fieldnum);
		HashMap<Object, Object> map=new HashMap<>();
		HashMap<String,Object> map2=new HashMap<>();
		
		map.put("classnum", classnum);
		map.put("fieldnum", fieldnum);
		map.put("fieldvo",fieldvo);
	
		return map;
	
	}
}
