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
			System.out.println("���°�");
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
		//���۵� ���ϸ� ������
		String orgfilename=file1.getOriginalFilename();
		//������ ���ϸ� �����(�ߺ����� �ʵ���)
		String savefilename=UUID.randomUUID() +"_" + orgfilename;
		try {
			////////////////////// 1.���Ͼ��ε� //////////////////////////////////
			//���۵� ������ �о���� ���� ��Ʈ��
			InputStream is=file1.getInputStream();
			//������ �����ϱ� ���� ���Ͻ�Ʈ����ü
			FileOutputStream fos=new FileOutputStream(uploadPath +"\\" + savefilename);
			//���Ϻ����ϱ�
			FileCopyUtils.copy(is,fos);
			fos.close();
			is.close();
			System.out.println(uploadPath +"\\" + savefilename +" [���Ͼ��ε强��!]");
		    ////////////////////////////////////////////////////////////////////////////
			///////////////////// 2. DB���� ////////////////////////////////////////////
			long filesize=file1.getSize();//����ũ�� ���ϱ�
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
