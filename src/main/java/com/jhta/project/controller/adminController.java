package com.jhta.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.project.service.adminService;
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

	@RequestMapping("/admin/earn")
	public void earning(String year, String month) {

		String start = "20" + year + "-" + month + "-01";
		String end = "20" + year + "-" + month + "-31";
		List<payVO> pList = service.earn(start, end);
		int index = 0;
		for (int i = 1; i < 32; i++) {
			String dateC = "20" + year + "-" + month + "-";
			if (i < 10) {
				dateC += "0" + i;
			} else {
				dateC += i;
			}
			if (!(pList.get(index).getCreated_date().equals(dateC))) {
				pList.add(new payVO(0, dateC));
			} else {
				index++;
			}
		}
		for (int i = 0; i < pList.size(); i++) {
			for (int j = 0; j < i - 1; j++) {
				int a = Integer.parseInt(pList.get(j).getCreated_date().substring(8, 10));
				int b = Integer.parseInt(pList.get(j + 1).getCreated_date().substring(8, 10));
				if (a > b) {
					payVO temp = pList.get(j);
					pList.add(j, pList.get(j + 1));
					pList.remove(j + 1);
					pList.add(j + 1, temp);
					pList.remove(j + 2);
				}
			}
		}
		
		
	}
}
