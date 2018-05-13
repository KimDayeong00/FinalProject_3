package com.jhta.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.ls.LSInput;

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
	
	public List<memberVO> memlist(){
		return dao.memlist();
	}
	
	public List<PetSitterVo> petlist(){
		return dao.petlist();
	}
	
	public int delete_m(String email) {
		return dao.delete_m(email);
	}
	
	public int delete_p(String email) {
		return dao.delete_p(email);
	}
	
	public memberVO mem_update(String email) {
		return dao.mem_update(email);
	}
	public PetSitterVo pet_update(String email) {
		return dao.pet_update(email);
	}
	
	public int updateOK_m(memberVO vo) {
		return dao.updateOK_m(vo);
	}
	public int updateOK_p(PetSitterVo vo) {
		return dao.updateOK_p(vo);
	}
}
