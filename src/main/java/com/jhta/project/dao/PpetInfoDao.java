package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.PetsitterPetVo;

@Repository
public class PpetInfoDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.PpetInfoMapper";
	
	public List<PetsitterPetVo> select(String ps_email) {
		return sqlSession.selectList(NAMESPACE+".select",ps_email);
	}
	
	public int insertPpetInfo(PetsitterPetVo vo) {
		return sqlSession.insert(NAMESPACE+".insertPpet", vo);
	}
	
	public PetsitterPetVo selectPetUpdate(int pi_num) {
		return sqlSession.selectOne(NAMESPACE+".selectPetUpdate",pi_num);
	}
	
	public int petUpdate(PetsitterPetVo vo) {
		return sqlSession.update(NAMESPACE+".updatePpet",vo);
	}
}
