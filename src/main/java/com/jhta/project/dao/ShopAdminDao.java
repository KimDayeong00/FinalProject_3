package com.jhta.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopItemImageVo;
import com.jhta.project.vo.ShopItemVo;

@Repository
public class ShopAdminDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.ShopAdminMapper";
	
	public List<ShopClassVo> classlist() {
		return sqlSession.selectList(NAMESPACE+".classlist");
	}
	
	public List<ShopFieldVo> fieldlist(int classnum){
		return sqlSession.selectList(NAMESPACE+".fieldlist",classnum);
	}
	
	public int itemadd(ShopItemVo vo) {
		return sqlSession.insert(NAMESPACE+".itemadd",vo);
	}
	
	public int maxpnum() {
		return sqlSession.selectOne(NAMESPACE+".maxpnum");
	}
	
	public int imageadd(ShopItemImageVo vo) {
		return sqlSession.insert(NAMESPACE+".imageadd",vo);
	}
}
