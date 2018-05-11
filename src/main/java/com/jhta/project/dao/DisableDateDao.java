package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.DisableDateVo;

@Repository
public class DisableDateDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.DisableDateMapper";
	
	public List<DisableDateVo> getDisable(String ps_email) {
		return sqlSession.selectList(NAMESPACE+".getDisable",ps_email);
	}
	
	public int updateDis(DisableDateVo vo) {
		return sqlSession.update(NAMESPACE+".updateDis",vo);
	}
}
