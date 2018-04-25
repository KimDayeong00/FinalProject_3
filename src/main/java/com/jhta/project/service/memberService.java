package com.jhta.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.project.dao.memberDAO;
import com.jhta.project.vo.PetSitterVo;
import com.jhta.project.vo.memberVO;

@Service
public class memberService {

	@Autowired private memberDAO dao;
	
	public int insertM(memberVO vo) {
		return dao.insertM(vo);
	}
	public int insertP(PetSitterVo vo) {
		return dao.insertP(vo);
	}
	
	public int emailc(String email) {
		return dao.emailc(email);
	}
}
