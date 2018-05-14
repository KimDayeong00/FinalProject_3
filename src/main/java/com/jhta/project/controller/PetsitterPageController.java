package com.jhta.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.dao.FilterDao;
import com.jhta.project.service.DisableDateService;
import com.jhta.project.service.FilterService;
import com.jhta.project.service.PetSitterImageService;
import com.jhta.project.service.PetSitterImageServiceImpl;
import com.jhta.project.service.PetSitterServiceImpl;
import com.jhta.project.service.PetsitterBookService;
import com.jhta.project.service.PetsitterOptionService;
import com.jhta.project.service.PpetInfoService;
import com.jhta.project.vo.BookListVo;
import com.jhta.project.vo.DisableDateVo;
import com.jhta.project.vo.MpetInfoVo;
import com.jhta.project.vo.PetSitterFilterVo;
import com.jhta.project.vo.PetSitterImageVo;
import com.jhta.project.vo.PetSitterVo;
import com.jhta.project.vo.PetsitterBookVo;
import com.jhta.project.vo.PetsitterOptionVo;
import com.jhta.project.vo.PetsitterPetVo;

@Controller
public class PetsitterPageController {
	@Autowired DisableDateService service;
	@Autowired PetsitterOptionService service2;
	@Autowired PetSitterImageServiceImpl imageService;
	@Autowired FilterService filterService;
	@Autowired PetSitterServiceImpl service3;
	@Autowired PpetInfoService petInfoService;
	@Autowired PetSitterServiceImpl petsitterService;
	@Autowired PetsitterBookService bookService;
	private String url = ".petsitter_mypage.mypetsitter.petsitter_info";
	private String alertUrl = ".petsitter_mypage.alert";
	
	@RequestMapping("/mypetsitter")
	public ModelAndView pageMove(String page, String dtld, HttpSession session) {
		ModelAndView mv=new ModelAndView(url);
		ArrayList<BookListVo> list=new ArrayList<>();
		String ps_email = (String) session.getAttribute("login");
		if(page==null) {
			page = "list";
			dtld = "reservation";
		}
		
		List<DisableDateVo> disablelist = service.getDisable(ps_email);
		List<PetsitterBookVo> pbookList = bookService.selectPbookList(ps_email);
		for(int i=0;i<pbookList.size();i++) {
			PetsitterBookVo vo= pbookList.get(i);
			List<MpetInfoVo> mpetList = bookService.getBpet(vo.getBk_num());
			MpetInfoVo mpetVo = mpetList.get(0);
			String pi_name = mpetVo.getPi_name();
			int count = bookService.getBpetCnt(vo.getBk_num());
			BookListVo bookList = new BookListVo(vo.getBk_num(), vo.getBk_startdate(), vo.getBk_enddate(), vo.getBk_situation(),
					vo.getM_email(),vo.getM_name(),vo.getPs_email(),vo.getPs_name(),count,pi_name,vo.getBk_content());
			list.add(bookList);
		}
		
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("disableList",disablelist);
		mv.addObject("pbookList",list);
		
		return mv;
	}
	
	@RequestMapping("/disableSet")
	public ModelAndView disableSet(String disdate, String[] dayCheck, HttpSession session) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String ps_email = (String) session.getAttribute("login");
		String disday = "";
		for(int i=0;i<dayCheck.length;i++) {
			disday += dayCheck[i];
			if(i!=(dayCheck.length-1)) {
				disday += ",";
			}
		}
		DisableDateVo vo=new DisableDateVo(disday,disdate,ps_email);
		int n = service.updateDis(vo);
		mv.addObject("page","list");
		mv.addObject("dtld","reservationSet");
		if(n<0) {
			mv.addObject("msg","오류로 인해 실패하였습니다");
		}else{
			mv.addObject("msg","설정이 완료되었습니다");
		}
		
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		
		mv.addObject("url",path+"/mypetsitter");
		return mv;
	}
	
	@RequestMapping(value="/psinfoSet", method=RequestMethod.GET)
	public ModelAndView psinfoSetView(String page, String dtld, HttpSession session) {
		ModelAndView mv=new ModelAndView(url);
		String ps_email = (String) session.getAttribute("login");
		System.out.println("이메일"+ps_email);
		
		PetsitterOptionVo optionVo = service2.getOption(ps_email);
		List<PetSitterImageVo> ps_imgVo = imageService.getImg(ps_email);
		
		mv.addObject("optionVo",optionVo);
		mv.addObject("ps_imgVo",ps_imgVo);
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		
		return mv;
	}
	
	@RequestMapping(value="/psinfoSet", method=RequestMethod.POST)
	public ModelAndView psinfoSet(String checkinStart, String checkinEnd, String checkoutStart,
			String checkoutEnd, String houseSelect, String houseType, String yardSelect, String familySelect, String familyNum, 
			String childSelect, String childNum, String subway, String otherpetSelect, String otherpetNum, HttpSession session) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String ps_email = (String) session.getAttribute("login");
		String po_space = houseSelect;
		int po_yard = Integer.parseInt(yardSelect);
		int po_child = Integer.parseInt(childSelect);
		int po_family = Integer.parseInt(familySelect);
		int po_otherpet = Integer.parseInt(otherpetSelect);
		if(houseSelect.equals("기타")) {
			po_space = houseType; 
		}
		if(po_child==1) {
			po_child = Integer.parseInt(childNum);
		}
		if(po_family==1) {
			po_family = Integer.parseInt(familyNum);
		}
		if(po_otherpet==1) {
			po_otherpet = Integer.parseInt(otherpetNum);
		}
		
		PetsitterOptionVo vo=new PetsitterOptionVo(ps_email,checkinStart,checkinEnd,checkoutStart,checkoutEnd,po_space,subway,
				po_yard,po_child,po_family,po_otherpet);
		int n = service2.updatePsInfoSet(vo);
		
		if(n<0) {
			mv.addObject("msg","오류로 인해 실패하였습니다");
		}else{
			mv.addObject("msg","설정이 완료되었습니다");
		}
		
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		
		//mv.addObject("ps_email",ps_email);
		mv.addObject("page","sitterInfo");
		mv.addObject("dtld","psInfoSet");
		mv.addObject("ps_email",ps_email);
		mv.addObject("url",path+"/psinfoSet");
		
		return mv;
	}
	
//	@RequestMapping(value="/ps_imgTest",method=RequestMethod.POST,produces="application/json;charset=utf-8")
//	@ResponseBody
//	public String ps_imgTest(MultipartHttpServletRequest multi) {
//		String root = multi.getSession().getServletContext().getRealPath("/");
//		String path = root+"resources/upload/";
//		String ps_email = (String) multi.getSession().getAttribute("login");
//		
//		String savefilename = "";
//		String orgfilename = "";
//		File dir = new File(path);
//		if(!dir.isDirectory()) {
//			dir.mkdirs();
//		}
//		
//		Iterator<String> files = multi.getFileNames();
//		while(files.hasNext()) {
//			String uploadFile = files.next();
//			
//			MultipartFile mf = multi.getFile(uploadFile);
//			orgfilename = mf.getOriginalFilename();
//			savefilename=UUID.randomUUID() +"_" + orgfilename;
//			
//			try {
//				mf.transferTo(new File(path+savefilename));
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		System.out.println("filename:"+savefilename);
//		int pimg_num = Integer.parseInt(multi.getParameter("pimg_num"));
//		
//		PetSitterImageVo vo=new PetSitterImageVo(pimg_num,ps_email , savefilename, orgfilename);
//		int n = imageService.insert(vo);
//		String msg = "fail";
//		if(n>0) {
//			msg = "success";
//		}
//		
//		JSONObject ob=new JSONObject();
//		ob.put("msg", msg);
//		ob.put("pimg_num",vo.getPimg_num());
//		ob.put("pimg_savefilename", vo.getPimg_savefilename());
//		return ob.toString();
//	}
	
	@RequestMapping(value="/filterSet", method=RequestMethod.GET)
	public ModelAndView filterSetView(String page, String dtld, HttpSession session) {
		ModelAndView mv=new ModelAndView(url);
		String ps_email = (String) session.getAttribute("login");
		
		List<PetSitterFilterVo> filterList = service3.getFilter(ps_email);
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("filterList",filterList);
		
		return mv;
	}
	
	@RequestMapping(value="/filterSet", method=RequestMethod.POST)
	public ModelAndView filterSet(String[] chFilter, HttpSession session) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String ps_email = (String) session.getAttribute("login");
		String msg = "오류로 인해 실패하였습니다.";
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		
		filterService.deleteFilter(ps_email);
		int n = filterService.insertFilter(chFilter, ps_email);
		
		if(n>0){
			msg="설정이 완료되었습니다.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("page","sitterInfo");
		mv.addObject("dtld","filterSet");
		mv.addObject("url",path+"/filterSet");
		
		return mv;
	}
	
	@RequestMapping(value="/petInfo", method=RequestMethod.GET)
	public ModelAndView ppetInfoView(String page, String dtld, HttpSession session) {
		ModelAndView mv=new ModelAndView(url);
		String ps_email = (String) session.getAttribute("login");
		
		List<PetsitterPetVo> ppetList = petInfoService.select(ps_email);
		
		Calendar cc= Calendar.getInstance();
		int year = cc.get(Calendar.YEAR);
		
		System.out.println(year+"년도");
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("ppetList",ppetList);
		mv.addObject("year",year);
		return mv;
	}
	
	@RequestMapping(value="/petInfo", method=RequestMethod.POST)
	public ModelAndView ppetInfo(HttpSession session, String pi_name, String pi_gubun, String pi_sex, String pi_type, String pi_weight, String pi_year,
									String pi_month, String pi_content) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String ps_email = (String) session.getAttribute("login");
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		
		String msg = "오류로 인해 실패하였습니다.";
		
		String pi_age = pi_year+pi_month;
		int pi_w = Integer.parseInt(pi_weight);
		int pi_g = Integer.parseInt(pi_gubun);
		
		PetsitterPetVo vo = new PetsitterPetVo(0,pi_name,pi_age,pi_type,pi_w,pi_content,ps_email,"savefile","orgfile",pi_sex,pi_g);
		int n = petInfoService.insertPpetInfo(vo);
		
		if(n>0) {
			msg = "반려견이 추가되었습니다.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("page","petInfo");
		mv.addObject("dtld","ppetList");
		mv.addObject("url",path+"/petInfo");
	
		return mv;
	}
	
	@RequestMapping(value="/petInfoUpdate", method=RequestMethod.GET)
	public ModelAndView ppetInfoUpdateView(String page, String dtld, HttpSession session, String pi_num) {
		ModelAndView mv=new ModelAndView(url);
		String ps_email = (String) session.getAttribute("login");
		int pi_num2 = Integer.parseInt(pi_num);
		
		PetsitterPetVo ppetInfo = petInfoService.selectPetUpdate(pi_num2);
		String[] date = ppetInfo.getPi_age().split("-");
		
		String pi_year = date[0];
		String pi_month = date[1];
		
		Calendar cc= Calendar.getInstance();
		int year = cc.get(Calendar.YEAR);
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("ppetInfo",ppetInfo);
		mv.addObject("year",year);
		mv.addObject("pi_year",pi_year);
		mv.addObject("pi_month",pi_month);
		return mv;
	}
	
	@RequestMapping(value="/petInfoUpdate", method=RequestMethod.POST)
	public ModelAndView ppetInfoUpdate(HttpSession session, String pi_name, String pi_gubun, String pi_sex, String pi_type, String pi_weight, String pi_year,
									String pi_month, String pi_content, String pi_num) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String ps_email = (String) session.getAttribute("login");
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		
		String msg = "오류로 인해 실패하였습니다.";
		
		String pi_age = pi_year+pi_month;
		int pi_w = Integer.parseInt(pi_weight);
		int pi_g = Integer.parseInt(pi_gubun);
		int pi_n = Integer.parseInt(pi_num);
		
		PetsitterPetVo vo = new PetsitterPetVo(pi_n,pi_name,pi_age,pi_type,pi_w,pi_content,ps_email,"savefile","orgfile",pi_sex,pi_g);
		int n = petInfoService.petUpdate(vo);
		
		if(n>0) {
			msg = "반려견 정보가 수정되었습니다.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("page","petInfo");
		mv.addObject("dtld","ppetList");
		mv.addObject("url",path+"/petInfo");
	
		return mv;
	}
	
	@RequestMapping(value="/PpetDetail", method=RequestMethod.GET)
	public ModelAndView myPetDetailView(String page, String dtld, HttpSession session,String pi_num) {
		ModelAndView mv=new ModelAndView(url);
		String m_email = (String) session.getAttribute("login");
		int pi_n = Integer.parseInt(pi_num);
		
		PetsitterPetVo ppetInfo = petInfoService.selectPetUpdate(pi_n);
		String[] date = ppetInfo.getPi_age().split("-");
		
		String pi_year = date[0];
		String pi_month = date[1];
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("pi_year",pi_year);
		mv.addObject("pi_month",pi_month);
		mv.addObject("ppetInfo",ppetInfo);
		return mv;
	}
	
	@RequestMapping(value="/ps_account", method=RequestMethod.GET)
	public ModelAndView psInfoUpdateView(String page, String dtld, HttpSession session) {
		ModelAndView mv=new ModelAndView(url);
		String ps_email = (String) session.getAttribute("login");
		
		PetSitterVo sitterVo = petsitterService.select(ps_email);
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		mv.addObject("sitterVo",sitterVo);
		return mv;
	}
	
	@RequestMapping(value="/ps_account", method=RequestMethod.POST)
	public ModelAndView psInfoUpdate(HttpSession session, String ps_name, String ps_addr1, String ps_addr2, String ps_phone, String ps_content,
									String ps_lat, String ps_lng) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String ps_email = (String) session.getAttribute("login");
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		String msg = "오류로 인해 실패하였습니다.";
		
		double lat = Double.parseDouble(ps_lat);
		double lng = Double.parseDouble(ps_lng);
		
		System.out.println("lat값:"+lat+" lng값:"+lng);
		
		PetSitterVo sitterVo = new PetSitterVo(ps_email,null,ps_phone,ps_name,ps_addr1,ps_addr2,ps_content,null,lat,lng,null,null,0,0,0);
		
		int n = petsitterService.updateAccount(sitterVo);
		
		if(n>0) {
			msg = "펫시터 정보가 수정되었습니다.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("page","account");
		mv.addObject("dtld","accountUpdate");
		mv.addObject("url",path+"/ps_account");
	
		return mv;
	}
	
	@RequestMapping(value="/ps_pwdUpdate", method=RequestMethod.POST)
	public ModelAndView ps_pwdUpdate(HttpSession session, String ps_pwd) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String ps_email = (String) session.getAttribute("login");
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		String msg = "오류로 인해 실패하였습니다.";
		
		PetSitterVo sitterVo = new PetSitterVo(ps_email,ps_pwd,null,null,null,null,null,null,0,0,null,null,0,0,0);
		
		int n = petsitterService.updatePwd(sitterVo);
		
		if(n>0) {
			msg = "비밀번호가 수정되었습니다.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("page","account");
		mv.addObject("dtld","accountUpdate");
		mv.addObject("url",path+"/ps_account");
	
		return mv;
	}
}
