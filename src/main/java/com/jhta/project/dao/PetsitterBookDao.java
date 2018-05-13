package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.MpetInfoVo;
import com.jhta.project.vo.PetsitterBookVo;

@Repository
public class PetsitterBookDao {
	@Autowired SqlSession sqlSession;
	final String NAMESPACE = "com.jhta.mybatis.PetsitterBookMapper";
	
	public List<PetsitterBookVo> selectMbook (String m_email) {
		return sqlSession.selectList(NAMESPACE+".selectMbookList",m_email);
	}
	
	public List<MpetInfoVo> getBpet (int bk_num){
		return sqlSession.selectList(NAMESPACE+".getBpet",bk_num);
	}
	
	public int getBpetCnt (int bk_num) {
		return sqlSession.selectOne(NAMESPACE+".getBpetCnt",bk_num);
	}
	
	public int insertBook (PetsitterBookVo vo) {
		return sqlSession.insert(NAMESPACE+".insertBook",vo);
	}
}
