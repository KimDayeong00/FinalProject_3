package com.jhta.project.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.DisableDateService;
import com.jhta.project.service.FilterService;
import com.jhta.project.service.PetSitterImageServiceImpl;
import com.jhta.project.service.PetSitterServiceImpl;
import com.jhta.project.service.PetsitterBookService;
import com.jhta.project.service.PetsitterOptionService;
import com.jhta.project.service.PetsitterPriceService;
import com.jhta.project.service.PpetInfoService;
import com.jhta.project.service.ReviewService;
import com.jhta.project.service.ShopService;
import com.jhta.project.util.PageUtil;
import com.jhta.project.vo.BookListVo;
//github.com/KimDayeong00/FinalProject_3.git
import com.jhta.project.vo.DisableDateVo;
import com.jhta.project.vo.MpetInfoVo;
import com.jhta.project.vo.PetSitterFilterVo;
import com.jhta.project.vo.PetSitterImageVo;
import com.jhta.project.vo.PetSitterPriceVo;
import com.jhta.project.vo.PetSitterVo;
import com.jhta.project.vo.PetsitterBookVo;
import com.jhta.project.vo.PetsitterOptionVo;
import com.jhta.project.vo.PetsitterPetVo;
import com.jhta.project.vo.ShopClassVo;

@Controller
public class PetsitterPageController {
	@Autowired DisableDateService service;
	@Autowired PetsitterOptionService service2;
	@Autowired PetSitterImageServiceImpl imageService;
	@Autowired FilterService filterService;
	@Autowired PetSitterServiceImpl service3;
	@Autowired PpetInfoService petInfoService;
	@Autowired PetSitterServiceImpl petsitterService;
	@Autowired ShopService service99;
	@Autowired PetsitterBookService bookService;
	@Autowired PetsitterPriceService priceService;
	@Autowired ReviewService rvService;
	
	private String url = ".petsitter_mypage.mypetsitter.petsitter_info";
	private String alertUrl = ".petsitter_mypage.alert";
	
	@RequestMapping("/mypetsitter")
	public ModelAndView pageMove(@RequestParam(value="pageNum",defaultValue="1")int pageNum, String page, String dtld, HttpSession session) {
		ModelAndView mv=new ModelAndView(url);
		ArrayList<BookListVo> list=new ArrayList<>();
		String ps_email = (String) session.getAttribute("login");
		if(page==null) {
			page = "list";
			dtld = "reservation";
		}
		
		List<DisableDateVo> disablelist = service.getDisable(ps_email);
		List<ShopClassVo> classvo=service99.classlist();
		mv.addObject("classvo",classvo);
		//List<PetsitterBookVo> pbookList = bookService.selectPbookList(ps_email);
//		for(int i=0;i<pbookList.size();i++) {
//			PetsitterBookVo vo= pbookList.get(i);
//			List<MpetInfoVo> mpetList = bookService.getBpet(vo.getBk_num());
//			MpetInfoVo mpetVo = mpetList.get(0);
//			String pi_name = mpetVo.getPi_name();
//			int count = bookService.getBpetCnt(vo.getBk_num());
//			BookListVo bookList = new BookListVo(vo.getBk_num(), vo.getBk_startdate(), vo.getBk_enddate(), vo.getBk_situation(),
//					vo.getM_email(),vo.getM_name(),vo.getPs_email(),vo.getPs_name(),count,pi_name,vo.getBk_content());
//			list.add(bookList);
//			
//		}
		HashMap<String, Object> map=new HashMap<>();
		
		int totalRowCount = bookService.getPbookCnt(ps_email);
		PageUtil pu=new PageUtil(pageNum,10,5,totalRowCount);
		map.put("ps_email",ps_email);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<PetsitterBookVo> pbookList = bookService.getPbookCnt2(map);
		
		for(int i=0;i<pbookList.size();i++) {
			PetsitterBookVo vo= pbookList.get(i);
			System.out.println("numberdkfajlsd:"+vo.getBk_num());
			List<MpetInfoVo> mpetList = bookService.getBpet(vo.getBk_num());
				MpetInfoVo mpetVo = mpetList.get(0);
				String pi_name = mpetVo.getPi_name();
				int count = bookService.getBpetCnt(vo.getBk_num());
				BookListVo bookList = new BookListVo(vo.getBk_num(), vo.getBk_startdate(), vo.getBk_enddate(), vo.getBk_situation(),
						vo.getM_email(),vo.getM_name(),vo.getPs_email(),vo.getPs_name(),count,pi_name,vo.getBk_content());
				list.add(bookList);
			
		}
		
		PetSitterVo sitterVo = petsitterService.select(ps_email);
		System.out.println("ps_saveimageadfsdf:"+sitterVo.getPs_saveimage());
		session.setAttribute("ps_saveimage", sitterVo.getPs_saveimage());
		mv.addObject("sitterVo",sitterVo);
		mv.addObject("pu",pu);
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
			mv.addObject("msg","�ㅻ�濡� �명�� �ㅽ�⑦�����듬����");
		}else{
			mv.addObject("msg","�ㅼ���� ��猷������듬����");
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
		System.out.println("�대���"+ps_email);
		
		PetsitterOptionVo optionVo = service2.getOption(ps_email);
		List<PetSitterImageVo> ps_imgVo = imageService.getImg(ps_email);
		List<ShopClassVo> classvo=service99.classlist();
		mv.addObject("classvo",classvo);
		PetSitterPriceVo priceVo= priceService.select(ps_email);
		PetSitterVo sitterVo = petsitterService.select(ps_email);
		System.out.println("sitterVo () : "+sitterVo.getPs_active());
		mv.addObject("sitterVo",sitterVo);
		mv.addObject("priceVo",priceVo);
		mv.addObject("optionVo",optionVo);
		mv.addObject("ps_imgVo",ps_imgVo);
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		
		return mv;
	}
	
	@RequestMapping(value="/psinfoSet", method=RequestMethod.POST)
	public ModelAndView psinfoSet(String checkinStart, String checkinEnd, String checkoutStart,
			String checkoutEnd, String houseSelect, String houseType, String yardSelect, String familySelect, String familyNum, 
			String childSelect, String childNum, String subway, String otherpetSelect, String otherpetNum, 
			String ps_price, String ps_careprice, String ps_overprice, String ps_active,HttpSession session) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String ps_email = (String) session.getAttribute("login");
		String po_space = houseSelect;
		if(ps_active!=null) {
			petsitterService.updateActiveOn(ps_email);
		}else {
			petsitterService.updateActiveOff(ps_email);
		}
		int price = Integer.parseInt(ps_price);
		int careprice = Integer.parseInt(ps_careprice);
		int overprice = Integer.parseInt(ps_overprice);
		
		int po_yard = Integer.parseInt(yardSelect);
		int po_child = Integer.parseInt(childSelect);
		int po_family = Integer.parseInt(familySelect);
		int po_otherpet = Integer.parseInt(otherpetSelect);
		if(houseSelect.equals("湲고��")) {
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
		
		PetSitterPriceVo priceVo = new PetSitterPriceVo(ps_email,price,careprice,overprice);
		int k = priceService.updatePrice(priceVo);
		
		int n = service2.updatePsInfoSet(vo);
		
		if(n<0 || k<0) {
			mv.addObject("msg","�ㅻ�濡� �명�� �ㅽ�⑦�����듬����");
		}else{
			mv.addObject("msg","�ㅼ���� ��猷������듬����");
		}
		
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		
		List<ShopClassVo> classvo=service99.classlist();
		mv.addObject("classvo",classvo);
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
		String msg = "�ㅻ�濡� �명�� �ㅽ�⑦�����듬����.";
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		
		filterService.deleteFilter(ps_email);
		int n = filterService.insertFilter(chFilter, ps_email);
		
		if(n>0){
			msg="�ㅼ���� ��猷������듬����.";
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
		
		System.out.println(year+"����");
		
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
		
		String msg = "�ㅻ�濡� �명�� �ㅽ�⑦�����듬����.";
		
		String pi_age = pi_year+pi_month;
		int pi_w = Integer.parseInt(pi_weight);
		int pi_g = Integer.parseInt(pi_gubun);
		
		PetsitterPetVo vo = new PetsitterPetVo(0,pi_name,pi_age,pi_type,pi_w,pi_content,ps_email,"savefile","orgfile",pi_sex,pi_g);
		int n = petInfoService.insertPpetInfo(vo);
		
		if(n>0) {
			msg = "諛��ㅺ껄�� 異�媛������듬����.";
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
		
		String msg = "�ㅻ�濡� �명�� �ㅽ�⑦�����듬����.";
		
		String pi_age = pi_year+pi_month;
		int pi_w = Integer.parseInt(pi_weight);
		int pi_g = Integer.parseInt(pi_gubun);
		int pi_n = Integer.parseInt(pi_num);
		
		PetsitterPetVo vo = new PetsitterPetVo(pi_n,pi_name,pi_age,pi_type,pi_w,pi_content,ps_email,"savefile","orgfile",pi_sex,pi_g);
		int n = petInfoService.petUpdate(vo);
		
		if(n>0) {
			msg = "諛��ㅺ껄 ��蹂닿� ���������듬����.";
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
		mv.addObject("sitterVo",sitterVo);
		
		mv.addObject("page",page);
		mv.addObject("dtld",dtld);
		return mv;
	}
	
	@RequestMapping(value="/ps_account", method=RequestMethod.POST)
	public ModelAndView psInfoUpdate(HttpSession session, String ps_name, String ps_addr1, String ps_addr2, String ps_phone, String ps_content,
									String ps_lat, String ps_lng) {
		ModelAndView mv=new ModelAndView(alertUrl);
		String ps_email = (String) session.getAttribute("login");
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		String msg = "�ㅻ�濡� �명�� �ㅽ�⑦�����듬����.";
		
		double lat = Double.parseDouble(ps_lat);
		double lng = Double.parseDouble(ps_lng);
		
		System.out.println("lat媛�:"+lat+" lng媛�:"+lng);
		
		PetSitterVo sitterVo = new PetSitterVo(ps_email,null,ps_phone,ps_name,ps_addr1,ps_addr2,ps_content,null,lat,lng,null,null,0,0,0);
		
		int n = petsitterService.updateAccount(sitterVo);
		
		if(n>0) {
			msg = "�レ���� ��蹂닿� ���������듬����.";
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
		String msg = "�ㅻ�濡� �명�� �ㅽ�⑦�����듬����.";
		
		PetSitterVo sitterVo = new PetSitterVo(ps_email,ps_pwd,null,null,null,null,null,null,0,0,null,null,0,0,0);
		
		int n = petsitterService.updatePwd(sitterVo);
		
		if(n>0) {
			msg = "鍮�諛�踰��멸� ���������듬����.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("page","account");
		mv.addObject("dtld","accountUpdate");
		mv.addObject("url",path+"/ps_account");
	
		return mv;
	}
	
	@RequestMapping("/ps_complete")
	public ModelAndView bookComplete(String bk_num,HttpSession session) {
		ModelAndView mv=new ModelAndView(alertUrl);
		ServletContext context = session.getServletContext();
		String path = context.getContextPath();
		String msg = "�ㅻ�濡� �명�� �ㅽ�⑦�����듬����.";
		
		System.out.println("complete"+bk_num);
		
		int bnum = Integer.parseInt(bk_num);
		
		int n = bookService.completeBook(bnum);
		if(n>0) {
			msg = "��猷������듬����";
		}
		mv.addObject("msg",msg);
		mv.addObject("page","list");
		mv.addObject("dtld","reservation");
		mv.addObject("url",path+"/mypetsitter");
		
		return mv;
	}
	
	@RequestMapping("/petsitterLeave")
	public String ps_leave (HttpSession session) {
		String ps_email = (String) session.getAttribute("login");
		int n = petsitterService.deletePetsitter(ps_email);
		if(n>0) {
			session.invalidate();
			return ".mypage.leave";
		}else {
			session.setAttribute("rlt", "fail");
			 return ".members.success";
		}
	}
	
	@RequestMapping("/contentDetail")
	public ModelAndView reviewDetail(String bk_num) {
		ModelAndView mv=new ModelAndView("/petsitter_mypage/mypetsitter/bk_contentPop");
		String bk_content = bookService.selectBk_content(Integer.parseInt(bk_num));
		
		mv.addObject("bk_content",bk_content);
		return mv;
	}
}
