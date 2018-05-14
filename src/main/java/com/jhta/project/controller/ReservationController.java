package com.jhta.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.BookpetInfoService;
import com.jhta.project.service.MpetInfoService;
import com.jhta.project.service.PayService;
import com.jhta.project.service.PetsitterBookService;
import com.jhta.project.vo.BookpetInfoVo;
import com.jhta.project.vo.MpetInfoVo;
import com.jhta.project.vo.PayVo2;
import com.jhta.project.vo.PetsitterBookVo;

@Controller
public class ReservationController {
	@Autowired MpetInfoService mpetService;
	@Autowired PetsitterBookService bookService;
	@Autowired BookpetInfoService bpetService;
	@Autowired PayService payService;
	
	@RequestMapping("/reservation")
	public ModelAndView reservation(String bk_startdate, String bk_enddate, String smallPet, String bigPet, String ps_price,
									String ps_day, String ps_email, HttpSession session) {
		ModelAndView mv=new ModelAndView(".booking.booking");
		String m_email = (String) session.getAttribute("login");
		
		//상세 페이지에서 정보 가져오기
		int petCount = Integer.parseInt(smallPet)+Integer.parseInt(bigPet);
		int price = Integer.parseInt(ps_price)*Integer.parseInt(ps_day);
		int tax = (int) (price*0.1);
		int allPrice = price+tax;
		
		//예약 가능한 펫 리스트 가져오기
		List<MpetInfoVo> petList = mpetService.psbltPet(m_email);
		
		//상세 페이지에서 가져온 정보 뿌려주기
		mv.addObject("bk_startdate",bk_startdate);
		mv.addObject("bk_enddate",bk_enddate);
		mv.addObject("ps_price",ps_price);
		mv.addObject("ps_day",ps_day);
		mv.addObject("price",price);
		mv.addObject("allPrice",allPrice);
		mv.addObject("tax",tax);
		mv.addObject("petCount",petCount);
		mv.addObject("smallPet",smallPet);
		mv.addObject("bigPet",bigPet);
		mv.addObject("petList",petList);
		mv.addObject("ps_email",ps_email);
	
		return mv;
	}
	
	@RequestMapping("/reservation_p")
	public String reservationInsert(String bk_startdate, String bk_enddate, String selectPet, String comn, String pay_price, String bk_content,
			String ps_email, String petsitter_price, HttpSession session) {
		String m_email = (String) session.getAttribute("login");
		String [] petList = selectPet.split(",");
		
		System.out.println("petsitterBook");
		try {
		PetsitterBookVo vo=new PetsitterBookVo(0,bk_startdate,bk_enddate,null,m_email,null,ps_email,null,bk_content,0);
		int n = bookService.insertBook(vo);
		
		if(n>0) {
			int bk_num = vo.getBk_num();
			
			System.out.println("BookpetInfo");
			for(int i=0;i<petList.length;i++) {
				BookpetInfoVo vo2=new BookpetInfoVo(0,bk_num,Integer.parseInt(petList[i]));
				bpetService.insertBpet(vo2);
			}
			System.out.println("pay");
			PayVo2 vo3=new PayVo2(0,Integer.parseInt(pay_price),null,Integer.parseInt(petsitter_price),Integer.parseInt(comn),m_email,bk_num);
			payService.insertPay(vo3);
			
			return ".booking.success";
		}else {
			return ".booking.error";
		}
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return ".booking.error";
		}
		
	}
}
