package com.jhta.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.PetSitterImageVo;

@Repository
public class PetSitterImageDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.PetSitterImageMapper";
	public int insert(PetSitterImageVo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
}
