package com.jhta.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.PetSitterVo;
import com.jhta.project.vo.memberVO;
import com.jhta.project.vo.payVO;

@Repository
public class adminDAO {

@Autowired private SqlSession session;
	
	private final String NAMESPACE = "com.jhta.mybatis.petAdminMapper";
	
	public List<payVO> earn(String createday){
		List<payVO> pList = session.selectList(NAMESPACE+".earn", createday);
		return pList;
	}
	
	public List<payVO> earn_2(String createday){
		List<payVO> pList = session.selectList(NAMESPACE+".earn_2", createday);
		return pList;
	}
	
	public List<memberVO> memlist(){
		List<memberVO> mList = session.selectList(NAMESPACE+".memlist");
		return mList;
	}
	
	public List<PetSitterVo> petlist(){
		List<PetSitterVo> petList = session.selectList(NAMESPACE+".petlist");
		return petList;
	}
	public int delete_m(String email) {
		return session.update(NAMESPACE+".delete_m", email);
	}
	public int delete_p(String email) {
		return session.update(NAMESPACE+".delete_p", email);
	}
	
	
	public memberVO mem_update(String email) {
		return session.selectOne(NAMESPACE+".mem_update", email);
	}
	
	public PetSitterVo pet_update(String email) {
		return session.selectOne(NAMESPACE+".pet_update", email);
	}
	
	public int updateOK_m(memberVO vo) {
		return session.update(NAMESPACE+".updateOK_m", vo);
	}
	
	public int updateOK_p(PetSitterVo vo) {
		return session.update(NAMESPACE+".updateOK_p", vo);
	}
	
}
