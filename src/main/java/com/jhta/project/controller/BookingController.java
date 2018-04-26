package com.jhta.project.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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

import com.jhta.project.service.PetSitterImageService;
import com.jhta.project.service.PetSitterService;
import com.jhta.project.vo.PetSitterImageVo;
import com.jhta.project.vo.PetSitterJoinFilterVo;

@Controller
public class BookingController {
	
	@Autowired private PetSitterService psetsitterservice;
	@Autowired private PetSitterImageService imageService;
	@RequestMapping(value="/booking/list",method=RequestMethod.GET)
	public String list(Model model) {
		List<PetSitterJoinFilterVo> alllist=psetsitterservice.alllist();
		for(PetSitterJoinFilterVo x : alllist) {
			System.out.println(x.getPs_email());
		}
		model.addAttribute("alllist", alllist);
		return ".booking.test2";
	}
	@RequestMapping(value="/booking/list",produces="application/json;charset=utf-8")
	@ResponseBody
	public String jsonlist(String lat ,String lng, String leftlat, String leftlng,String rightlat,String rightlng) {
		HashMap<String, String>map = new HashMap<>();
		map.put("lat", lat);
		map.put("lng", lng);
		map.put("leftlat", leftlat);
		map.put("leftlng", leftlng);
		map.put("rightlat", rightlat);
		map.put("rightlng", rightlng);
		List<PetSitterJoinFilterVo> list=psetsitterservice.list(map);
		JSONObject obj=new JSONObject();
		if(list!=null) {
			obj.put("list",list);
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
			PetSitterImageVo vo=new PetSitterImageVo("0","A@A.COM" , savefilename, orgfilename);
			imageService.insert(vo);
			////////////////////////////////////////////////////////////////////////////
			return ".booking.list";
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return "/booking/list";
		}
	}
}
