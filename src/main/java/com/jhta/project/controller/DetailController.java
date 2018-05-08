package com.jhta.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.DisableDateService;
import com.jhta.project.service.PetSitterImageServiceImpl;
import com.jhta.project.service.PetSitterServiceImpl;
import com.jhta.project.service.PetsitterOptionService;
import com.jhta.project.service.PetsitterPriceService;
import com.jhta.project.service.PpetInfoService;
import com.jhta.project.vo.DisableDateVo;
import com.jhta.project.vo.PetSitterFilterVo;
import com.jhta.project.vo.PetSitterImageVo;
import com.jhta.project.vo.PetSitterJoinFilterVo;
import com.jhta.project.vo.PetSitterPriceVo;
import com.jhta.project.vo.PetSitterVo;
import com.jhta.project.vo.PetsitterOptionVo;
import com.jhta.project.vo.PetsitterPetVo;

@Controller
public class DetailController {
	@Autowired private PetsitterOptionService service;
	@Autowired private PetSitterImageServiceImpl service2;
	@Autowired private PetSitterServiceImpl service3;
	@Autowired private PpetInfoService service4;
	@Autowired private PetsitterPriceService service5;
	@Autowired private DisableDateService service6;
	
	@RequestMapping("/detail")
	public ModelAndView detail(String ps_email) {
		ModelAndView mv=new ModelAndView(".detail");
		PetsitterOptionVo vo = service.getOption("A@B.COM");
		List<PetSitterImageVo> imgList = service2.getImg("A@B.COM");
		PetSitterVo vo2 = service3.select("A@B.COM");
		List<PetsitterPetVo> petList = service4.select("A@B.COM");
		PetSitterPriceVo vo4 = service5.select("A@B.COM");
		List<PetSitterFilterVo> filterList=service3.getFilter("A@B.COM");
		List<DisableDateVo> dd = service6.getDisable("A@B.COM");
		
//		String day = dd.getDisday();
//		String date = dd.getDisDate();
//		String [] disday = day.split(",");
//		String [] disdate = date.split(",");
//		for(int i=0;i<disday.length;i++) {
//			ar.add(disday[i]);
//			System.out.println(disday[i]);
//		}
		
		mv.addObject("vo",vo);
		mv.addObject("vo2",vo2);
		mv.addObject("petList",petList);
		mv.addObject("vo4",vo4);
		mv.addObject("imgList",imgList);
		mv.addObject("filterList",filterList);
		mv.addObject("disableList",dd);
		//mv.addObject("disday",disday);
		//mv.addObject("disdate",disdate);
		return mv;
	}
	
}
