package com.jhta.project.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.PetSitterImageServiceImpl;
import com.jhta.project.service.PetSitterServiceImpl;
import com.jhta.project.service.PetsitterOptionService;
import com.jhta.project.service.PetsitterPriceService;
import com.jhta.project.service.PpetInfoService;
import com.jhta.project.vo.PetSitterImageVo;
import com.jhta.project.vo.PetSitterVo;
import com.jhta.project.vo.PetsitterOptionVo;
import com.jhta.project.vo.PetsitterPetVo;
import com.jhta.project.vo.PetsitterPriceVo;

@Controller
public class DetailController {
	@Autowired private PetsitterOptionService service;
	@Autowired private PetSitterImageServiceImpl service2;
	@Autowired private PetSitterServiceImpl service3;
	@Autowired private PpetInfoService service4;
	@Autowired private PetsitterPriceService service5;
	
	@RequestMapping("/detail")
	public ModelAndView detail(String ps_email) {
		System.out.println("しかしいぉ");
		ModelAndView mv=new ModelAndView(".detail");
		PetsitterOptionVo vo = service.getOption("A@B.COM");
		List<PetSitterImageVo> imgList = service2.getImg("A@B.COM");
		PetSitterVo vo2 = service3.select("A@B.COM");
		PetsitterPetVo vo3 = service4.select("A@B.COM");
		PetsitterPriceVo vo4 = service5.select("A@B.COM");
		mv.addObject("vo",vo);
		mv.addObject("vo2",vo2);
		mv.addObject("vo3",vo3);
		mv.addObject("vo4",vo4);
		mv.addObject("imgList",imgList);
		return mv;
	}
	
}
