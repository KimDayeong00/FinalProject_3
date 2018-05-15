package com.jhta.project.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.DisableDateService;
import com.jhta.project.service.PetSitterImageServiceImpl;
import com.jhta.project.service.PetSitterServiceImpl;
import com.jhta.project.service.PetsitterBookService;
import com.jhta.project.service.PetsitterOptionService;
import com.jhta.project.service.PetsitterPriceService;
import com.jhta.project.service.PpetInfoService;
import com.jhta.project.vo.DisableDateVo;
import com.jhta.project.vo.PetSitterFilterVo;
import com.jhta.project.vo.PetSitterImageVo;
import com.jhta.project.vo.PetSitterPriceVo;
import com.jhta.project.vo.PetSitterVo;
import com.jhta.project.vo.PetsitterBookVo;
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
	@Autowired private PetsitterBookService bookService;
	
	@RequestMapping("/detail")
	public ModelAndView detail(String ps_email) {
		ModelAndView mv=new ModelAndView(".detail");
		PetsitterOptionVo vo = service.getOption(ps_email);
		List<PetSitterImageVo> imgList = service2.getImg(ps_email);
		PetSitterVo vo2 = service3.select(ps_email);
		List<PetsitterPetVo> petList = service4.select(ps_email);
		PetSitterPriceVo vo4 = service5.select(ps_email);
		List<PetSitterFilterVo> filterList=service3.getFilter(ps_email);
		List<DisableDateVo> dd = service6.getDisable(ps_email);
		List<PetsitterBookVo> bookList= bookService.selectPbookList(ps_email);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
		String startd="";
		String endd="";
		
		try {
			for(int i=0;i<bookList.size();i++) {
			PetsitterBookVo blist= bookList.get(i);
			String start = blist.getBk_startdate();
			String end = blist.getBk_enddate();
			
			Date ss = df.parse(start);
			Date ee = df.parse(end);
			
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			
			c1.setTime(ss);
			c2.setTime(ee);
			
			
			while(c1.compareTo(c2)!=1) {
				//System.out.println(c1.getTime());
				startd += df2.format(c1.getTime())+",";
				System.out.println(startd);
				c1.add(Calendar.DATE, 1);
				}	
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		String day = dd.getDisday();
//		String date = dd.getDisDate();
//		String [] disday = day.split(",");
//		String [] disdate = date.split(",");
//		for(int i=0;i<disday.length;i++) {
//			ar.add(disday[i]);
//			System.out.println(disday[i]);
//		}
		
		mv.addObject("vo",vo);
		mv.addObject("ps_email",ps_email);
		mv.addObject("vo2",vo2);
		mv.addObject("petList",petList);
		mv.addObject("vo4",vo4);
		mv.addObject("imgList",imgList);
		mv.addObject("filterList",filterList);
		mv.addObject("disableList",dd);
		mv.addObject("startdate",startd);
		//mv.addObject("disday",disday);
		//mv.addObject("disdate",disdate);
		return mv;
	}
	
}
