package com.jhta.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.ReviewVo;

@Repository
public class ReviewDao {
	@Autowired SqlSession sqlSession;
	final String NAMESPACE = "com.jhta.mybatis.ReviewMapper";
	
	public int insertReview(ReviewVo vo) {
		return sqlSession.insert(NAMESPACE+".insertReview",vo);
	}
	
	public int updateBk_rv(int bk_num) {
		return sqlSession.update(NAMESPACE+".updateBk_rv",bk_num);
	}
	
	public ReviewVo selectRv(int bk_num) {
		return sqlSession.selectOne(NAMESPACE+".selectRv",bk_num);
	}
}
