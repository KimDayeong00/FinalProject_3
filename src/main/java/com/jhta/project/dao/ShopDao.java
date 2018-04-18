package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.ShopClassVo;

@Repository
public class ShopDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.ShopMapper";
	public List<ShopClassVo> classlist() {
	
		return sqlSession.selectList(NAMESPACE+".classlist");
	}
}
