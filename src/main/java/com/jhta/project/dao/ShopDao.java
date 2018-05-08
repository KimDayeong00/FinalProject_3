package com.jhta.project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.project.vo.ShopClassVo;
import com.jhta.project.vo.ShopFieldVo;
import com.jhta.project.vo.ShopFilterContentVo;
import com.jhta.project.vo.ShopFilterTypeVo;
import com.jhta.project.vo.ShopItemImageVo;
import com.jhta.project.vo.ShopItemJoinVo;
import com.jhta.project.vo.ShopItemReviewVo;
import com.jhta.project.vo.ShopItemVo;

@Repository
public class ShopDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.ShopMapper";
	public List<ShopClassVo> classlist() {
	
		return sqlSession.selectList(NAMESPACE+".classlist");
	}
	
	public List<ShopFieldVo> fieldlist(int classnum){
		return sqlSession.selectList(NAMESPACE+".fieldlist",classnum);
	}
	
	public List<ShopItemVo> itemlist(HashMap<Object, Object> map2){
		return sqlSession.selectList(NAMESPACE+".itemlist",map2);
	}
	
	public List<ShopFilterTypeVo> filtertype(int fieldnum){
		return sqlSession.selectList(NAMESPACE+".filtertype",fieldnum);
	}
	public List<ShopFilterContentVo> filtercontent(int ft_num){
		return sqlSession.selectList(NAMESPACE+".filtercontent",ft_num);
	}
	
	public List<ShopItemVo> classitemlist(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".classitemlist",map);
	}
	
	public List<ShopItemVo> fielditemlist(HashMap<Object,Object> map){
		return sqlSession.selectList(NAMESPACE+".fielditemlist",map);
	}
	
	public int classcnt(int classnum) {
		return sqlSession.selectOne(NAMESPACE+".classcnt",classnum);
	}
	
	public int fieldcnt(int fieldnum) {
		return sqlSession.selectOne(NAMESPACE+".fieldcnt",fieldnum);
	}
	
	public int itemcnt(HashMap<Object, Object> map2){
		return sqlSession.selectOne(NAMESPACE+".itemcnt",map2);
	}
	
	public ShopItemVo iteminfo(int p_num) {
		return sqlSession.selectOne(NAMESPACE+".iteminfo",p_num);
	}
	
	public List<ShopItemReviewVo> itemreview(int p_num) {
		return sqlSession.selectList(NAMESPACE+".itemreview",p_num);
	}
	
	public List<ShopItemImageVo> imglist(int p_num){
		return sqlSession.selectList(NAMESPACE+".imglist",p_num);
	}
	
}
