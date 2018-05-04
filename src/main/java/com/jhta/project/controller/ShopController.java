package com.jhta.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.ShopService;
import com.jhta.project.util.PageUtil;
import com.jhta.project.vo.ShopCartVo;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopFilterContentVo;
import com.jhta.project.vo.ShopFilterTypeVo;
import com.jhta.project.vo.ShopItemImageVo;
import com.jhta.project.vo.ShopItemJoinVo;
import com.jhta.project.vo.ShopItemReviewVo;
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

		ModelAndView mv=new ModelAndView(".shop.item.itemlist");
		HashMap<String, Object> map=new HashMap<String,Object>();
		int totalRowCount=service.classcnt(classnum);
		PageUtil pu=new PageUtil(pageNum,24,10,totalRowCount);

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
	
	@RequestMapping("/item/detail")
	public ModelAndView detail(ShopItemJoinVo vo) {
		int p_num=vo.getP_num();
		ShopItemVo iteminfo=service.iteminfo(p_num);
		List<ShopItemReviewVo> itemreview=service.itemreview(p_num);
		List<ShopClassVo> classvo=service.classlist();
		List<ShopItemImageVo> imglist=service.imglist(p_num);
		System.out.println(iteminfo.toString());
		System.out.println(classvo.toString());
	
		ModelAndView mv=new ModelAndView(".shop.item.itemdetail");
		mv.addObject("classvo",classvo);
		mv.addObject("iteminfo",iteminfo);
		mv.addObject("itemreview",itemreview);
		mv.addObject("imglist",imglist);
		
		return mv;
	}
	
	@RequestMapping("/shop/cart")
	public ModelAndView cart(ShopCartVo vo,HttpSession session) {
		System.out.println("아아아"+vo.toString());
		ModelAndView mv=new ModelAndView(".shop.cartlist");
		String url="localhost:8090"+vo.getUrl();
		ShopItemVo vo2=service.iteminfo(vo.getNum());
		String img=vo2.getImage_name();
		List<HashMap> cartlist= null;
		HashMap<String, Object> map=new HashMap<>();
		if(session.getAttribute("cartlist")==null) {
			cartlist= new ArrayList<>();
			map.put("vo", vo);
			map.put("num", vo.getNum());
			map.put("title",vo.getTitle());
			map.put("price",vo.getPrice());
			map.put("cnt",vo.getCnt());
			map.put("url",url);
			map.put("img", img);
			cartlist.add(map);
		}else {
			cartlist= (List<HashMap>)session.getAttribute("cartlist");
			map.put("vo", vo);
			map.put("num", vo.getNum());
			map.put("title",vo.getTitle());
			map.put("price",vo.getPrice());
			map.put("cnt",vo.getCnt());
			map.put("url",url);
			map.put("img", img);
			cartlist.add(map);
			
	
		}
		System.out.println(cartlist);
		session.setAttribute("cartlist",cartlist);
		return mv;
	}
	@RequestMapping("/shop/del")
	public String del(HttpServletRequest req,HttpSession session) {
		int num=Integer.parseInt(req.getParameter("num"));
		List<HashMap<String, Object>> list=(List<HashMap<String, Object>> )session.getAttribute("cartlist");
		//session.removeAttribute("cartlist");
		for(int i=0; i<list.size();i++) {
			HashMap<String, Object> map=list.get(i);
			if(num==(Integer)map.get("num")) {
				list.remove(map);
			}
		}
		
		
		return ".shop.cartlist";
	}
	
	@RequestMapping("/shop/cartlist")
	public String cartlist() {
	
		return ".shop.cartlist";
	}
	
	@RequestMapping("/shop/order")
	public ModelAndView order() {
		ModelAndView mv=new ModelAndView(".shop.order");
		return mv;
		
	}
	
}
