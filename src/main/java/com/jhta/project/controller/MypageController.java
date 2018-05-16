package com.jhta.project.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jhta.project.service.MpetInfoService;
import com.jhta.project.service.OrderListService;
import com.jhta.project.service.PetsitterBookService;
import com.jhta.project.service.ShopService;
import com.jhta.project.service.memberService;
import com.jhta.project.util.PageUtil;
import com.jhta.project.vo.BookListVo;
import com.jhta.project.vo.MpetInfoVo;
import com.jhta.project.vo.OrderItemVo;
import com.jhta.project.vo.OrderJoinVo;
import com.jhta.project.vo.PetsitterBookVo;
import com.jhta.project.vo.PrevBookListVo;
import com.jhta.project.vo.ShopClassVo;
//github.com/KimDayeong00/FinalProject_3.git
import com.jhta.project.vo.memberVO;

@Controller
public class MypageController {
	@Autowired MpetInfoService mpetInfoService;
	@Autowired memberService memServcie;
	@Autowired PetsitterBookService bookService;
	@Autowired ShopService shopservice;
	@Autowired OrderListService orderservice;
	
	private String alertUrl = ".petsitter_mypage.alert";
	
	@RequestMapping("/mypage")
	public ModelAndView pageMove(@RequestParam(value="pageNum",defaultValue="1")int pageNum,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		ArrayList<BookListVo> list=new ArrayList<>();
		int login_type = (int)session.getAttribute("login_type");
		String mypage = "";
		if(login_type==1) {
			mypage = ".mypage.mypage";
			String m_email = (String)session.getAttribute("login");
			
			HashMap<String, Object> map=new HashMap<>();
			int totalRowCount = bookService.getBbookCnt(m_email);
			PageUtil pu=new PageUtil(pageNum,10,5,totalRowCount);
			map.put("m_email",m_email);
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());
			
			List<PetsitterBookVo> mbookList = bookService.getBbookCnt2(map);
			for(int i=0;i<mbookList.size();i++) {
				PetsitterBookVo vo= mbookList.get(i);
				List<MpetInfoVo> mpetList = bookService.getBpet(vo.getBk_num());
				MpetInfoVo mpetVo = mpetList.get(0);
				String pi_name = mpetVo.getPi_name();
				int count = bookService.getBpetCnt(vo.getBk_num());
				BookListVo bookList = new BookListVo(vo.getBk_num(), vo.getBk_startdate(), vo.getBk_enddate(), vo.getBk_situation(),
						vo.getM_email(),null, vo.getPs_email(), vo.getPs_name() ,count, pi_name,null);
				list.add(bookList);
			}
			memberVO memVo = memServcie.selectMember(m_email);
			session.setAttribute("m_saveimage", memVo.getM_saveimage());
			
			mv.setViewName(mypage);
			mv.addObject("pu",pu);
			mv.addObject("mbookList",list);
			mv.addObject("dtld","reservation");
			
		}else if(login_type==2) {
			ServletContext context = session.getServletContext();
			String path = context.getContextPath();
			mypage = ".petsitter_mypage.mypetsitter.petsitter_info";
			mv.addObject("page","list");
			mv.addObject("dtld","reservation");

			mv.setView(new RedirectView(path+"/mypetsitter?"));
		}
		List<ShopClassVo> classvo=shopservice.classlist();
		mv.addObject("classvo",classvo);
		//mv.setViewName(mypage);
		return mv;
	}
	
	@RequestMapping(value="/myPetInfo", method=RequestMethod.GET)
	public ModelAndView myPetInfoView(String page, String dtld, HttpSession session) {
		ModelAndView mv=new ModelAndView(".mypage.myPetInfo");
		String m_email = (String) session.getAttribute("login");
		List<MpetInfoVo> mpetList = mpetInfoService.mypetList(m_email);
		
		Calendar cc= Calendar.getInstance();
		int year = cc.get(Calendar.YEAR);
		
		System.out.println(year+"占썩도");
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("mpetList",mpetList);
		mv.addObject("year",year);
		return mv;
	}
	
	@RequestMapping(value="/myPetInfo", method=RequestMethod.POST)
	public ModelAndView ppetInfo(HttpSession session, String pi_name, String pi_sex, String pi_type, String pi_weight, String pi_year,
									String pi_month, String pi_content, String pi_gubun, MultipartFile pi_img) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String m_email = (String) session.getAttribute("login");
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		
		String msg = "";
		
		String pi_age = pi_year+pi_month;
		int pi_w = Integer.parseInt(pi_weight);
		int pi_g = Integer.parseInt(pi_gubun);
		String pi_orgfilename=pi_img.getOriginalFilename();
		String pi_savefilename =UUID.randomUUID()+"_"+pi_orgfilename;
		try {
		
			InputStream is=pi_img.getInputStream();
			String uploadPath = "C:\\Users\\Lee\\Desktop\\파이널프로젝트\\FinalProject_3\\src\\main\\webapp\\resources\\petimage\\";
			FileOutputStream fos=new FileOutputStream(uploadPath+pi_savefilename);
		
			FileCopyUtils.copy(is, fos);
			fos.close();
			is.close();
		}catch(IOException ie) {
			
		}
		
		if(pi_savefilename==null || pi_orgfilename==null) {
			pi_savefilename ="null";
			pi_orgfilename = "null";
		}
		
		MpetInfoVo vo = new MpetInfoVo(0,pi_name,pi_age,pi_type,pi_w,m_email,pi_savefilename,pi_orgfilename,pi_sex,pi_content,pi_g);
		
		int n = mpetInfoService.insertMypet(vo);
		
		mv.addObject("msg",msg);
		mv.addObject("page","petInfo");
		mv.addObject("dtld","petList");
		mv.addObject("url",path+"/myPetInfo");
	
		return mv;
	}
	
	@RequestMapping(value="/myPetInfoUpdate", method=RequestMethod.GET)
	public ModelAndView ppetInfoUpdateView(String page, String dtld, HttpSession session, String pi_num) {
		ModelAndView mv=new ModelAndView(".mypage.myPetInfo");
		String ps_email = (String) session.getAttribute("login");
		int pi_num2 = Integer.parseInt(pi_num);
		
		MpetInfoVo mpetInfo = mpetInfoService.selectPetUpdate(pi_num2);
		String[] date = mpetInfo.getPi_age().split("-");
		
		String pi_year = date[0];
		String pi_month = date[1];
		
		Calendar cc= Calendar.getInstance();
		int year = cc.get(Calendar.YEAR);
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("mpetInfo",mpetInfo);
		mv.addObject("year",year);
		mv.addObject("pi_year",pi_year);
		mv.addObject("pi_month",pi_month);
		return mv;
	}
	
	@RequestMapping(value="/myPetInfoUpdate", method=RequestMethod.POST)
	public ModelAndView ppetInfoUpdate(HttpSession session, String pi_name, String pi_sex, String pi_type, String pi_weight, String pi_year,
									String pi_month, String pi_content, String pi_num, String pi_gubun) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String m_email = (String) session.getAttribute("login");
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		
		String msg = "占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占싹울옙占쏙옙占싹댐옙.";
		
		String pi_age = pi_year+pi_month;
		int pi_w = Integer.parseInt(pi_weight);
		int pi_n = Integer.parseInt(pi_num);
		int pi_g = Integer.parseInt(pi_gubun);
		
		MpetInfoVo vo = new MpetInfoVo(pi_n,pi_name,pi_age,pi_type,pi_w,m_email,"savefile","orgfile",pi_sex,pi_content,pi_g);
		
		int n = mpetInfoService.updateMypet(vo);
		
		if(n>0) {
			msg = "占쌥뤄옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占실억옙占쏙옙占싹댐옙.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("page","petInfo");
		mv.addObject("dtld","petList");
		mv.addObject("url",path+"/myPetInfo");
	
		return mv;
	}
	
	@RequestMapping(value="/myPetDetail", method=RequestMethod.GET)
	public ModelAndView myPetDetailView(String page, String dtld, HttpSession session,String pi_num) {
		ModelAndView mv=new ModelAndView(".mypage.myPetInfo");
		String m_email = (String) session.getAttribute("login");
		int pi_n = Integer.parseInt(pi_num);
		
		MpetInfoVo mpetInfo = mpetInfoService.selectPetUpdate(pi_n);
		String[] date = mpetInfo.getPi_age().split("-");
		
		String pi_year = date[0];
		String pi_month = date[1];
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("pi_year",pi_year);
		mv.addObject("pi_month",pi_month);
		mv.addObject("mpetInfo",mpetInfo);
		return mv;
	}

	@RequestMapping(value="/my_account", method=RequestMethod.GET)
	public ModelAndView psInfoUpdateView(String page, String dtld, HttpSession session) {
		ModelAndView mv=new ModelAndView(".mypage.myInfo");
		String m_email = (String) session.getAttribute("login");
		
		memberVO memVo = memServcie.selectMember(m_email);
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("memberVo",memVo);
		return mv;
	}
	
	@RequestMapping(value="/my_account", method=RequestMethod.POST)
	public ModelAndView psInfoUpdate(HttpSession session, String m_name, String m_addr, String m_phone, String m_content) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String m_email = (String) session.getAttribute("login");
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		String msg = "占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占싹울옙占쏙옙占싹댐옙.";
		
		memberVO memVo = new memberVO(m_email,null,m_name,m_phone,m_addr,null,null,0,null,null);
		int n = memServcie.updateMember(memVo);
		
		if(n>0) {
			msg = "회占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占실억옙占쏙옙占싹댐옙.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("page","account");
		mv.addObject("dtld","accountUpdate");
		mv.addObject("url",path+"/my_account");
	
		return mv;
	}
	
	@RequestMapping(value="/my_pwdUpdate", method=RequestMethod.POST)
	public ModelAndView ps_pwdUpdate(HttpSession session, String m_pwd) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String m_email = (String) session.getAttribute("login");
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		String msg = "占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占싹울옙占쏙옙占싹댐옙.";
		
		memberVO memVo = new memberVO(m_email,m_pwd,null,null,null,null,null,0,null,null);	
		int n = memServcie.updatePwd(memVo);
		
		if(n>0) {
			msg = "占쏙옙橘占싫ｏ옙占� 占쏙옙占쏙옙占실억옙占쏙옙占싹댐옙.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("page","account");
		mv.addObject("dtld","accountUpdate");
		mv.addObject("url",path+"/my_account");
	
		return mv;
	}
	
	@RequestMapping("/mypageShop")
	public ModelAndView myPageShop(HttpSession session) {
		ModelAndView mv=new ModelAndView(".mypage.mypageShop");
		String m_email=(String)session.getAttribute("login");
		System.out.println(m_email);
		List<OrderJoinVo> orderlist=orderservice.orderlist(m_email);
		System.out.println("踰��몃��"+orderlist);
		for(OrderJoinVo vo:orderlist) {
			
		System.out.print(vo.getBuy_num()+ " " + vo.getM_email());
		List<OrderItemVo>  list=vo.getList();
			for(OrderItemVo vv:list ) {
				System.out.println("리스트"+vv);
			}
		}
		List<ShopClassVo> classvo=shopservice.classlist();
		mv.addObject("classvo",classvo);
		mv.addObject("orderlist",orderlist);
		return mv;
	}
	
	@RequestMapping("/mypagePrevlist")
	public ModelAndView myPrevBook(@RequestParam(value="pageNum",defaultValue="1")int pageNum,String page, String dtld, HttpSession session) {
		ModelAndView mv=new ModelAndView(".mypage.mypage");
		ArrayList<PrevBookListVo> list=new ArrayList<>();
		String m_email = (String)session.getAttribute("login");
		
		HashMap<String, Object> map=new HashMap<>();
		int totalRowCount = bookService.getPrevListCnt(m_email);
		PageUtil pu=new PageUtil(pageNum,10,5,totalRowCount);
		map.put("m_email",m_email);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<PetsitterBookVo> prevList = bookService.getPrevListCnt2(map);
		for(int i=0;i<prevList.size();i++) {
			PetsitterBookVo vo= prevList.get(i);
			List<MpetInfoVo> mpetList = bookService.getBpet(vo.getBk_num());
			MpetInfoVo mpetVo = mpetList.get(0);
			String pi_name = mpetVo.getPi_name();
			int count = bookService.getBpetCnt(vo.getBk_num());
			PrevBookListVo prevBookList = new PrevBookListVo(vo.getBk_num(),vo.getBk_startdate(),vo.getBk_enddate(),vo.getBk_situation(),vo.getM_email(),
					vo.getPs_email(),vo.getPs_name(),count,pi_name,vo.getBk_review());
			list.add(prevBookList);
		}
		mv.addObject("pu",pu);
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("prevList",list);
		
		return mv;
	}
	
	@RequestMapping("/mypageLeave")
	public String memberLeave(HttpSession session) {
		String m_email = (String) session.getAttribute("login");
		System.out.println("email"+m_email);
		memServcie.deleteMember(m_email);
		session.invalidate();
		return ".mypage.leave";
	}
	
}
