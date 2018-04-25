package com.jhta.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.memberDAO;
import com.jhta.project.vo.memberVO;

@Service
public class memberService {

	@Autowired private memberDAO dao;
	
	public int insert(memberVO vo) {
		return dao.insert(vo);
	}
}
