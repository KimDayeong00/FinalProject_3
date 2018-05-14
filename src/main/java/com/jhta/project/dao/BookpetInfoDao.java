package com.jhta.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.BookpetInfoVo;

@Repository
public class BookpetInfoDao {
	@Autowired private SqlSession sqlSession;
	final String NAMESPACE = "com.jhta.mybatis.BookpetInfoMapper";
	
	public int insertBpet(BookpetInfoVo vo) {
		return sqlSession.insert(NAMESPACE+".insertBpet",vo);
	}
}
