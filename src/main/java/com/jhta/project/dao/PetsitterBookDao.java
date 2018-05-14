package com.jhta.project.dao;

import java.util.HashMap;
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
	
	public List<PetsitterBookVo> selectPrevList(String m_email){
		return sqlSession.selectList(NAMESPACE+".selectPrevList",m_email);
	}
	
	public List<PetsitterBookVo> selectPbookList(String ps_email){
		return sqlSession.selectList(NAMESPACE+".selectPbookList",ps_email);
	}
	
	public int completeBook(int bk_num) {
		return sqlSession.update(NAMESPACE+".completeBook",bk_num);
	}
	
	public int getPbookCnt(String ps_email) {
		return sqlSession.selectOne(NAMESPACE+".getPbookCnt",ps_email);
	}
	
	public int getBbookCnt(String m_email) {
		return sqlSession.selectOne(NAMESPACE+".getMbookCnt",m_email);
	}
	
	public int getPrevListCnt(String m_email) {
		return sqlSession.selectOne(NAMESPACE+".getPrevListCnt",m_email);
	}
	
	public List<PetsitterBookVo> getBbookCnt2(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".getMbookCnt2",map);
	}
	
	public List<PetsitterBookVo> getPbookCnt2(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".getPbookCnt2",map);
	}
	
	public List<PetsitterBookVo> getPrevListCnt2(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".getPrevListCnt2",map);
	}
}
