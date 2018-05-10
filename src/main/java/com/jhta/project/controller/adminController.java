package com.jhta.project.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.adminService;
import com.jhta.project.vo.payVO;

@Controller
public class adminController {

	@Autowired
	private adminService service;

	@RequestMapping("/admin/home")
	public String home() {
		System.out.println("��ó�� ����");
		return ".admin";
	}

	
	//���� �������� �̵��ϱ�
	@RequestMapping("/admin/calc")
	public String calc() {
		System.out.println("��ó�� ����");
		return ".admin.main.calc";
	}
	
	
	
	//���� ���������� ajax �� �׷��� ���� ��
	@RequestMapping("/admin/earn")
	@ResponseBody
	public String earning(String year, String month) {

		/*String start = "20" + year + "-" + month + "-01";
		String end = "20" + year + "-" + month + "-31";
		List<payVO> pList = service.earn(start, end);
		 */
		String createday= year+month;
		List<payVO> pList = service.earn(createday);

		JSONObject jo = new JSONObject();

		jo.put("list", pList);
		jo.put("month", month);
		jo.put("year", year);
			
		return jo.toString();
	}
	
	
	//���� �������� �̵��ϱ�
		@RequestMapping("/admin/mManage")
		public String manage() {
			System.out.println("���� ȸ������");
			return ".admin.main.mManage";
		}
	
}
