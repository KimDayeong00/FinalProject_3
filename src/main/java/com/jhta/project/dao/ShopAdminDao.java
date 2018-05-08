package com.jhta.project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.ShopClassJoinShopFieldVo;
import com.jhta.project.vo.ShopItemVo;

@Repository
public class ShopAdminDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.ShopAdminMapper";
	public List<ShopClassJoinShopFieldVo> list() {
		return sqlSession.selectList(NAMESPACE+".list");
	}
	public List<ShopItemVo> itemlist(HashMap<Object, Object>map) {
		return sqlSession.selectList(NAMESPACE+".itemlist",map);
	}
	public int delete(String p_num) {
		return sqlSession.delete(NAMESPACE+".remove",p_num);
	}
	
/*	public List<ShopClassVo> classlist() {
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
	
	
	
	public int itemimage(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE+".itemimage",map);
	}*/
	public int multifile(HashMap<String,Object> map) {
		return sqlSession.insert(NAMESPACE+".multifile",map);
	}
}
