package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.MpetInfoVo;

@Repository
public class MpetInfoDao {
	@Autowired SqlSession sqlSession;
	final String NAMESPACE = "com.jhta.mybatis.MpetInfoMapper";
	
	public List<MpetInfoVo> mypetList(String m_email){
		return sqlSession.selectList(NAMESPACE+".select",m_email);
	}
	
	public int insertMypet(MpetInfoVo vo) {
		return sqlSession.insert(NAMESPACE+".insertPet",vo);
	}
	
	public MpetInfoVo selectPetUpdate(int pi_num) {
		return sqlSession.selectOne(NAMESPACE+".selectPetUpdate",pi_num);
	}
	
	public int updateMypet(MpetInfoVo vo) {
		return sqlSession.update(NAMESPACE+".updatePet",vo);
	}
	
	public List<MpetInfoVo> psbltPet(String m_email){
		return sqlSession.selectList(NAMESPACE+".selectBpetInfo",m_email);
	}
}
