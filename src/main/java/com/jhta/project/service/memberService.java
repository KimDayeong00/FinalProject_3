package com.jhta.project.service;

import java.util.HashMap;
import java.util.Map;

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
	
	public String pwd(Map<String, String> map) {
		return dao.pwd(map);
	}
	
	
	public int emailc_m(String email) {
		return dao.emailc_m(email);
	}
	public int emailc_p(String email) {
		return dao.emailc_p(email);
	}
	
	public memberVO selectMember(String m_email) {
		return dao.selectMember(m_email);
	}
	
	public int updateMember(memberVO vo) {
		return dao.updateMember(vo);
	}
	
	public int updatePwd(memberVO vo) {
		return dao.updatePwd(vo);
	}
	public memberVO infoEmail(String email) {
		return dao.infoEmail(email);
	}
	
	public int pwd_search(Map<String, String> map) {
		return dao.pwd_search(map);
	}
	public int pwd_ok(Map<String, String> map) {
		return dao.pwd_ok(map);
	}
}
