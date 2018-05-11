package com.jhta.project.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.util.ImageRecognition;
@Controller
public class HomeConrtoller {
	
	@RequestMapping("/")
	public String main() {
		return ".main";

	}
	
	
	@RequestMapping("/tensor")
	public String tensor() {
		ImageRecognition ir = new ImageRecognition();
		ir.images();
		return ".tensor";

	}
	
}

