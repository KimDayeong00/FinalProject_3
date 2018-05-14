package com.jhta.project.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.PetSitterVo;
import com.jhta.project.vo.memberVO;

@Repository
public class memberDAO {
	
	@Autowired private SqlSession session;
	
	private final String NAMESPACE = "com.jhta.mybatis.memberMApper";
	
	public int insertM(memberVO vo) {
		return session.insert(NAMESPACE+".insertM", vo);
	}
	

	public int insertP(PetSitterVo vo) {
		return session.insert(NAMESPACE+".insertP", vo);
	}
	
	public int emailc(String email) {
		return session.selectOne(NAMESPACE+".emailc", email);
	}
	
	public int emailc_m(String email) {
		return session.selectOne(NAMESPACE+".emailc_m",email);
	}

	public int emailc_p(String email) {
		return session.selectOne(NAMESPACE+".emailc_p",email);
	}
	
	public memberVO selectMember(String m_email) {
		return session.selectOne(NAMESPACE+".selectMember",m_email);
	}
	
	public int updateMember(memberVO vo) {
		return session.update(NAMESPACE+".updateMember",vo);
	}
	
	public int updatePwd(memberVO vo) {
		return session.update(NAMESPACE+".updatePwd",vo);
	}
	
	public memberVO infoEmail(String email) {
		return session.selectOne(NAMESPACE+".infoEmail",email);
	}
	
	public String pwd(Map<String, String> map) {
		return session.selectOne(NAMESPACE+".pwd", map);
	}
	
	public int pwd_search(Map<String, String> map) {
		return session.selectOne(NAMESPACE+".pwd_search", map);
	}
	
	public int pwd_ok(Map<String, String> map) {
		return session.update(NAMESPACE+".pwd_ok",map);
	}
	
	
}
