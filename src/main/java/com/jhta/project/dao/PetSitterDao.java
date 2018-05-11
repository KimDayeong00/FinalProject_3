package com.jhta.project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.PetSitterFilterVo;
import com.jhta.project.vo.PetSitterJoinFilterVo;
import com.jhta.project.vo.PetSitterVo;

@Repository
public class PetSitterDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE="com.jhta.mybatis.PetSitterMapper";
	public List<PetSitterJoinFilterVo> list(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".list",map);
	}
	public PetSitterVo select(String ps_email) {
		return session.selectOne(NAMESPACE+".select",ps_email);
	}

	public List<PetSitterJoinFilterVo> alllist(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".alllist",map);
	}
	
	public List<PetSitterFilterVo> getFilter(String ps_email){
		return session.selectList(NAMESPACE+".getFilter",ps_email);
	}
	
	public int updateAccount(PetSitterVo vo) {
		return session.update(NAMESPACE+".updatePsAccount",vo);
	}
	
	public int updatePwd(PetSitterVo vo) {
		return session.update(NAMESPACE+".updatePsPwd",vo);
	}
}
