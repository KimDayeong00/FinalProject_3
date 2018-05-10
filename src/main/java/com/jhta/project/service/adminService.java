package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.adminDAO;
import com.jhta.project.dao.memberDAO;
import com.jhta.project.vo.PetSitterVo;
import com.jhta.project.vo.memberVO;
import com.jhta.project.vo.payVO;

@Service
public class adminService {

	@Autowired private adminDAO dao;

	
	public List<payVO> earn(String createday){
		return dao.earn(createday);
	}
	
	
}
