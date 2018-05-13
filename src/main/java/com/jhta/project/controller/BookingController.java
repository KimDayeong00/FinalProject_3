package com.jhta.project.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.project.service.FilterTypeListService;
import com.jhta.project.service.PetSitterImageService;
import com.jhta.project.service.PetSitterService;
import com.jhta.project.vo.FilterTypeListVo;
import com.jhta.project.vo.FilterVo;
import com.jhta.project.vo.PetSitterImageVo;
import com.jhta.project.vo.PetSitterJoinFilterVo;

@Controller
public class BookingController {
	
	@Autowired private PetSitterService psetsitterservice;
	@Autowired private PetSitterImageService imageService;
	@Autowired private FilterTypeListService filterTypeListService;
	
	@RequestMapping(value="/booking/list",method=RequestMethod.GET)
	public String list(Model model,Date bk_startdate,Date bk_enddate) {
		HashMap<String, Object>map = new HashMap<>();
		map.put("bk_startdate", bk_startdate);
		map.put("bk_enddate", bk_enddate);
		List<PetSitterJoinFilterVo> alllist=psetsitterservice.alllist(map);
		for(PetSitterJoinFilterVo vo : alllist) {
			for(FilterVo vo1 : vo.getList()) {
				System.out.println(vo1.getFl_name());
			}
		}
		List<FilterTypeListVo>filterlist = filterTypeListService.list();
		model.addAttribute("alllist", alllist);
		model.addAttribute("filterlist", filterlist);
		return ".booking.list";
	}
	@RequestMapping(value="/booking/list",produces="application/json;charset=utf-8")
	@ResponseBody
	public String jsonlist(String lat ,String lng, String leftlat, String leftlng,String rightlat,String rightlng,Date bk_startdate,Date bk_enddate,String[] filterchk,int chklength) {
		System.out.println("bk_startdate:"+bk_startdate);
		System.out.println("bk_enddate:"+bk_enddate);
		HashMap<String, Object>map = new HashMap<>();
		map.put("lat", lat);
		map.put("lng", lng);
		map.put("leftlat", leftlat);
		map.put("leftlng", leftlng);
		map.put("rightlat", rightlat);
		map.put("rightlng", rightlng);
		map.put("bk_startdate", bk_startdate);
		map.put("bk_enddate", bk_enddate);
		for(int i=0; i<filterchk.length; i++) {
			filterchk[i]=filterchk[i].replaceAll("[\"\\[\\]]", "");
			System.out.println("filterchk[i] : "+filterchk[i]);
		}
		map.put("filterchk", filterchk);
		System.out.println("chklength : "+ chklength);
		map.put("chklength", chklength);
		List<PetSitterJoinFilterVo> list=psetsitterservice.list(map);
		JSONObject obj=new JSONObject();
		if(list!=null) {
			obj.put("list",list);
		}else {
			System.out.println("없는값");
		}
		return obj.toString();
	}
	@RequestMapping(value="/booking/map",produces="application/json;charset=utf-8")
	@ResponseBody
	public String jsonmap(Date bk_startdate,Date bk_enddate,String[] filterchk,int chklength) {
		System.out.println("bk_startdate:"+bk_startdate);
		System.out.println("bk_enddate:"+bk_enddate);
		HashMap<String, Object>map = new HashMap<>();
		map.put("bk_startdate", bk_startdate);
		map.put("bk_enddate", bk_enddate);
		for(int i=0; i<filterchk.length; i++) {
			filterchk[i]=filterchk[i].replaceAll("[\"\\[\\]]", "");
		}
		map.put("filterchk", filterchk);
		map.put("chklength", chklength);
		List<PetSitterJoinFilterVo> alllist=psetsitterservice.alllist(map);
		JSONObject obj=new JSONObject();
		if(alllist!=null) {
			obj.put("alllist",alllist);
		}else {
			System.out.println("없는값");
		}
		return obj.toString();
	}
	@RequestMapping("/booking/test")
	public String llist() {
		return ".booking.test";
	}
	@RequestMapping(value="/file/testOk",method=RequestMethod.POST)
	public String upload(MultipartFile file1,HttpSession session) {
		String uploadPath=session.getServletContext().getRealPath("/resources/upload");
		//전송된 파일명 얻어오기
		String orgfilename=file1.getOriginalFilename();
		//저장할 파일명 만들기(중복되지 않도록)
		String savefilename=UUID.randomUUID() +"_" + orgfilename;
		try {
			////////////////////// 1.파일업로드 //////////////////////////////////
			//전송된 파일을 읽어오기 위한 스트림
			InputStream is=file1.getInputStream();
			//서버에 저장하기 위한 파일스트림객체
			FileOutputStream fos=new FileOutputStream(uploadPath +"\\" + savefilename);
			//파일복사하기
			FileCopyUtils.copy(is,fos);
			fos.close();
			is.close();
			System.out.println(uploadPath +"\\" + savefilename +" [파일업로드성공!]");
		    ////////////////////////////////////////////////////////////////////////////
			///////////////////// 2. DB저장 ////////////////////////////////////////////
			long filesize=file1.getSize();//파일크기 구하기
			PetSitterImageVo vo=new PetSitterImageVo(0,"A@A.COM" , savefilename, orgfilename);
			imageService.insert(vo);
			////////////////////////////////////////////////////////////////////////////
			return ".booking.list";
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return "/booking/list";
		}
	}
}
