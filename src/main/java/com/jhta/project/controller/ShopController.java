package com.jhta.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.ShopService;
import com.jhta.project.service.memberService;
import com.jhta.project.util.PageUtil;
import com.jhta.project.vo.OrderItemListVo;
import com.jhta.project.vo.ShopCartVo;
import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopFilterContentVo;
import com.jhta.project.vo.ShopFilterTypeVo;
import com.jhta.project.vo.ShopItemImageVo;
import com.jhta.project.vo.ShopItemJoinVo;
import com.jhta.project.vo.ShopItemReviewVo;
import com.jhta.project.vo.ShopItemVo;
import com.jhta.project.vo.ShopPayBoardVo;
import com.jhta.project.vo.memberVO;

@Controller
public class ShopController {
	@Autowired ShopService service;
	@Autowired memberService memberService;
	@RequestMapping("/shop/home")
	public ModelAndView home() {
		System.out.println("맨처음 들어옴");
		ModelAndView mv=new ModelAndView(".shop");
		List<ShopClassVo> classvo=service.classlist();
		System.out.println(classvo.toString());
		List<ShopItemVo> hotitem=service.hotitem();
		List<ShopItemVo> newitem=service.newitem();
		
		mv.addObject("hotitem",hotitem);
		mv.addObject("newitem",newitem);
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
		PageUtil pu=new PageUtil(pageNum,15,10,totalRowCount);
		System.out.println("끝페이지?"+pu.getEndPageNum());
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
		System.out.println("토탈로우카운트"+totalRowCount);
		PageUtil pu=new PageUtil(pageNum,15,10,totalRowCount);
		System.out.println("시작행은?"+pu.getStartRow());
		System.out.println("끝행?"+pu.getEndRow());
		System.out.println("끝페이지?"+pu.getEndPageNum());
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
		PageUtil pu=new PageUtil(pageNum,15,10,totalRowCount);
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
		map.put("sql", sql);
		System.out.println(",,,,,,,,,,:"+map);
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
		List<ShopClassVo> classvo=service.classlist();
		
		mv.addObject("classvo",classvo);
		String url="localhost:8090"+vo.getUrl();
		ShopItemVo vo2=service.iteminfo(vo.getNum());
		String img=vo2.getImage_name();
		List<HashMap> cartlist= null;
		int val=vo.getCnt() * vo.getPrice();
		System.out.println(val);
		System.out.println("넘버는?"+vo.getNum());
		HashMap<String, Object> map=new HashMap<>();
		if(session.getAttribute("cartlist")==null) {
			cartlist= new ArrayList<>();
			map.put("val",val);
			map.put("hash", vo.hashCode());
			map.put("num", vo.getNum());
			map.put("title",vo.getTitle());
			map.put("price",vo.getPrice());
			map.put("cnt",vo.getCnt());
			map.put("url",url);
			map.put("img", img);
			cartlist.add(map);
		}else {
			cartlist= (List<HashMap>)session.getAttribute("cartlist");
			map.put("val",val);
			map.put("hash", vo.hashCode());
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
		int hash=Integer.parseInt(req.getParameter("hash"));
		List<HashMap<String, Object>> list=(List<HashMap<String, Object>> )session.getAttribute("cartlist");
		//session.removeAttribute("cartlist");
		for(int i=0; i<list.size();i++) {
			HashMap<String, Object> map=list.get(i);
			if(hash==(Integer)map.get("hash")) {
				list.remove(map);
			}
		}
		return ".shop.cartlist";
	}
	
	
	@RequestMapping("/shop/order")
	public ModelAndView order() {
		ModelAndView mv=new ModelAndView(".shop.order");
		return mv;
		
	}

	@RequestMapping(	value="/shop/buy",method=RequestMethod.POST)
	public String buy(Model mv, int [] cnt,int []chk,int []num,String id,ShopCartVo vo) {
		System.out.println("멤버여기까진오고");
		System.out.println(id);
		memberVO member = memberService.infoEmail(id);
		
		List<ShopCartVo> list = new ArrayList<>();
		System.out.println("리스트만들기");
		if(chk!=null) {
				System.out.println("여기오면체크가잇는거");
		for(int i=0;i<chk.length;i++) {
			System.out.println("여기오면안됨");
			ShopItemVo iteminfo=service.iteminfo(num[chk[i]]);
			ShopCartVo vo1 = new ShopCartVo(iteminfo.getP_num(),iteminfo.getItem_name(),iteminfo.getPrice(),cnt[chk[i]],iteminfo.getImage_name());
			System.out.println(vo1.toString());
			list.add(vo1);
			}
		}else{
			System.out.println("아님열로");
			ShopCartVo vo2= new ShopCartVo(vo.getNum(), vo.getTitle(), vo.getPrice(), vo.getCnt(), vo.getUrl());
			System.out.println("vo2내용출력"+vo2.toString());
			list.add(vo2);
			
		}
		System.out.println("여기까지못오나?");
		List<ShopClassVo> classvo=service.classlist();
		
		mv.addAttribute("classvo",classvo);
		mv.addAttribute("member", member);
		mv.addAttribute("list",list);
		return ".shop.buy";
	}
	
	@RequestMapping("/shop/pay")
	public String pay(Model mv,ShopPayBoardVo vo,OrderItemListVo vo2,HttpServletRequest req,int []p_num,int [] cnt,String [] price) {
		String juso1=req.getParameter("juso1");
		String juso2=req.getParameter("juso2");
		String addr=juso1+juso2;
		String accprice=req.getParameter("accprice");
		String m_email=req.getParameter("m_email");
		String caddr1=req.getParameter("caddr1");
		String caddr2=req.getParameter("caddr2");
		String caddr3=req.getParameter("caddr3");
		String caddr=caddr1+"-"+caddr2+"-"+caddr3;
		
		List<ShopClassVo> classvo=service.classlist();
		
		mv.addAttribute("classvo",classvo);
		ShopPayBoardVo vo3=new ShopPayBoardVo(0, null, vo.getName(), addr, caddr, accprice, m_email);
		System.out.println("값들을 출력하자"+vo3.toString());
		service.payinsert(vo3);
		
		int buy_num=service.getbuynum();
System.out.println("바이넘은몇일까"+buy_num);
		for (int i=0; i<p_num.length; i++) {
			OrderItemListVo vo4=new OrderItemListVo(0, cnt[i], price[i], p_num[i], buy_num);
			service.orderinsert(vo4);
		}
		return ".shop.item.pay";
	}
	
	@RequestMapping("/shop/success")
	public ModelAndView success() {
		ModelAndView mv=new ModelAndView(".shop.item.success");
		return mv;
		
	}
	
	
}
