package com.jhta.project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.PetSitterImageVo;

@Repository
public class PetSitterImageDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.PetSitterImageMapper";
	public int insert(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".insert",map);
	}
	public int delete(int pimg_num) {
		return sqlSession.delete(NAMESPACE+".delete",pimg_num);
	}
	
	public List<PetSitterImageVo> getImg (String ps_email) {
		return sqlSession.selectList(NAMESPACE+".getImg",ps_email);
	}
}
