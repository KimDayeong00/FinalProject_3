package com.jhta.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.project.service.adminService;
import com.jhta.project.vo.PetSitterVo;
import com.jhta.project.vo.memberVO;
import com.jhta.project.vo.payVO;

@Controller
public class adminController {

	@Autowired
	private adminService service;

	@RequestMapping("/admin/home")
	public String home() {
		System.out.println("맨처음 들어옴");
		return ".admin";
	}

	@RequestMapping("/admin/calc")
	public String calc() {
		return ".admin.main.calc";
	}

	@RequestMapping("/admin/earn")
	@ResponseBody
	public String earning(String year, String month) {

		/*
		 * String start = "20" + year + "-" + month + "-01"; String end = "20" + year +
		 * "-" + month + "-31"; List<payVO> pList = service.earn(start, end);
		 */
		String createday = year + month;
		List<payVO> pList = service.earn(createday);

		JSONObject jo = new JSONObject();

		jo.put("list", pList);
		jo.put("month", month);
		jo.put("year", year);

		return jo.toString();
	}

	@RequestMapping("/admin/mManage")
	public String manage(HttpSession session) {
		System.out.println("회원관리들어옴");

		session.setAttribute("petlist", service.petlist());
		session.setAttribute("memlist", service.memlist());

		return ".admin.main.mManage";
	}

	@RequestMapping("/admin/memDel")
	public String manage_del(HttpSession session, String email, String gubun) {
		System.out.println("del email : " + email);
		if (gubun.equals("member")) {
			System.out.println("delete_mem");
			service.delete_m(email);
		} else if (gubun.equals("petsitter")) {
			System.out.println("delete_pet");
			service.delete_p(email);
		}

		session.setAttribute("petlist", service.petlist());
		session.setAttribute("memlist", service.memlist());

		return ".admin.main.mManage";
	}

	@RequestMapping("/admin/update")
	public String update(HttpSession session, String email, String gubun) {
		if (gubun.equals("member")) {
			session.setAttribute("gubun", "member");
			session.setAttribute("member", service.mem_update(email));
		} else if (gubun.equals("petsitter")) {
			session.setAttribute("gubun", "petsitter");
			session.setAttribute("petsitter", service.pet_update(email));
		}

		return ".admin.main.update";
	}

	@RequestMapping("/admin/updateOK_m")
	public String updateOK(HttpSession session, memberVO vo) {
		System.out.println("updateok");
		service.updateOK_m(vo);

		session.setAttribute("petlist", service.petlist());
		session.setAttribute("memlist", service.memlist());

		return ".admin.main.mManage";
	}
	
	@RequestMapping("/admin/updateOK_p")
	public String updateOK(HttpSession session, String ps_email,String ps_name, String ps_phone, String ps_addr1, String ps_addr2) {
		
		System.out.println("updateok");
		PetSitterVo vo = new PetSitterVo();
		vo.setPs_email(ps_email);
		vo.setPs_name(ps_name);
		vo.setPs_phone(ps_phone);
		vo.setPs_addr1(ps_addr1);
		vo.setPs_addr2(ps_addr2);
		System.out.println(vo.toString());
		service.updateOK_p(vo);

		session.setAttribute("petlist", service.petlist());
		session.setAttribute("memlist", service.memlist());

		return ".admin.main.mManage";
	}

}