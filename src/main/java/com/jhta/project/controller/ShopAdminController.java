package com.jhta.project.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.project.service.ShopAdminServiceImpl;
import com.jhta.project.service.ShopService;
import com.jhta.project.vo.ShopClassJoinShopFieldVo;
import com.jhta.project.vo.ShopItemVo;

@Controller
public class ShopAdminController {
	@Autowired private ShopAdminServiceImpl shopAdminService;
	@RequestMapping("/shopadmin/list")
	public String list(Model model,String fieldnum) {
		List<ShopClassJoinShopFieldVo> list = shopAdminService.list();
		if(fieldnum!=null) {
			HashMap<Object, Object> map = new HashMap<>();
			map.put("fieldnum", fieldnum);
			List<ShopItemVo> itemlist =	shopAdminService.itemlist(map);
			model.addAttribute("itemlist", itemlist);
		}
		model.addAttribute("classfield", list);
		System.out.println("필드넘 번호 : "+fieldnum );
		return ".admin.shopadmin.list";
	}
	@RequestMapping("/shopadmin/add")
	public String update(Model model,String p_num) {
		
		return ".admin.shopadmin.add";
	}
	@RequestMapping("/shopadmin/delete")
	public String delete(Model model,String p_num,String fieldnum) {
		System.out.println("p_num" + p_num);
		System.out.println("fieldnum" + fieldnum);
		System.out.println("성공 ???"+shopAdminService.delete(p_num));
		return "redirect:/shopadmin/list?fieldnum="+fieldnum;
	}
	
}
