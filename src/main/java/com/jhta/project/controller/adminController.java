package com.jhta.project.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class adminController {

	
	@RequestMapping("/admin/home")
	public String home() {
		System.out.println("��ó�� ����");
		return ".admin";
	}
}
