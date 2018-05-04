package com.jhta.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.project.service.ShopAdminServiceImpl;

@Controller
public class ShopAdminController {
	@Autowired private ShopAdminServiceImpl shopAdminService;
	
	@RequestMapping("/shopadmin/list")
	public String list() {
		
		
		
		
		return null;
	}
	
}
